#include <_C.h>
#include <stdint.h>
// parsing register, checking for flags, f. e Intel-Arm Statues words registers.
void parse_eflags(uint32_t r)
{
        printf("REGISTER to PARSE: %x\n",r);
        for(int i = 0; i < 32; i++) {
            int res = (r & (uint32_t)(1 << i)) > 0 ? 1 : 0;
            printf("reg.[%d] :-->: %d\n", i, (r & (uint32_t)(1 << i)) > 0 ? 1 : 0);
        }
}
int main(int argc, char *argv[]) {
        uint32_t reg = 0x246;
        parse_eflags(reg);
        return(0);
}
