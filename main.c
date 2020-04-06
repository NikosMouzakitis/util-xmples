#include <_C.h>
#include <stdint.h>

int main(int argc, char *argv[])
{

	FILE *f;
	f = fopen("data","r");
	if(f == NULL){
		printf("errror\n");
		exit(1);
	}
	printf("open success\n");
	
	unsigned h, l;
	uint64_t val;

	for(int i = 0; i < 100; i++) {
		fscanf(f, "%u %u",&h, &l);
		val = (((uint64_t)h) << 32) | l;	
		printf("%llu\n",val);
	}
	fclose(f);

	return(0);
}
