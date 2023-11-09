// including necessary libraries
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "helpers.h"
#include "data.h"

// defining paramters
#define SAMPLES 40000
#define WAVELENGTH 1024
#define KEYS 32
#define n 16
#define m 4
#define KEYBYTES 1

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
// float hamming(uint8_t *M, uint16_t *R){
// 	// Initialize the Hamming distance to 0.
//     float distance = 0;

//     // Iterate through the bits (32 bits in total).
//     for (int i = 0; i < 32; i++) {
//         // Extract the i-th bit from M and R.
//         uint8_t bit_M = (M[i / 8] >> (7 - (i % 8))) & 0x01;
//         uint8_t bit_R = (R[i / 16] >> (15 - (i % 16))) & 0x01;

//         // Check if the bits differ, and increment the distance if they do.
//         if (bit_M != bit_R) {
//             distance += 1.0;
//         }
//     }

// 	int t;

// 	// for (t=0; t<4; t++) {
// 	// 	printf("%02x ,", M[t]);
// 	// }
// 	// printf("\n");
// 	// for (t=0; t<2; t++) {
// 	// 	printf("%04x ,", R[t]);
// 	// }

// 	// printf("\ndist : %f", distance);
// 	// scanf("%d", &t);
//     return distance;
// }

/*
This function calculates a given bit of first round output of the SIMON cipher
Arguments:
	bit_pos => required bit
	plaintext => plaintext
	key_bit => guessed key bit
	sample_num => number of the sample to get the correct plaintext
Returns: The value of requested bit
*/
uint8_t get_first_round_nth_output_bit(int bit_pos, uint8_t **plaintext, uint8_t key_bit, int sample_num) {

	int term = 0;

	if(bit_pos>=1 && bit_pos<=8){
		term = 3;
	}else{
		term = 2;
	}

	uint8_t R = (plaintext[sample_num][term] >> ((bit_pos-1) % 8)) & 0x01;
	uint8_t L_pos_1 = (13+bit_pos)%16+1;
	uint8_t L_pos_2 = (14+bit_pos)%16+1;
	uint8_t L_pos_3 = (7+bit_pos)%16+1;

	if(L_pos_1>=1 && L_pos_1<=8){
		term = 1;
	}else{
		term = 0;
	}
	uint8_t L1 = (plaintext[sample_num][term] >> ((L_pos_1-1) % 8)) & 0x01;

	if(L_pos_2>=1 && L_pos_2<=8){
		term = 1;
	}else{
		term = 0;
	}
	uint8_t L2 = (plaintext[sample_num][term] >> ((L_pos_2-1) % 8)) & 0x01;

	if(L_pos_3>=1 && L_pos_3<=8){
		term = 1;
	}else{
		term = 0;
	}
	uint8_t L3 = (plaintext[sample_num][term] >> ((L_pos_3-1) % 8)) & 0x01;

	// printf("pos: %x, %x, %x\n", L_pos_1, L_pos_2, L_pos_3);
	// printf("R:%x L1:%x L2:%x L3:%x\n", R, L1, L2, L3);
	return key_bit ^ R ^ L1 ^ (L2 & L3);
}

uint8_t getSecondRoundOutput(uint8_t **plaintext, uint8_t keyguess, int bitPosition, int i) {
	uint8_t L_pos_1 = (13+bitPosition)%16+1;
	uint8_t L_pos_2 = (14+bitPosition)%16+1;
	uint8_t L_pos_3 = (7+bitPosition)%16+1;
	return (keyguess & 0x01)
		^ ((plaintext[i][(1 + bitPosition / 9)] >> ((bitPosition - 1) % 8)) & 0x01)
		^ get_first_round_nth_output_bit(L_pos_1,plaintext,((keyguess >> 3) & 0x01),i) 
		^ (get_first_round_nth_output_bit(L_pos_2,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(L_pos_3,plaintext,((keyguess >> 2) & 0x01),i));
}

float maxCorelation(float **wavedata, uint8_t **plaintext, uint8_t keyguess, int bitPosition){
	
	// an array to hold the hamming values
	int hammingArray[SAMPLES];
	uint16_t output[2];
	int i;

	// take all the samples into consideration
	for(i=0;i<SAMPLES;i++){

		//get the bit 1 of the input to second round
		uint8_t L_2_1 = get_first_round_nth_output_bit(1,plaintext,((keyguess >> 1) & 0x01),i);
		//calculate the bit 1 of the output of second round
		uint8_t L_3_1 = (keyguess >> 0 & 0x01) ^ (plaintext[i][1] & 0x01) ^   get_first_round_nth_output_bit(15,plaintext,((keyguess >> 3) & 0x01),i) 
		^ (get_first_round_nth_output_bit(16,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(9,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_2 = get_first_round_nth_output_bit(bitPosition,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_2 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 1) & 0x01) ^ get_first_round_nth_output_bit(16,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(1,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(10,plaintext,((keyguess >> 2) & 0x01),i));
		
		
		// uint8_t L_2_3 = get_first_round_nth_output_bit(3,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_3 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 2) & 0x01) ^ get_first_round_nth_output_bit(1,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(2,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(11,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_4 = get_first_round_nth_output_bit(4,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_4 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 3) & 0x01) ^ get_first_round_nth_output_bit(2,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(3,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(12,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_5 = get_first_round_nth_output_bit(5,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_5 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 4) & 0x01) ^ get_first_round_nth_output_bit(3,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(4,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(13,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_6 = get_first_round_nth_output_bit(6,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_6 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 5) & 0x01) ^ get_first_round_nth_output_bit(4,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(5,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(14,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_7 = get_first_round_nth_output_bit(7,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_7 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 6) & 0x01) ^ get_first_round_nth_output_bit(5,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(6,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(15,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_8 = get_first_round_nth_output_bit(8,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_8 = (keyguess & 0x01) ^ ((plaintext[i][1] >> 7) & 0x01) ^ get_first_round_nth_output_bit(6,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(7,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(16,plaintext,((keyguess >> 2) & 0x01),i));

		// uint8_t L_2_9 = get_first_round_nth_output_bit(9,plaintext,((keyguess >> 1) & 0x01),i);
		// uint8_t L_3_9 = (keyguess & 0x01) ^ ((plaintext[i][2] >> 0) & 0x01) ^ get_first_round_nth_output_bit(7,plaintext,((keyguess >> 3) & 0x01),i) 
		// ^ (get_first_round_nth_output_bit(8,plaintext,((keyguess >> 4) & 0x01),i) & get_first_round_nth_output_bit(1,plaintext,((keyguess >> 2) & 0x01),i));

		
		// if(i==5) {
		// 	printf("%x, %x, %x, %x \n", plaintext[i][0], plaintext[i][1], plaintext[i][2], plaintext[i][3]);
		// 	printf("%x, %x, %x, %x\n", R_1_1, L_1_15, L_1_16, L_1_9);
		// }

		// get the sbox operation
		// unsigned int st10 = cipher[i][inv_shift[keybyte]];
		// unsigned int st9 = inv_sbox[cipher[i][keybyte]  ^ keyguess] ;

		// store the hamming distance in the array
		hammingArray[i] = L_2_1 ^ L_3_1;
		// hammingArray[i] = L_2_2 ^ L_3_2;
		// hammingArray[i] = L_2_3 ^ L_3_3;
		// hammingArray[i] = L_2_4 ^ L_3_4;
		// hammingArray[i] = L_2_5 ^ L_3_5;
		// hammingArray[i] = L_2_6 ^ L_3_6;
		// hammingArray[i] = L_2_7 ^ L_3_7;
		// hammingArray[i] = L_2_8 ^ L_3_8;
		// hammingArray[i] = L_2_9 ^ L_3_9;



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

		// if we add , abs, we can get the correct value in the first 8 values
		// if we remove abs , we can get the correct value in the first 4 value set or the second 4 value set
		double numerator= abs(SAMPLES*sigmaWH - sigmaW*sigmaH);
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

	//0001 1011, 1000 0100, 0000 1100, 0101 0101


	// uint8_t **plaint=malloc(sizeof(uint8_t*)*1);
	// plaint[0]=malloc(sizeof(uint8_t)*4);

	// plaint[0][0] = 0x1b;
	// plaint[0][1] = 0x84;
	// plaint[0][2] = 0x0c;
	// plaint[0][3] = 0x55;
	//uint8_t keyguess = 0b10111;
	
	// for(int i=1;i<=16;i++){
		
	// 	printf("%x\n\n", get_first_round_nth_output_bit(i, plaint, 0, 0));
	// }

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

	for (i=0;i<10;i++){

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

