#!/usr/bin/env python3
# -*- coding: utf-8 -*-
print("blackout 2024")


import sys
import random
from scapy.all import *

def randomIP():
        ip = ".".join(map(str, (random.randint(0, 255)for _ in range(4))))
        return ip

print("\nAbout to send 5000 random ICMP packets to IP", sys.argv[1])
print("\nAre you logged in to that server and running: tcpdump -i any icmp -nn -c 5000 ?"

send(IP(src=RandIP(),dst=sys.argv[1])/ICMP()/"SPOOFTESTICMP",count=5000)

print("\nCheck the server and see if you got a bunch of ICMPs from random hosts on", sys.argv[1])
