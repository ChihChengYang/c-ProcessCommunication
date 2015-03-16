c-ProcessCommunication
================

 
Usage
================

### Build 
 
- make 


### Example

- IPC
+ int client_send_to_listener(char* app_name, void* buf, int buf_size);
+ int server_create_listener(char* name, funCB funp );

- RPC
+ int server_create_listener_net(char* port, funCB funp );
+ int client_send_to_listener_net(char* server_ip, char* port, void* buf, int buf_size);

### Notice 

- Run only on Linux system. 
- server & client run under the same authority.
 