// including necessary libraries
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "helpers.h"
#include "data.h"
#include <stdint.h>
#include <inttypes.h>
#include <pthread.h> 

// defining paramters
#define SAMPLES 110000
#define WAVELENGTH 64
#define KEYBYTES 8 //number of bytes in the key
#define KEYS 16 //number of possible keys guesses

//#define DEBUG 0  //

// array to hold the correlation factors for each key


uint8_t P[] = {0, 16, 32, 48, 1, 17, 33, 49, 2, 18, 34, 50, 3, 19, 35, 51,
                    4, 20, 36, 52, 5, 21, 37, 53, 6, 22, 38, 54, 7, 23, 39, 55,
                    8, 24, 40, 56, 9, 25, 41, 57, 10, 26, 42, 58, 11, 27, 43, 59,
                    12, 28, 44, 60, 13, 29, 45, 61, 14, 30, 46, 62, 15, 31, 47, 63};
uint8_t invS[] = {0x5, 0xe, 0xf, 0x8, 0xC, 0x1, 0x2, 0xD, 0xB, 0x4, 0x6, 0x3, 0x0, 0x7, 0x9, 0xA};

struct args {
    int keybyte;
    float ** wavedata;
	unsigned int **cipher;
	float * corelation;
};

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
float hamming(uint64_t  M, uint64_t R){

	uint64_t  H=M^R;
	
	// Count the number of set bits
	int dist=0;
	
	while(H){
		dist++; 
		H &= H - 1;
	}
	
	// return the hamming distance
	return (float)dist;
}

unsigned int doInversePermutation(unsigned int x) {
	return x && ((x && 0x08) << 3);
}

void bitwise_xor(unsigned int *array1, const unsigned int *array2, int length) {
    for (int i = 0; i < length; i++) {
        array1[i] ^= array2[i];
    }
}

void apply_permutation(const unsigned int *inv_pLayer, const unsigned int *word, unsigned int *permuted_word) {
    for (int i = 0; i < 64; i++) {
        int index = inv_pLayer[i];
        int byte_index = index / 8;
        int bit_index = index % 8;

		// if(i<2) {
		// 	printf("\n%d, %d, %d, %d\n", i, index, byte_index, bit_index);
		// }

        permuted_word[byte_index] |= ((word[i/8] >> (7-i%8)) & 1) << (7-bit_index);

		// if(i<2) {
		// 	printf("##########################\nword byte : %d\n", word[i/8]);
		// 	printf("after shift : %d\n", (word[i/8] >> (7-i%8)));
		// 	printf("final : %d\n#########################\n", ((word[i/8] >> (7-i%8)) & 1) << (7-bit_index));
		// }
    }
}

uint64_t fromBytesToLong (unsigned int* bytes){
    uint64_t result = 0;
    int i;
    // multiplication with 16 replaced with shifting right 4 times
    // addition replaced with bitwise OR, since one of the operands is always 0
    for (i=0; i<8; i++){
        result = (result << 8) | (bytes[i]&0xFF);
        //result = (result << 4) | (bytes[i].nibble2 & 0xFUL);
    }
    return result;
}

unsigned int* fromLongToBytes (uint64_t block){
    unsigned int* bytes = malloc (8 * sizeof(unsigned int));
    int i;
    // the nibbles for each byte are obtained by shifting the number to the right for appropriate number of places (a multiple of 4)
    // each nibble is obtained after masking the bits by performing bitwise AND with 1111 (all bits except the least significant 4 become 0)
    for (i=0; i<8; i++){
        bytes[i] = (block >> 8*i) & 0xFF;
       // bytes[i].nibble1 = (block >> (2 * (7 - i) + 1) * 4) & 0xFLL;
    }
    return bytes;
}

char* fromLongToHexString (uint64_t block){
    char* hexString = malloc (17 * sizeof(char));
    //we print the integer in a String in hexadecimal format
    sprintf(hexString, "%016llx", block);
    return hexString;
}

uint64_t inversepermute(uint64_t source){
    uint64_t permutation = 0;
    int i;
    for (i=0; i<64; i++){
        int distance = 63 - P[i];
        permutation = (permutation << 1) | ((source >> distance) & 0x1);
    }
    return permutation;
}

void maxCorelation(void * arg ){ //float **wavedata, unsigned int **cipher, int keyguess, int keybyte
	
	// an array to hold the hamming values
	float * hammingArray = malloc(SAMPLES*sizeof(float));
    struct args *c = (struct args *) arg;
	 
	float **wavedata = c->wavedata;
	unsigned int **cipher = c->cipher;
	unsigned int keybyte = c->keybyte;
  

	//printf("%ud\n\n", cipher[0][1]);
	//return;
	//malloc
	int i, k, z;

	//unsigned int word[8];
	//unsigned int permuted_word[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	// Hardcoded array with each byte of the 64-bit key
	//unsigned int key[] = {126, 233, 103, 213, 194, 174, 30, 9};
	unsigned int key[] = {0x07, 0x0e, 0x0e, 0x09, 0x06, 0x07, 0x0d, 0x05, 0x0c, 0x02, 0x0a, 0x0e, 0x01, 0x0e, 0x00, 0x09};
	//7e e9 67 d5 c2 ae 1e 9
    //6d ab 31 74 4f 41 d7 00
	//unsigned int key[] = {0x6d, 0xab, 0x31, 0x74, 0x4f, 0x41, 0xd7, 0x00};
	// keybyte
	for(z=0;z<16;z++){

	key[keybyte] = (unsigned int) z;
	

	// take all the samples into consideration
	for(i=0;i<SAMPLES;i++){

		//unsigned int considered_byte = cipher[i][keybyte];
		uint64_t R31 = 0;
		uint64_t RKey31 = 0;
		
		for(k=0;k<8;k++) {
			R31 = (R31 <<4 |((cipher[i][k])>>4 & 0x0F));
			R31 = (R31 <<4 |(cipher[i][k] & 0x0F));

			RKey31 = (RKey31 <<4 |(key[2*k] & 0x0F));
			RKey31 = (RKey31 <<4 |(key[2*k+1] & 0x0F));
			//RKey31 = (RKey31 <<8 |(key[k] & 0xFF));
 
		}
		
		uint64_t R31IP = inversepermute(R31);
		uint64_t RKey31IP = inversepermute(RKey31);
		//printf("Gkey %lx \n", RKey31IP);
		
		//DEBUG
		#ifdef DEBUG
			char* temp_state= fromLongToHexString(R31);
			printf("STATE:\t\t %s \n",temp_state);
		#endif
		#ifdef DEBUG
			char* temp_rkey= fromLongToHexString(RKey31);
			printf("RKEY:\t\t %s \n",temp_rkey);
		#endif

		uint64_t result_XOR = R31 ^  RKey31;// fromBytesToLong(word);
		
		#ifdef DEBUG
			char* temp_adr= fromLongToHexString(result_XOR);
			printf("ADR:\t\t %s \n",temp_adr);
		#endif

		uint64_t result_invPer= (result_XOR);
		//uint64_t result_invPer= inversepermute(result_XOR);
		
		#ifdef DEBUG
			char* temp_ipr= fromLongToHexString(result_invPer);
			printf("IP:\t\t %s \n",temp_ipr);
		#endif

		uint64_t result_invSbox=0;

		for (int j=7;j>=0;j--){
			unsigned int low_nib = (result_invPer >> (8*j)) & 0x0F;
			unsigned int high_nib = (result_invPer >> (8*j+4)) & 0x0F;
			
			unsigned int high_nib_sbox_inversed = inv_sbox[high_nib];
		    unsigned int low_nib_sbox_inversed = inv_sbox[low_nib];

			result_invSbox = (result_invSbox <<4 | high_nib_sbox_inversed) ;
			result_invSbox = (result_invSbox  <<4 | low_nib_sbox_inversed);

			//printf("%x %x ", high_nib_sbox_inversed, low_nib_sbox_inversed);

		}
		
		#ifdef DEBUG
			char* temp_isb= fromLongToHexString(result_invSbox);
			printf("IS:\t\t %s \n",temp_isb);
		#endif

		// store the hamming distance in the array
		hammingArray[i]=hamming(result_invSbox, R31);

		uint64_t HD = result_invSbox ^ R31;
		
		#ifdef DEBUG
			char* temp_HD= fromLongToHexString(HD);
			printf("HD:\t\t %s \n\n",temp_HD);
		#endif

		// uncomment below lines for debugging purposes
		//printf("haming[%d]=%f\n",i , hammingArray[i] );
		

	}
		
	// initializing variables
	double sigmaWH=0,sigmaW=0,sigmaH=0,sigmaW2=0,sigmaH2=0;

	// check for all samples
	for(i=0;i<SAMPLES;i++){

		// calculate sigmaH and sigmaH2 values
		sigmaH+=hammingArray[i];
		sigmaH2+=hammingArray[i]*hammingArray[i];

		// uncomment below lines for debugging purposes
		// if(keyguess == 5){
		// 	printf("i=%d keybyte(n)=%d keyguess(key)=%d sigmaH=%lf sigmaH2=%lf\n",i,keybyte,keyguess,sigmaH,sigmaH2);
		// }
	}

	// uncomment below lines for debugging purposes
	//printf("sgmaH : %f , sigmaH2 : %f\n",sigmaH, sigmaH2);
	
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

			// printf("%lf ", wavedata[i][j]);

			// uncomment below lines for debuggnig puroposes
			// if(i==10 && keyguess == 65 && j==10){
			// 	printf("i=%d j=%d keybyte(n)=%d keyguess(key)=%d wavedataij=%lf hammingArrayij=%d\n",i,j,keybyte,keyguess,wavedata[i][j],hammingArray[i]);
			// }
		}
		// printf("\n");

		// uncomment below lines for debugging purposes
		// if(keyguess == 65 && j==10){
		// 	printf("j=%d keybyte(n)=%d keyguess(key)=%d sigmaW=%lf sigmaW2=%lf sigmaWH=%lf\n",j,keybyte,keyguess,sigmaW,sigmaW2,sigmaWH);
		// }

		// calculate the numerator and the denominator to calculate the pearson correlation
		double numerator=abs(SAMPLES*sigmaWH - sigmaW*sigmaH);
		double denominator=sqrt(SAMPLES*sigmaW2 - sigmaW*sigmaW)*sqrt(SAMPLES*sigmaH2 - sigmaH*sigmaH);

		// if(keyguess == 20){
		// 	printf("sigmaW=%lf sigmaW2=%lf sigmaWH=%lf  sigmaH=%lf\n",sigmaW,sigmaW2,sigmaWH, sigmaH);
		// 	printf("first = %lf,  second = %lf \n",SAMPLES*sigmaWH, sigmaW*sigmaH);
			// printf("numerator = %f , denominator = %f\n", numerator, denominator);
		// }


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
	  

	c->corelation[z] = max;
	} // for keybyte 0->255
	  // return the maximum value
	  //return max;

	  free(hammingArray);
}

int main(int argc, char *argv[]){

	// for controlling loops
	int i,j;
	
	float **corelation=malloc(sizeof(float*) * KEYBYTES*2);
	checkMalloc(corelation);
	for (i=0; i<KEYBYTES*2; i++){
		corelation[i]=malloc(sizeof(float) * KEYS);
		checkMalloc(corelation[i]);
	}

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
			//printf("%f\n",wavedata[i][j]);
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
	 struct args data[KEYBYTES*2];
	 //struct args data[];// = (struct args*)malloc(sizeof (struct args));

     

	 for(i=0;i<KEYBYTES*2;i++){
	 data[i].wavedata = wavedata;
	 data[i].cipher = cipher;
	 data[i].keybyte = i;
	 data[i].corelation= (float *)corelation[i];
	 }
	//pthread_t tid; 
  
    // Let us create three threads 
    //for (i = 0; i < 3; i++) 
    //    pthread_create(&tid, NULL, myThreadFun, (void *)&tid); 
  
    //pthread_exit(NULL); 
	//for (i=0;i<KEYS;i++){
		pthread_t threads[KEYBYTES*2];
		int rc;
		for(j=0;j<KEYBYTES*2;j++){
			
			rc = pthread_create(&threads[j], NULL, maxCorelation, (void *)&data[j]);
			if (rc)  printf("Error:unable to create thread, %d ", rc);
			//corelation[i][j]=maxCorelation(wavedata, cipher, i, j);
			//maxCorelation(&data[0]);
		}
	//}
   for (j=0;j<KEYBYTES*2;j++) {  
	pthread_join(threads[j], NULL);  
 }  
	


	//maxCorelation((void *)&data[1]);

	// printing the key
	int p=0;
	int positions[KEYBYTES*2][KEYS];
	double n = 0;

	// first sort the results
for(j=0;j<KEYBYTES*2;j++){
		for(i=0;i<KEYS;i++) positions[j][i] =i;
		for (p=0;p<KEYS-1;p++){

			for (i=0;i<KEYS-p-1;i++){

				if(corelation[j][i]<corelation[j][i+1]) { 
					n=corelation[j][i];
					corelation[j][i]=corelation[j][i+1];
					corelation[j][i+1]=n; 
					n=positions[j][i];
					positions[j][i]=positions[j][i+1];
					positions[j][i+1]=n; 
				}
			}
		}
	}

	// then print the key
	for(j=0;j<KEYBYTES*2;j++){
		printf("  |%d|\t",j);
	}
	printf("\n");

	for (i=0;i<KEYS;i++){

		for(j=0;j<KEYBYTES*2;j++){
			printf("  %02x\t",positions[j][i]);
		}
		printf("\n");

		for(j=0;j<KEYBYTES*2;j++){
			printf("%.4f \t",corelation[j][i]);
		}
		printf("\n\n");
	}


}

