#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

//Userspace program, 
//that maps on its virtual address
//physical memory of the system if possible 
//and performs reads/writes on it.
int main(void)
{
	uint32_t alloc_mem_size, page_mask, page_size;
	void *mem_pointer, *virt_addr;
	const uint32_t mem_size = 0x15000;
	const uint32_t mem_address = 0x7b800000;
	//const uint32_t mem_address = 0x7b7ffff0;
	
	int mem_dev, i;
	unsigned char * tmp;
	mem_dev = open("/dev/mem",O_RDWR | O_SYNC);
	
	if(mem_dev != -1) {
		printf("Opened /dev/mem\n");
		page_size = sysconf(_SC_PAGESIZE);
		alloc_mem_size = (((mem_size / page_size) + 1) * page_size);
		page_mask = (page_size - 1);
		printf("Calling mmap()\n");
		mem_pointer = mmap(NULL, alloc_mem_size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_dev, (mem_address & ~page_mask));

		if(mem_pointer == MAP_FAILED)
		{  
			printf("Error on mmap()\n");
			close(mem_dev);
			return(-1);
		}
		virt_addr = (mem_pointer + (mem_address & page_mask)); 
		printf("Acquired %x for mem_address: %x\n", virt_addr, mem_address);
		tmp = (unsigned char *)virt_addr;
/*
 		///write on the mapped memory
		for(i = 0; i < 0x100; i++) {
			*(tmp + i) = 0;
		}
*/			
		/// read the mapped memory
		for(i = 0; i < 0x100; i++) {
			printf("%x ", *(tmp + i) );
			if( ((i+1) %8) == 0) {
				printf("\n");
			}
		}
		
		printf("closing the /dev/mem\n");	
		close(mem_dev);
	} else {
		printf("/dev/mem open error\n");
		return (-1);
	}	
	printf("exit normal\n");
	return 0;
}
