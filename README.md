# IPHM (IP Header Modification) AKA IP Spoofing Servers & Testing
_This shows you how to test new servers for IP spoofing capabilities, **without using snitch projects like CAIDA.**_

>**SNITCH PROJECTS LIKE CAIDA ARE THE NUMBER ONE WAY YOU CAN QUICKLY FORCE A ONCE COOL HOSTING PROVIDER TO STOP ALLOWING SPOOFING.**
>**STOP USING THEIR FUCKING SCRIPTS!! USE THIS METHOD BELOW AND NEVER WORRY ABOUT IT AGAIN.**

# ---------------[ Requirements to test for IP Spoofing ]---------------
# 1.) tcpdump Server (Throw-Away) That Simply needs to run tcpdump. 
# 2.) Spoof Server that you suspect/hope can IP Spoof AKA has IPHM IP Header Modification turned on.  

On both servers (Debian, Ubuntu, Other Aptitude Based NIX Machines) paste:
```
apt-get update
 
apt-get install net-tools bind9-dnsutils inetutils-tools tcpdump graphviz python3-scapy -y
 
apt-get install python3-scapy -y
```

- OR, for CentOS or other garbage distros 
```
yum update
 
yum install tcpdump net-tools bind-utils python-pip -y
 
easy_install pip # dont worry if this one doesn't work.
 
pip install scapy
```


# ----------------------[ END REQUIREMENTS. ]-----------------------

# ----[ Commands to run on each server to test for IP Spoofing ]----
You will be opening two terminals, side by side. One for SERVER ONE, and one for SERVER TWO. 

# ====[ SERVER ONE ]====
You will run, as root:
```
tcpdump -i eth0 -nnv icmp -c 5000
```

# ====[ SERVER TWO ]====
You will run, as root:
```
server# scapy
```
After scapy loads, you'll scroll to the bottom of this command and swap out YOUR_SERVER_HERE with the IP address from SERVER ONE. 

After that's complete, paste this into scapy:

-------------[ PASTE TEXT BELOW INTO SCAPY ON SPOOF SERVER ]-------------

```
import random

def randomIP():
	ip = ".".join(map(str, (random.randint(0, 255)for _ in range(4))))
	return ip

send(IP(src=RandIP(),dst="YOUR_SERVER_HERE")/ICMP()/"SPOOFTESTICMP",count=5000)

quit()

```
