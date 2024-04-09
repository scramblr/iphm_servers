#!/bin/bash
#
# released 2024
# v0.1
#

echo
echo 'This tool will download the prerequisits and then ask for the server you have tcpdump running on before launching a small test that will prove whether the server is in fact spoofing packets.'
echo 'spoof_check.py does NOT USE CAIDA Spoof Tools or any other tools like it, because we are not dumb. Anyone who uses tools like that are BEGGING for their providers to be shut down.'
echo ''
echo 'Installing scapy and a few other tools...'
echo 'This may take up to 5 minutes.'
apt-get update
apt-get install net-tools bind9-dnsutils inetutils-tools tcpdump python3-scapy -y
echo 'Tool installation complete.'
echo ''
echo ''
echo 'Next, Launch the included spoof_test.py'
echo 'shell$ python3 spoof_test.py 1.2.3.4'
echo
echo

