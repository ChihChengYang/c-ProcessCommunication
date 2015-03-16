 

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <pthread.h>
#include "processcom.h"
 

static int i =0;
void my_recv(unsigned char* buf ,int bufsize){
 
  printf("bufsize %d,%d \n",i++,bufsize);

}

void* SocketHandler(void* lp){

 
	server_create_listener("MONEY", my_recv);
  
}

pthread_t thread_id;

int main(int argc, char *argv[])
{   
 	int temp,t; 
    if((temp = pthread_create(&thread_id,0,&SocketHandler, (void*)&t))==0){
        pthread_detach(thread_id);
    }

    getchar();

	server_stop();
    
	return 0;
}
