
# COMPILER FLAGS
CC = gcc
CCPLUS = g++  
 
CFLAGS = -Wall -pedantic -lpthread -fpermissive
 
OUTPUT_PATH = ./bin/ 
LIBS_PATH = ./libs/

# OBJECTS
COMMON_OBJECTS = processcom.c 
COMMON_OUTPUT = libprocesscom.so
COMMON_LIB = -L$(LIBS_PATH) -lprocesscom

CLIENT_OBJECTS = client.c 
CLIENT_OUTPUT = Client

SERVER_OBJECTS = server.c   
SERVER_OUTPUT = Server
 

# DEPENDENCIES
all: commonlib  client server

 
commonlib: $(COMMON_OBJECTS)
	$(CC) $(COMMON_OBJECTS) -fPIC -shared -o $(COMMON_OUTPUT)
	cp ./$(COMMON_OUTPUT) /usr/lib/
	mv ./$(COMMON_OUTPUT) $(LIBS_PATH)
	ldconfig

client: $(CLIENT_OBJECTS)  
	$(CC) $(CFLAGS) $(OPTIMIZEFLAG) -o $(CLIENT_OUTPUT) $(CLIENT_OBJECTS) $(COMMON_LIB)
	mv ./$(CLIENT_OUTPUT) $(OUTPUT_PATH)
 
server: $(SERVER_OBJECTS)    
	$(CCPLUS)  $(CFLAGS) $(OPTIMIZEFLAG) -o $(SERVER_OUTPUT) $(SERVER_OBJECTS) $(COMMON_LIB)   
	mv ./$(SERVER_OUTPUT) $(OUTPUT_PATH)
	
clean:
	rm -rf $(OUTPUT_PATH)$(SERVER_OUTPUT) $(OUTPUT_PATH)$(CLIENT_OUTPUT) $(LIBS_PATH)$(COMMON_OUTPUT)  
 