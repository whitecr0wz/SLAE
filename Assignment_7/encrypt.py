# Author: SLAE-27812 (Felipe Winsnes)

from Crypto.Cipher import Blowfish
import sys

if len(sys.argv) != 3:

   print "[*] Example: echo -ne <shellcode between quotes> | python encrypt.py <key> <IV number>" + "\r\n"
   sys.exit(1)

obj = Blowfish.new(sys.argv[1], Blowfish.MODE_CBC, sys.argv[2])

message = sys.stdin.read()

ciphertext = obj.encrypt(message)

crypted = ""

for x in bytearray(ciphertext):
  crypted += '\\x'
  ciphertext = '%02x' % x
  crypted += ciphertext

print '"' + crypted + '"'