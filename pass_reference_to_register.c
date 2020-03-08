#include <_C.h>
// should compile with -m 32 on 32bit machines(check it for compiling issues)
int main(int argc, char *argv[])
{
	char *buf="thisistest";
	printf("addr: %x\n",(unsigned int) &buf);	

	asm("mov %0 , %%ebx" ::"g"(&buf));
	//disassembling we observe %ebx containing the address of the buf.
	
	
	//asm("movl %%ebx,%0":"=r"(a));
        register unsigned long a asm("ebx");
	/// got the register %ebx into the C variable a
	printf("a = %x\n", a);  
	
	
	return(0);
}
