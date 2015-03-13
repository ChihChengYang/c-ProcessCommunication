#include <stdio.h>
#include <stdlib.h>
#include "processcom.h"

int main(){

 	FILE		*inFile;
	char szSrcFile[256];
	sprintf(szSrcFile,"../test.mp4");
 
	inFile = fopen(szSrcFile, "rb");
	if(inFile==NULL){
		printf("[FAIL OPEN FILE!!!]\n");
		return 1;
	}
 	unsigned char *FrameBuffer = (unsigned char*)malloc(512*1024); 
	int Framesize=-1;	 
 
    static int i =0;
	while (1)
	{
        Framesize = fread (FrameBuffer,1,36500,inFile);

		if( Framesize <= 0  ){
 
			break;
		}
		else
		{
 		 	client_send_to_listener("MONEY", FrameBuffer, Framesize);
		//	client_send_to_listener_net("127.0.0.1", "1234" ,FrameBuffer, Framesize);
		
 
		}
        printf("Framesize %d,%d \n",i++,Framesize);

		usleep(3000);
	}	

//-----------------------------------------  
	fclose(inFile);
//-----------------------------------------
 
	
	return 0;
}

 