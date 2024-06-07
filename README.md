# IPHM (IP Header Modification) AKA IP Spoofing Servers & Testing
_This shows you how to test new servers for IP spoofing capabilities, **without using snitch projects like CAIDA.**_

>**SNITCH PROJECTS LIKE CAIDA ARE THE NUMBER ONE WAY YOU CAN QUICKLY FORCE A ONCE COOL HOSTING PROVIDER TO STOP ALLOWING SPOOFING.**
>**STOP USING THEIR FUCKING SCRIPTS!! USE THIS METHOD BELOW AND NEVER WORRY ABOUT IT AGAIN.**

# SCRAMBLR SPOOFTEST
IP Spoofing / IPHM IP Header Modification Testing

# ----[ Requirements to test for IP Spoofing ]----
You will need: 2 Servers. One random server to send spoofed packets to, and one server that's capable of IP spoofing. You will also need to know how to copy and paste.
# 1.) tcpdump Server: Can be any server that is able to run tcpdump. Does not need to be able to spoof.
# 2.) Your IP Spoof (IPHM) Server, with "scapy" or "python-scapy" installed on it.

**----[ Setup Instructions ]----**
_On DEBIAN, UBUNTU, OR ANY APTITUDE BASED *NIX MACHINES:_
```
apt-get update
 
apt-get install net-tools bind9-dnsutils inetutils-tools tcpdump graphviz python3-scapy -y
 
apt-get install python3-scapy -y
```

_CENTOS, FEDORA, OR OTHER YUM BASED MACHINES:_
```
yum update
 
yum install tcpdump net-tools bind-utils python-pip -y
 
easy_install pip # dont worry if this one doesn't work.
 
pip install scapy
```

_RUNNING SOMETHING ELSE, OR WANT TO INSTALL EVERYTHING VIA SOURCE? OK HAVE FUN!_

**# ----[ End Install Instructions ]----**

**# ----[ Running The Tests To Check For IP Spoofing ]----**
Open an SSH/Terminal session to the host #1 (The tcpdump server) and begin running tcpdump by using the following command.

```
**# ====[ SERVER ONE ]====**
server1$ sudo su - (You will need to run tcpdump as root.)
server1# tcpdump -i eth0 -nnv -c 5000 icmp
```
This will run tcpdump and listen for up to 5,000 ICMP packets. You shouldn't be getting many ICMP packets until we run the next set of commands.

_NOTE: If you get error "tcpdump: eth0: No such device exists" <-- You will need to find the correct name of your interface, check 'ifconfig' or ip addr.
It's likely something similar to ens33 or ens33p1 or some other stupid stuff. :) Replace and try again._

**# ====[ SERVER TWO ]====**
Open another SSH/Terminal session to host #2 (The IP Spoofing Server) and run the following command.

Again, you must be root. Then, run scapy.
```
server# scapy
```
After scapy loads, you'll paste the text below exactly, do not press enter..
```
import random
def randomIP():
	ip = ".".join(map(str, (random.randint(0, 255)for _ in range(4))))
	return ip
send(IP(src=RandIP(),dst="
```
After the dst=" you will paste in your tcpdump server's IP address (Server #1). Then, paste the rest of the code that follows:
```
")/ICMP()/"SPOOFTESTICMP",count=5000)
```
It should look like this if you did it right, for the 5th line:
```
send(IP(src=RandIP(),dst="5.6.7.8")/ICMP()/"SPOOFTESTICMP",count=5000)
```
But instead of 5.6.7.8 it will be Server #1's IP (The tcpdump server's IP). 

Hit enter, and it'll send 5,000 ICMP packets that SHOULD all come from random IP addresses to your tcpdump server. If nothing comes,
or if only one IP address shows up - chances are that your server cannot spoof IP addresses or that you (somehow) managed to screw
up these instructions. You should be ashamed. 

THATS IT. THATS ALL IT TAKES TO NOT SELF-SNITCH TO CAIDA ABOUT YOUR SHINY NEW IP SPOOF SERVER! In order to find this set of instructions
quick when you need them, just google **"scramblr" spooftest ** or github.com/scramblr and it'll always be there.

SCRAMBLR ©MMXXIV
