#include <stdio.h>

/* Edge detector using 
   a finite state machine.	
 
   Nikolaos Mouzakitis

 */
char initial_state = 'f';

int main(int argc, char *argv[])
{
	char *input = "01101111110101000101";
	char current_state, next_state, c;
	int cnt = 0;

	current_state = initial_state;
	printf(" Input: %s\n",input);
	printf("Output: ");

	while( input[cnt] != '\0') {
		
		c = input[cnt];

		switch(current_state) {
		
			case 'f':
				switch(c) {
					case '0':
					       	putchar('0');
						next_state = 'g';
						break;
					case '1':
						putchar('0');
						next_state = 'h';
						break;
				}
				current_state = next_state;
				break;
			case 'g':
				switch(c) {
					case '0':
						putchar('0');
						next_state = 'g';
						break;
					case '1':
						putchar('1');
						next_state = 'h';
						break;
				}
				current_state = next_state;
				break;
			case 'h':
				switch(c) {
					case '0':
						putchar('1');
						next_state = 'g';
						break;
					case '1':
						putchar('0');
						next_state = 'h';
						break;
				}
				current_state = next_state;
				break;
		}
		cnt++;
	}
	putchar('\n');

	return(0);
}
