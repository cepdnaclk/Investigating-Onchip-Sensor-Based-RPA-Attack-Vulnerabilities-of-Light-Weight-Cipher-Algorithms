#include <stdio.h>
#include "helpers.cuh"


//Check whether RAM is full
void isMemoryFull(void *ptr){
	if (ptr==NULL){
		fprintf(stderr, "Memory Full.\nYour array is too large. Please try a smaller array.\n");
		exit(EXIT_FAILURE);
	}
}

//check whether file access is ok
void isFileOK(FILE *fp){
	if (fp==NULL){
		perror("A file access error occurred\n");
		exit(EXIT_FAILURE);
	}
}

//get the cuda error
char *getcudaError(cudaError_t error){
    switch (error){

        case cudaErrorMissingConfiguration:
            return "cudaError Missing Configuration";

        case cudaErrorMemoryAllocation:
            return "cudaError in Memory Allocation.. Device memory full. Try a smaller array.";

        case cudaErrorInitializationError:
            return "cudaError Initialization Error";

        case cudaErrorLaunchFailure:
            return "cudaError Launch Failure";

        case cudaErrorPriorLaunchFailure:
            return "cudaError Prior Launch Failure";

        case cudaErrorLaunchTimeout:
            return "cudaError Launch Timeout";

        case cudaErrorLaunchOutOfResources:
            return "cudaError Launch Out Of Resources";

        case cudaErrorInvalidDeviceFunction:
            return "cudaError Invalid Device Function";

        case cudaErrorInvalidConfiguration:
            return "cudaError Invalid Configuration";

        case cudaErrorInvalidDevice:
            return "cudaError Invalid Device";

        case cudaErrorInvalidValue:
            return "cudaError Invalid Value";

        case cudaErrorInvalidPitchValue:
            return "cudaError Invalid Pitch Value";

        case cudaErrorInvalidSymbol:
            return "cudaError Invalid Symbol";

        case cudaErrorMapBufferObjectFailed:
            return "cudaError Map Buffer Object Failed";

        case cudaErrorUnmapBufferObjectFailed:
            return "cudaError UnmapBuffer Object Failed";

        case cudaErrorInvalidHostPointer:
            return "cudaError Invalid Host Pointer";

        case cudaErrorInvalidDevicePointer:
            return "cudaError Invalid Device Pointer";

        case cudaErrorInvalidTexture:
            return "cudaError Invalid Texture";

        case cudaErrorInvalidTextureBinding:
            return "cudaError Invalid Texture Binding";

        case cudaErrorInvalidChannelDescriptor:
            return "cudaError Invalid Channel Descriptor";

        case cudaErrorInvalidMemcpyDirection:
            return "cudaError Invalid Memcpy Direction";

        case cudaErrorAddressOfConstant:
            return "cudaError Address Of Constant";

        case cudaErrorTextureFetchFailed:
            return "cudaError Texture Fetch Failed";

        case cudaErrorTextureNotBound:
            return "cudaError Texture Not Bound";

        case cudaErrorSynchronizationError:
            return "cudaError Synchronization Error";

        case cudaErrorInvalidFilterSetting:
            return "cudaError Invalid Filter Setting";

        case cudaErrorInvalidNormSetting:
            return "cudaError Invalid Norm Setting";

        case cudaErrorMixedDeviceExecution:
            return "cudaError Mixed Device Execution";

        case cudaErrorCudartUnloading:
            return "cudaError Cudart Unloading";

        case cudaErrorUnknown:
            return "cuda Error Unknown";

        case cudaErrorNotYetImplemented:
            return "cudaError Not Yet Implemented";

        case cudaErrorMemoryValueTooLarge:
            return "cudaError Memory Value Too Large";

        case cudaErrorInvalidResourceHandle:
            return "cudaError Invalid Resource Handle";

        case cudaErrorNotReady:
            return "cudaError Not Ready";

        case cudaErrorInsufficientDriver:
            return "cudaError Insufficient Driver";

        case cudaErrorSetOnActiveProcess:
            return "cudaError Set On Active Process";

        case cudaErrorInvalidSurface:
            return "cudaError Invalid Surface";

        case cudaErrorNoDevice:
            return "cudaError No Device";

        case cudaErrorECCUncorrectable:
            return "cudaError ECC Uncorrectable";

        case cudaErrorSharedObjectSymbolNotFound:
            return "cudaError Shared Object Symbol Not Found";

        case cudaErrorSharedObjectInitFailed:
            return "cudaErrorS hared Object Init Failed";

        case cudaErrorUnsupportedLimit:
            return "cudaError Unsupported Limit";

        case cudaErrorDuplicateVariableName:
            return "cudaError Duplicate Variable Name";

        case cudaErrorDuplicateTextureName:
            return "cudaError Duplicate TextureName";

        case cudaErrorDuplicateSurfaceName:
            return "cudaError Duplicate SurfaceName";

        case cudaErrorDevicesUnavailable:
            return "cudaError Devices Unavailable";

        case cudaErrorInvalidKernelImage:
            return "cudaError Invalid Kernel Image";

        case cudaErrorNoKernelImageForDevice:
            return "cudaError NoKernel Image For Device";

        case cudaErrorIncompatibleDriverContext:
            return "cudaError Incompatible Driver Context";

        case cudaErrorPeerAccessAlreadyEnabled:
            return "cudaError PeerAccess Already Enabled";

        case cudaErrorPeerAccessNotEnabled:
            return "cudaErrorPeerAccessNotEnabled";

        case cudaErrorDeviceAlreadyInUse:
            return "cudaError Device Already In Use";

        case cudaErrorProfilerDisabled:
            return "cudaErrorProfilerDisabled";

        case cudaErrorProfilerNotInitialized:
            return "cudaErrorProfilerNotInitialized";

        case cudaErrorProfilerAlreadyStarted:
            return "cudaErrorProfilerAlreadyStarted";

        case cudaErrorProfilerAlreadyStopped:
            return "cudaErrorProfilerAlreadyStopped";
		
		}
		return "<unknown>";
}
		
		
//check whether cuda errors
void checkCudaError(cudaError_t status){
	if (status!=cudaSuccess){
		fprintf(stderr,"Some Error occured in CUDA.\n:%s \nError Code : %d\n",getcudaError(status),status);
		exit(EXIT_FAILURE);
	}
}
