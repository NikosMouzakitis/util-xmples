#include <_C.h>
// should compile with -m 32 on 32bit machines(check it for compiling issues)
int main(int argc, char *argv[])
{
	char *buf="thisistest";
	printf("addr: %x\n",(unsigned int) &buf);	

	asm("mov %0 , %%ebx" ::"g"(&buf));
	//disassembling we observer %ebx containing the address of the buf.
	return(0);
}
