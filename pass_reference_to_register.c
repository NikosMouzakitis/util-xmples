#include <_C.h>

int main(int argc, char *argv[])
{
	char *buf="thisistest";
	printf("addr: %x\n",(unsigned int) &buf);	

	asm("mov %0 , %%ebx" ::"g"(&buf));

	return(0);
}
