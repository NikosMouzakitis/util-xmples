#include <_C.h>

//enum example

typedef enum {
	EnumInitPhaseAfterPciEnumaration = 0x20,
	EnumInitPhaseReadyToBoot	= 0x40
} FSP_INIT_PHASE;

/*
struct NOTIFY_PHASE_PARAMS {
	FSP_INIT_PHASE	Phase;
} tmp;
*/

typedef struct {
	FSP_INIT_PHASE	Phase;
} NOTIFY_PHASE_PARAMS;


int main(int argc, char *argv[])
{

	printf("%d\n",EnumInitPhaseAfterPciEnumaration);
	printf("%d\n",EnumInitPhaseReadyToBoot);
	
	NOTIFY_PHASE_PARAMS tmp;	

	tmp.Phase = EnumInitPhaseReadyToBoot;
	printf("%d \n",tmp.Phase);

	return(0);
}
