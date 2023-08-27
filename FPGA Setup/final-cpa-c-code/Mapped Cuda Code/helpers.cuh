/* helper header file*/
void isMemoryFull(void *ptr);
void isFileOK(FILE *fp);
char *getcudaError(cudaError_t error);
void checkCudaError(cudaError_t status);


