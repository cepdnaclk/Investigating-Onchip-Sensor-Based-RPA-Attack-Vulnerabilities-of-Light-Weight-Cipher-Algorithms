// including necessary libraries
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "helpers.h"
#include "data.h"

// defining paramters
#define SAMPLES 20000
#define WAVELENGTH 1024
#define KEYBYTES 1 //number of bytes in the key
#define KEYS 256 //number of possible keys guesses

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

float maxCorelation(float **wavedata, unsigned int **cipher, int keyguess, int keybyte){
	
	// an array to hold the hamming values
	float hammingArray[SAMPLES];
	int i,k;

	unsigned int word[8];
	unsigned int permuted_word[8] = {0, 0, 0, 0, 0, 0, 0, 0};
	// Hardcoded array with each byte of the 64-bit key
	unsigned int key[] = {126, 233, 103, 213, 194, 174, 30, 9};

	// take all the samples into consideration
	for(i=0;i<SAMPLES;i++){

		unsigned int considered_byte = cipher[i][keybyte];

		//get the word
		for(k=0;k<8;k++) {
			word[k] = cipher[i][k];
		}

		key[keybyte] = keyguess;

		bitwise_xor(word, key, 8);

		apply_permutation(inv_pLayer, word, permuted_word);

		unsigned int player_inversed = permuted_word[keybyte];

		unsigned int first_block = (player_inversed >> 4) && 0x0F;
		unsigned int second_block = player_inversed && 0x0F;

		unsigned int first_block_sbox_inversed = inv_sbox[first_block];
		unsigned int second_block_sbox_inversed = inv_sbox[second_block];

		unsigned int sbox_inversed = (first_block_sbox_inversed << 4) || second_block_sbox_inversed;

		// printf("st10 = %d | keyguess = %d\n", st10, keyguess);
		// printf("anded with key:%02x & %d | player inversed:%02x | sbox_inversed:%02x\n", st9, st9, player_inversed, sbox_inversed);
		// printf("first_block:%02x | second_block:%02x | first_block_sbox_inversed:%02x | second_block_sbox_inversed:%02x\n", first_block, second_block, first_block_sbox_inversed, second_block_sbox_inversed);

		// store the hamming distance in the array
		hammingArray[i]=hamming(sbox_inversed, considered_byte);

		// uncomment below lines for debugging purposes
		//printf("haming[%d]=%d\n",i,hammingArray[i]);
		//printf("%d ==> st10 = %d && st9 = %d keyguess = %d hamming distance = %d \n",i, st10, st9, keyguess, hammingArray[i]);
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

	for (i=0;i<250;i++){

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

