#include <_C.h>

///	difference in size of the two structures
///	using the pack option.

#pragma	pack(1)
struct a {
	char c;
	int d;
	short e;
};
#pragma	pack(4)

struct b {
	char c;
	int d;
	short e;
};

int main(int argc, char *argv[])
{

	struct a tmp1;
	printf(" %ld char , %ld int , %ld short\n", sizeof(char), sizeof(int), sizeof(short));
	printf("%ld size of tmp1\n",sizeof(tmp1));
	struct b tmp2;
	printf("%ld size of tmp2\n",sizeof(tmp2));

	return(0);
}
