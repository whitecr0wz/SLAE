# Author: SLAE64-27812 (Felipe Winsnes)

from Crypto.Cipher import DES3
import sys


def encrypt():

            obj = DES3.new(sys.argv[2], DES3.MODE_CBC, sys.argv[3])
            message = sys.stdin.read()
            ciphertext = obj.encrypt(message)
            crypted = ""

            for x in bytearray(ciphertext):
                           crypted += '\\x'
                           ciphertext = '%02x' % x
                           crypted += ciphertext


            print ' '
            print 'Encrypted shellcode in hex escape sequence:'
            print '"' + crypted + '"'

def decrypt():

            obj = DES3.new(sys.argv[2], DES3.MODE_CBC, sys.argv[3])
            message = sys.stdin.read()
            decrypt = obj.decrypt(message)
            decrypted = ""

            for x in bytearray(decrypt):

                           decrypted += '\\x'
                           decrypt = '%02x' % x
                           decrypted += decrypt

            print ' '
            print 'Original shellcode in hex escape sequence:'
            print '"' + (decrypted) + '"'

if len(sys.argv) != 4:

   print "[*] Example: echo -ne <shellcode between quotes> | python " + sys.argv[0] + " --encrypt <key> <IV number>"
   print "[*] Example: echo -ne <shellcode between quotes> | python " + sys.argv[0] + " --decrypt <key> <IV number>" + "\r\n"

   sys.exit(1)

if sys.argv[1] == "--encrypt":

      encrypt()
      sys.exit(1)

if sys.argv[1] == "--decrypt":

      decrypt()
      sys.exit(1)
