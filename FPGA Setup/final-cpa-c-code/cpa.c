// including necessary libraries
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "helpers.h"
#include "data.h"

// defining paramters
#define SAMPLES 2000
#define WAVELENGTH 1024
#define KEYS 65536
#define n 16
#define m 4
#define KEYBYTES 1

// Cipher Operation Macros
#define shift_one(x_word) (((x_word) << 1) | ((x_word) >> (16 - 1)))
#define shift_eight(x_word) (((x_word) << 8) | ((x_word) >> (16 - 8)))
#define shift_two(x_word) (((x_word) << 2) | ((x_word) >> (16 - 2)))

uint64_t z_seq = 0b0001100111000011010100100010111110110011100001101010010001011111;

// array to hold the correlation factors for each key
float corelation[KEYS][KEYBYTES];

void first_round_out(uint8_t *pt_block, uint16_t key_word, uint16_t *output) {
	uint16_t *y_word = (uint16_t *)malloc(sizeof(uint16_t));
    uint16_t *x_word = (uint16_t *)malloc(sizeof(uint16_t));

    *y_word = *(uint16_t *)pt_block;
    *x_word = *(((uint16_t *)pt_block) + 1);

	uint16_t temp = (shift_one(*x_word) & shift_eight(*x_word)) ^ *y_word ^ shift_two(*x_word);

    // Feistel Cross
    *y_word = *x_word;
    
    // XOR with Round Key
    *x_word = temp ^ key_word;

    output[0] = *y_word;
	output[1] = *x_word;
    //printf("Xi+1 => %04x, Xi+2 => %04x \n", output[0], output[1]);
}

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
float hamming(uint8_t *M, uint16_t *R){
	// Initialize the Hamming distance to 0.
    float distance = 0;

    // Iterate through the bits (32 bits in total).
    for (int i = 0; i < 32; i++) {
        // Extract the i-th bit from M and R.
        uint8_t bit_M = (M[i / 8] >> (7 - (i % 8))) & 0x01;
        uint8_t bit_R = (R[i / 16] >> (15 - (i % 16))) & 0x01;

        // Check if the bits differ, and increment the distance if they do.
        if (bit_M != bit_R) {
            distance += 1.0;
        }
    }

	int t;

	// for (t=0; t<4; t++) {
	// 	printf("%02x ,", M[t]);
	// }
	// printf("\n");
	// for (t=0; t<2; t++) {
	// 	printf("%04x ,", R[t]);
	// }

	// printf("\ndist : %f", distance);
	// scanf("%d", &t);
    return distance;
}


float maxCorelation(float **wavedata, uint8_t **plaintext, uint16_t keyguess, int keybyte){
	
	// an array to hold the hamming values
	int hammingArray[SAMPLES];
	uint16_t output[2];
	int i;

	// take all the samples into consideration
	for(i=0;i<SAMPLES;i++){
		first_round_out(plaintext[i], keyguess, output);
		
		// get the sbox operation
		// unsigned int st10 = cipher[i][inv_shift[keybyte]];
		// unsigned int st9 = inv_sbox[cipher[i][keybyte]  ^ keyguess] ;

		// store the hamming distance in the array
		hammingArray[i]=hamming(plaintext[i], output);

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
	if(argc!=4){
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
	uint8_t **cipher=malloc(sizeof(uint8_t*)*SAMPLES);
	checkMalloc(cipher);
	for (i=0; i<SAMPLES; i++){
		cipher[i]=malloc(sizeof(uint8_t)* (2*n/8));
		checkMalloc(cipher[i]);
	}
	
	// assign ciphertext values to the array
	file=openFile(argv[2],"r");
	for(i=0; i<SAMPLES ;i++){
		for(j=0; j<(2*n/8); j++){
			fscanf(file,"%hhx",&cipher[i][j]);
			// printf("%hhx ", cipher[i][j]);
		}
		// printf("\n");
	}

	//create a 2d array to store plaintext
	uint8_t **plain=malloc(sizeof(uint8_t*)*SAMPLES);
	checkMalloc(plain);
	for (i=0; i<SAMPLES; i++){
		plain[i]=malloc(sizeof(uint8_t)* (2*n/8));
		checkMalloc(plain[i]);
	}
	

	// assign plaintext values to the array
	file=openFile(argv[3],"r");
	for(i=0; i<SAMPLES ;i++){
		for(j=0; j<(2*n/8); j++){
			fscanf(file,"%hhx",&plain[i][j]);
			// printf("%hhx ", plain[i][j]);
		}
		// printf("\n");
	}

	//calculate the correlation max correlation factors for all the keybytes in all the keys
	for (i=0;i<KEYS;i++){
		for(j=0;j<KEYBYTES;j++){
			corelation[i][j]=maxCorelation(wavedata, plain, i, j);
		}
	}

	// printing the key
	int p=0;
	int positions[KEYS][KEYBYTES];
	double x = 0;

	// first sort the results
	for(j=0;j<KEYBYTES;j++){
		
		for(i=0;i<KEYS;i++){ 
			positions[i][j] =i;
		}

		for (p=0;p<KEYS-1;p++){
			for (i=0;i<KEYS-p-1;i++){
				if(corelation[i][j]<corelation[i+1][j]) { 
					x=corelation[i][j];
					corelation[i][j]=corelation[i+1][j];
					corelation[i+1][j]=x; 
					x=positions[i][j];
					positions[i][j]=positions[i+1][j];
					positions[i+1][j]=x; 
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
			printf("  %04x\t",positions[i][j]);
		}
		printf("\n");

		for(j=0;j<KEYBYTES;j++){
			printf("%.4f \t",corelation[i][j]);
		}
		printf("\n\n");
	}


}

