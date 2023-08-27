// including necessary libraries
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "helpers.h"
#include "data.h"

// defining paramters
#define SAMPLES 100
#define WAVELENGTH 2048
#define KEYBYTES 16
#define KEYS 256

// array to hold the correlation factors for each key
float corelation[KEYS][KEYBYTES];

// to get the maximum value in an array
double maximum(double *array,int size){
	double max=array[0];
	int j;
	for (j=1;j<size;j++){
		if (array[j]>max){
			max=array[j];
		}  
	 }
	 return max;
}

// to calculate the hamming distance
float hamming(unsigned int M, unsigned int R){

	unsigned int H=M^R;
	
	// Count the number of set bits
	int dist=0;
	
	while(H){
		dist++; 
		H &= H - 1;
	}
	
	// return the hamming distance
	return (float)dist;
}


float maxCorelation(float **wavedata, unsigned int **cipher, int keyguess, int keybyte){
	
	// an array to hold the hamming values
	int hammingArray[SAMPLES];
	int i;

	// take all the samples into consideration
	for(i=0;i<SAMPLES;i++){
	
	// get the sbox operation
	unsigned int st10 = cipher[i][inv_shift[keybyte]];
	unsigned int st9 = inv_sbox[cipher[i][keybyte]  ^ keyguess] ;

	// store the hamming distance in the array
	hammingArray[i]=hamming(st9,st10);

	// uncomment below lines for debugging purposes
	//printf("haming[%d]=%f\n",i,hammingArray[i]);
	// if(keyguess == 65){
	// 	printf("i=%d keybyte(n)=%d keyguess(key)=%d dist=%d\n",i,keybyte,keyguess,hammingArray[i]);
	// }

	}

	// initializing variables
	double sigmaWH=0,sigmaW=0,sigmaH=0,sigmaW2=0,sigmaH2=0;

	// check for all samples
	for(i=0;i<SAMPLES;i++){

		// calculate sigmaH and sigmaH2 values
		sigmaH+=hammingArray[i];
		sigmaH2+=hammingArray[i]*hammingArray[i];

		// uncomment below lines for debugging purposes
		// if(keyguess == 34){
		// 	printf("i=%d keybyte(n)=%d keyguess(key)=%d sigmaH=%lf sigmaH2=%lf\n",i,keybyte,keyguess,sigmaH,sigmaH2);
		// }
	}

	// uncomment below lines for debugging purposes
	// printf("sgmaH : %f , sigmaH2 : %f\n",sigmaH, sigmaH2);
	
	// get an array to store corelations values
	double corelations[WAVELENGTH];
	int j;

	// get all the values for wavelength
	for(j=0;j<WAVELENGTH;j++){

		// to store each value for wavelength
		sigmaW=0;sigmaW2=0;sigmaWH=0;

		// check for each sample and calculate values by summing them up
		for(i=0;i<SAMPLES;i++){
			sigmaW+=wavedata[i][j];
			sigmaW2+=wavedata[i][j]*wavedata[i][j];
			sigmaWH+=wavedata[i][j]*hammingArray[i];

			// uncomment below lines for debuggnig puroposes
			// if(i==10 && keyguess == 65 && j==10){
			// 	printf("i=%d j=%d keybyte(n)=%d keyguess(key)=%d wavedataij=%lf hammingArrayij=%d\n",i,j,keybyte,keyguess,wavedata[i][j],hammingArray[i]);
			// }
		}

		// uncomment below lines for debugging purposes
		// if(keyguess == 65 && j==10){
		// 	printf("j=%d keybyte(n)=%d keyguess(key)=%d sigmaW=%lf sigmaW2=%lf sigmaWH=%lf\n",j,keybyte,keyguess,sigmaW,sigmaW2,sigmaWH);
		// }

		// calculate the numerator and the denominator to calculate the pearson correlation
		double numerator=abs(SAMPLES*sigmaWH - sigmaW*sigmaH);
		double denominator=sqrt(SAMPLES*sigmaW2 - sigmaW*sigmaW)*sqrt(SAMPLES*sigmaH2 - sigmaH*sigmaH);

		// assign a very small value to denominator if its 0, otherwise it will output nan
		if(denominator==0.0){
			corelations[j]=0.00001;
			continue;
		}

		// calculate and assign p.c. to the array
		corelations[j]=numerator/denominator;
	  }
	  
	  // get the maxium value of the correlations
	  float max=maximum(corelations,WAVELENGTH);

	  // return the maximum value
	  return max;
}

int main(int argc, char *argv[]){

	// for controlling loops
	int i,j;

	//check args
	if(argc!=3){
		fprintf(stderr,"%s\n", "Not enough args. eg ./cpa wavedata.txt cipher.txt");
		exit(EXIT_FAILURE);
	}
	
	//create a 2d array to store wavedata
	float **wavedata=malloc(sizeof(float*) * SAMPLES);
	checkMalloc(wavedata);
	for (i=0; i<SAMPLES; i++){
		wavedata[i]=malloc(sizeof(float) * WAVELENGTH);
		checkMalloc(wavedata[i]);
	}
	
	// assign wavedata values to the array
	FILE *file=openFile(argv[1],"r");
	for(i=0; i<SAMPLES ;i++){
		for(j=0; j<WAVELENGTH; j++){

			// read the data as a float
			float data;
			fread((void*)(&data),sizeof(data),1,file); 
			wavedata[i][j]=data;

			// uncomment below line for debugging purposes
			// printf("%f\n",wavedata[i][j]);
		}
	}
	
	//create a 2d array to store ciphertexts
	unsigned int **cipher=malloc(sizeof(unsigned int*)*SAMPLES);
	checkMalloc(cipher);
	for (i=0; i<SAMPLES; i++){
		cipher[i]=malloc(sizeof(unsigned int)*KEYBYTES);
		checkMalloc(cipher[i]);
	}
	
	// assign ciphertext values to the array
	file=openFile(argv[2],"r");
	for(i=0; i<SAMPLES ;i++){
		for(j=0; j<KEYBYTES; j++){
			fscanf(file,"%x",&cipher[i][j]);
		}
	}

	// calculate the correlation max correlation factors for all the keybytes in 
	// all the keys
	for (i=0;i<KEYS;i++){
		for(j=0;j<KEYBYTES;j++){
			corelation[i][j]=maxCorelation(wavedata, cipher, i, j);
		}
	}

	// printing the key
	int p=0;
	int positions[KEYS][KEYBYTES];
	double n = 0;

	// first sort the results
	for(j=0;j<KEYBYTES;j++){
		for(i=0;i<KEYS;i++) positions[i][j] =i;
		for (p=0;p<255;p++){

			for (i=0;i<KEYS-p-1;i++){

				if(corelation[i][j]<corelation[i+1][j]) { 
					n=corelation[i][j];
					corelation[i][j]=corelation[i+1][j];
					corelation[i+1][j]=n; 
					n=positions[i][j];
					positions[i][j]=positions[i+1][j];
					positions[i+1][j]=n; 
				}
			}
		}
	}

	// then print the key
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
			printf("%.4f \t",corelation[i][j]);
		}
		printf("\n\n");
	}


}

