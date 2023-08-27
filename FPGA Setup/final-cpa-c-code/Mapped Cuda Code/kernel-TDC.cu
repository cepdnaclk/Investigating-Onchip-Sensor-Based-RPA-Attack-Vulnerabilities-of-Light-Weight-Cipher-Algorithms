#include <stdio.h>
#include "helpers.cuh"
#include "data.cuh"
#include <string>
#include <cuda.h>

// parameters for mapping with c code
// #define SAMPLES 20000    
// #define WAVELENGTH 2048 
// #define TOTAL  2048		
// #define KEYBYTES 16
// #define KEYS 256
// #define CHUNK 2048	

#define SAMPLES 20000    // samples * wavelength  must to be less than 50,000,00
#define WAVELENGTH 2048 // length of processed sampling points at a time
#define TOTAL  2048		// total samplings in a power trace  // 280 for lattice 1024 for giii
#define KEYBYTES 16
#define KEYS 256
#define CHUNK 2048	// number of chunk which must be loaded in to memory. chunk = wavelength *X ; x is an in

						//samples * CHUNK  must to be less than 4,000,000,000 this limit is from ram

__device__ byte hammingweight(byte M, byte R);
__device__ byte hamming(unsigned int *cipher, unsigned int i,unsigned int n,unsigned int key);
__global__ void maxCorelationkernel(double *corelation,double *wavestat,double *wavestat2,double *hammingstat);
__global__ void wavestatkernel(double *wavedata, double *wavestat,double *wavestat2,byte *hammingArray);
__global__ void hammingkernel(unsigned int *cipher,byte *hammingArray,double *hammingstat);

int main(int argc, char *argv[]){


	//cudaSetDevice(0);
	//unsigned char dat;
	float dat;
		
	unsigned int i,j,k,temp;
	//int l=atoi(argv[3]);
	//char filename[80];
	//strcpy(filename,"final");
	//strcpy(filename,l+"");
	//strcpy(filename,".txt");
	FILE *file;
	// empty the file. 
	file=fopen("all.txt","w");
	fprintf(file,"");
	fclose(file);
	
	double *MAXCorrelation=(double *)malloc(sizeof(double) * KEYS* KEYBYTES);
	isMemoryFull(MAXCorrelation);
	for (i=0;i<KEYS;i++){
		for(j=0;j<KEYBYTES;j++){
			MAXCorrelation[i*KEYBYTES+j]=0;
		}
	}
	
	//check args
	if(argc!=4){
		fprintf(stderr,"%s\n", "Not enough args. eg ./cpa wavedata.txt cipher.txt");
		exit(EXIT_FAILURE);
	}
	

	
	unsigned int *cipher=(unsigned int *)malloc(sizeof(unsigned int)*SAMPLES*KEYBYTES);
	isMemoryFull(cipher);

double *readWaveData=(double *)malloc(sizeof(double) * SAMPLES*CHUNK);
	isMemoryFull(readWaveData);
//space for corelation
	double *corelation=(double *)malloc(sizeof(double) * KEYS * KEYBYTES);
	isMemoryFull(corelation);
	
	
//get cipher texts
			
	file=fopen(argv[2],"r");
	isFileOK(file);
	for(i=0; i<SAMPLES ;i++){
		for(j=0; j<KEYBYTES; j++){
			fscanf(file,"%X",&cipher[(i/1)*KEYBYTES+j]);
			// fprintf(stderr,"%x ",cipher[i*KEYBYTES+j]);
		}
		//fprintf(stderr,"%s","\n");
	}

	int numOfChunks=TOTAL/CHUNK;

	int l=0;

	for(l=0;l<numOfChunks;l++){	

		file=fopen(argv[1],"r");
		isFileOK(file);
		unsigned int rounds=TOTAL/WAVELENGTH;
		if(TOTAL%WAVELENGTH!=0) rounds++;
		int fileLength = strlen(argv[1]);
		char extention[4];
		strncpy(extention,argv[1]+fileLength-4,4) ;
		
		//if(strcmp(extention,"data") ==0 ){
		
		if(1){
	    	fprintf(stderr,"%s\n",".data file is detected");
			//unsigned char  dat;
			//float dat;
			/////////////////////	file read
			//fseek(file,sizeof(float)*CHUNK*l,SEEK_CUR);
			for(i=0; i<1*SAMPLES ;i++){
		   		
				while(temp<CHUNK*l) {
					fread((void*)(&dat),sizeof(dat),1,file); 
					temp++;
				}
		  
				temp=0;

				for(j=0; j<CHUNK; j++){
					fread((void*)(&dat),sizeof(dat),1,file);
					readWaveData[(i/1)*CHUNK+j]=(double)(dat);
					// fprintf(stderr,"%f ",dat);
				}

				//fseek(file,sizeof(float)*(TOTAL-CHUNK),SEEK_CUR);
				while(temp<TOTAL-(CHUNK*(l+1))) {
					fread((void*)(&dat),sizeof(dat),1,file); temp++;
				}
				temp=0;
			}
		}else{

			long int dat;
			fprintf(stderr,"%s\n",".txt file is detected");

			for(i=0; i<SAMPLES ;i++){
				for(j=0; j<WAVELENGTH; j++){
					fscanf(file,"%d",&dat); readWaveData[i*CHUNK+j]=(double)dat; 
					printf("else\n");
					fprintf(stdout,"%ld ",dat);
				}
			}

		}

		unsigned int insideRounds=CHUNK/WAVELENGTH;
		if(CHUNK%WAVELENGTH!=0) insideRounds++;

		for(k=0;k<insideRounds;k++){   /// main loop

			//get wave data
			double *wavedata=(double *)malloc(sizeof(double) * SAMPLES*  WAVELENGTH);

			isMemoryFull(wavedata);
			fprintf(stderr,"%s %d %d \n","calculating", l,k);

			for(i=0; i<SAMPLES ;i++){

				for(j=0; j<WAVELENGTH; j++){
					double value1= readWaveData[i*CHUNK+j+k*WAVELENGTH];
					wavedata[i*WAVELENGTH+j] =value1;
				// memcpy(wavedata+(i*sizeof(double)), readWaveData+(i*sizeof(double)), sizeof(double));
				}

			}

			//Time
			//cudaEvent_t start,stop;
			float elapsedtime;
			//cudaEventCreate(&start);
			//cudaEventRecord(start,0);
			//cudaSetDevice(1);
			//cuda arrays and copying
			double *dev_wavedata;
			unsigned int *dev_cipher;
			double *dev_corelation,*dev_wavestat,*dev_wavestat2,*dev_hammingstat;
			byte *dev_hammingArray;
			cudaMalloc((void**)&dev_wavedata, 1L*SAMPLES*WAVELENGTH*sizeof(double));
			cudaMalloc((void**)&dev_cipher, 1L*SAMPLES*KEYBYTES*sizeof(unsigned int));
			cudaMalloc((void**)&dev_corelation, KEYS*KEYBYTES*sizeof(double));
			cudaMalloc((void**)&dev_hammingArray, 1L*KEYS*KEYBYTES*SAMPLES*sizeof(byte));
			cudaMalloc((void**)&dev_wavestat, 2*WAVELENGTH*sizeof(double));
			cudaMalloc((void**)&dev_wavestat2, 1L*KEYS*KEYBYTES*WAVELENGTH*sizeof(double));
			cudaMalloc((void**)&dev_hammingstat, 2*KEYS*KEYBYTES*sizeof(double));
			
			cudaMemcpy(dev_wavedata,wavedata,1L*SAMPLES*WAVELENGTH*sizeof(double),cudaMemcpyHostToDevice);
			cudaMemcpy(dev_cipher,cipher, 1L*SAMPLES*KEYBYTES*sizeof(unsigned int),cudaMemcpyHostToDevice);

			dim3 grid(KEYBYTES/16,KEYS/16);
			dim3 block(16,16);

			//findhamming
			hammingkernel<<<grid,block>>>(dev_cipher,dev_hammingArray,dev_hammingstat);
			cudaGetLastError();

			dim3 block3d(16,16,4);
			dim3 grid3d(KEYBYTES/16,KEYS/16,WAVELENGTH/4);
			
			//find wave stats
			wavestatkernel<<<grid3d,block3d>>>(dev_wavedata,dev_wavestat,dev_wavestat2,dev_hammingArray);
			cudaGetLastError();

			//deploy double 
			maxCorelationkernel<<<grid,block>>>(dev_corelation,dev_wavestat,dev_wavestat2,dev_hammingstat);
			cudaGetLastError();

			//copy back
			cudaMemcpy(corelation,dev_corelation,KEYS*KEYBYTES*sizeof(double),cudaMemcpyDeviceToHost);

			// for(i=0;i<100;i++){
			// 	fprintf(stdout,"%d %f \n",i,corelation[i]);
			// }

			cudaFree(dev_wavedata);
			cudaFree(dev_cipher);
			cudaFree(dev_corelation);
			cudaFree(dev_wavestat);
			cudaFree(dev_wavestat2);
			cudaFree(dev_hammingstat);
			cudaFree(dev_hammingArray);

			//Time
			//cudaEventCreate(&stop);
			//cudaEventRecord(stop,0);
			//cudaEventSynchronize(stop);
			//cudaEventElapsedTime(&elapsedtime,start,stop);
			//fprintf(stderr,"Time spent for CUDA operation : %.10f\n",elapsedtime/(float)1000);

			//char finishtime[30];
			//time_t stopRound=time(NULL);
			//struct tm *loctime;
			//loctime = localtime (&stopRound);
			//strftime (finishtime, 30, "%Y-%m-%d %H:%M:%S", loctime);
			
			file=fopen("all.txt","a");
			fprintf(file,"\n");
			//fprintf(file,"%s \n",finishtime);
			fprintf(file,"%d,  pk0,  pk1,  pk2,  pk3,  pk4,  pk5,  pk6,  pk7,  pk8,  pk9, pk10, pk11, pk12, pk13, pk14, pk15, \n",SAMPLES);
			
			for (i=0;i<KEYS;i++){
				fprintf(file,"0x%02X,",i);
				for(j=0;j<KEYBYTES;j++){
					fprintf(file,"%.4f,",i,corelation[i*KEYBYTES+j]);
					double value1 =MAXCorrelation[i*KEYBYTES+j];
					double value2 = corelation[i*KEYBYTES+j];
				
					if(value1<value2){
						MAXCorrelation[i*KEYBYTES+j] = value2;			
					}
				}
				fprintf(file,"\n");
			}

			fprintf(file,"\n");
			fclose(file);
			free(wavedata);
		}
	}







	free(readWaveData);
	double finalCorrelations[KEYS][KEYBYTES];
	double n=0; int positions[KEYS][KEYBYTES];
	char finishtime[30];
 	time_t stop=time(NULL);
	//finishtime= ctime(&stop);  
	struct tm *loctime;
	loctime = localtime (&stop);
	strftime (finishtime, 30, "%Y-%m-%d %H:%M:%S", loctime);
	
	
	// write the csv file
	file=fopen("final.txt","a");
	fprintf(file,"\n");
	fprintf(file,"%s \n",finishtime);
	fprintf(file,"%d,  pk0,  pk1,  pk2,  pk3,  pk4,  pk5,  pk6,  pk7,  pk8,  pk9, pk10, pk11, pk12, pk13, pk14, pk15, \n",SAMPLES);
	
	for (i=0;i<KEYS;i++){
		fprintf(file,"0x%02X,",i);
		for(j=0;j<KEYBYTES;j++){
			fprintf(file,"%.4f,",MAXCorrelation[i*KEYBYTES+j]);
			finalCorrelations[i][j]=MAXCorrelation[i*KEYBYTES+j];
		}
		fprintf(file,"\n");
	}

	////////////////////////////// sort the results /// 

	int p=0;
	for(j=0;j<KEYBYTES;j++){
		for(i=0;i<KEYS;i++) positions[i][j] =i;
		for (p=0;p<255;p++){

			for (i=0;i<KEYS-p-1;i++){

				if(finalCorrelations[i][j]<finalCorrelations[i+1][j]) { 
					n=finalCorrelations[i][j];
					finalCorrelations[i][j]=finalCorrelations[i+1][j];
					finalCorrelations[i+1][j]=n; 
					n=positions[i][j];
					positions[i][j]=positions[i+1][j];
					positions[i+1][j]=n; 
				}
			}
		}
	}

	for(j=0;j<KEYBYTES;j++){
		printf("  |%d|\t",j);
	}
	printf("\n");

	for (i=0;i<5;i++){

		for(j=0;j<KEYBYTES;j++){
			printf("  %02x\t",positions[i][j]);
		}
		printf("\n");

		for(j=0;j<KEYBYTES;j++){
			printf("%.4f \t",finalCorrelations[i][j]);
		}
		printf("\n\n");
	}

	return 0;
}


__device__ byte hammingweight(byte M, byte R){
	byte H=M^R;
	// Count the number of set bits
	byte dist=0;
	while(H){
		dist++; 
		H &= H - 1;
}
	

	return dist;
}

__device__ byte hamming(unsigned int *cipher, unsigned int i,unsigned int n,unsigned int key) { //n is byteno  i is the sample
      byte st10 = (byte)cipher[i*KEYBYTES+inv_shift[n]];
      byte st9 = (byte)inv_sbox[cipher[i*KEYBYTES+n]  ^ key] ;
      byte st19 = (byte)(inv_sbox[cipher[i*KEYBYTES+inv_shift[n] ]  ^ key]) ;

//   byte st9 = (byte)((tbox[cipher[i*KEYBYTES+n]  ^ key]>>24));
//   byte st9 = (byte)(inv_sbox[cipher[i*KEYBYTES+n]  ^ key ]);
//  byte st10 = (byte)(cipher[i*KEYBYTES+n] ^key );

//	byte dist=0;
//if((st9 ^ st10) & 0x0FF)
//idf((st9 ^ st10) & 0x0)
//		 dist= 1;
//	else
//		 dist= 0;  

   byte dist = hammingweight(st9,st10);
//    if(key==65){
// 		printf("i=%d n=%d key=%d dist=%d\n",i,n,key,dist);
//    }
 

// byte dist = hammingweight(st9&0xf0,st10&0xf0);	  
//   byte dist = hammingweight(st9&0x01,0);
// byte dist = hammingweight(st19 ,0);

//  byte dist = hammingweight(st9, 0);
//

	return dist;
}


__global__ void maxCorelationkernel(double *corelation,double *wavestat,double *wavestat2,double *hammingstat){
	
	int keyguess=blockDim.y*blockIdx.y+threadIdx.y;
	int keybyte=blockDim.x*blockIdx.x+threadIdx.x;

	if (keybyte<KEYBYTES && keyguess<KEYS ){ 
		
		double sigmaH,sigmaH2,sigmaW=0,sigmaW2=0,sigmaWH=0;	
		sigmaH=hammingstat[KEYBYTES*keyguess+keybyte];
		sigmaH2=hammingstat[KEYS*KEYBYTES+KEYBYTES*keyguess+keybyte];
		double temp_corelation=0;;
		double corelationmax=0;;
		unsigned int j;
		for(j=0;j<WAVELENGTH;j++){
			
			sigmaW=wavestat[j];
			sigmaW2=wavestat[WAVELENGTH+j];
			sigmaWH=wavestat2[j*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte];

			// if(keyguess == 65 && j==10){
			// 	printf("j=%d keybyte(n)=%d keyguess(key)=%d sigmaW=%lf sigmaW2=%lf sigmaWH=%lf\n",j,keybyte,keyguess,sigmaW,sigmaW2,sigmaWH);
			// }

			double numerator=SAMPLES*sigmaWH - sigmaW*sigmaH;
			double denominator=sqrt(SAMPLES*sigmaW2 - sigmaW*sigmaW)*sqrt(SAMPLES*sigmaH2 - sigmaH*sigmaH);
			
			// if(keyguess == 65 && j==10){
			// 	printf("j=%d keybyte(n)=%d keyguess(key)=%d numerator=%f denominator=%f\n",j,keybyte,keyguess,numerator,denominator);
			// }
			
			temp_corelation=fabs(numerator/denominator);
		
			if(temp_corelation>corelationmax){
				corelationmax=temp_corelation;
			}
		}

		corelation[keyguess*KEYBYTES+keybyte]=corelationmax;
	}
	return;
}

__global__ void wavestatkernel(double *wavedata, double *wavestat,double *wavestat2,byte *hammingArray){

	int keyguess=blockDim.y*blockIdx.y+threadIdx.y;
	int keybyte=blockDim.x*blockIdx.x+threadIdx.x;
	int wave=blockDim.z*blockIdx.z+threadIdx.z;

	if (keyguess<KEYS && keybyte<KEYBYTES && wave<WAVELENGTH ){
		unsigned int i;
		double sigmaWH=0;
		for(i=0;i<SAMPLES;i++){
			sigmaWH+=wavedata[i*WAVELENGTH+wave]*(double)hammingArray[i*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte];
			// if(i==10 && keyguess == 65 && wave==10){
			// 	printf("i=%d j=%d keybyte(n)=%d keyguess(key)=%d wavedataij=%lf hammingArrayij=%lf\n",i,wave,keybyte,keyguess,wavedata[i*WAVELENGTH+wave],hammingArray[i*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte]);
			// }
		}
		wavestat2[wave*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte ]=sigmaWH;
	}

	if (keyguess==0 && keybyte==0 && wave<WAVELENGTH ){
		unsigned int i;
		double sigmaW=0,sigmaW2=0,W=0;
		for(i=0;i<SAMPLES;i++){
			W=wavedata[i*WAVELENGTH+wave];
			sigmaW+=W;
			sigmaW2+=W*W;
			
		}
		if(wave==0){
			printf("wave = %d sigmaW = %lf sigmaW2 = %lf \n",wave,sigmaW,sigmaW2);
		}
		wavestat[wave]=sigmaW;
		wavestat[WAVELENGTH+wave]=sigmaW2;
	}
	return;
}

__global__ void hammingkernel(unsigned int *cipher,byte *hammingArray,double *hammingstat){
	int keyguess=blockDim.y*blockIdx.y+threadIdx.y;
	int keybyte=blockDim.x*blockIdx.x+threadIdx.x;

	if (keybyte<KEYBYTES && keyguess<KEYS ){
		double sigmaH=0,sigmaH2=0;
		byte H;
		unsigned int i;
		for(i=0;i<SAMPLES;i++){
			H=hamming(cipher,i,keybyte,keyguess);
			hammingArray[i*KEYS*KEYBYTES + keyguess*KEYBYTES + keybyte]=H;
			sigmaH+=(double)H;
			sigmaH2+=(double)H*(double)H;

			// if(keyguess==34){
			// 	printf("i=%d keybyte=%d keyguess=%d sigmaH=%lf sigmaH2=%lf\n",i,keybyte,keyguess,sigmaH,sigmaH2);
			// }

		}
		hammingstat[KEYBYTES*keyguess+keybyte]=sigmaH;
		hammingstat[KEYS*KEYBYTES+KEYBYTES*keyguess+keybyte]=sigmaH2;
	}
	return;
}

