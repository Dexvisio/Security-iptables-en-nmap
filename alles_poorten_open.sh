#!/bin/bash
# "3	Script waarin je de poorten open zet voor:
#a.	Local host
#b.	Ping
#c.	Poorten voor SSH
#d.	Poorten voor FTP
#e.	Poorten voor SMB
#f.	Poorten voor webverkeer 
# ik zal eerst alle policies op DROP doen en dan ook alle moegelijk bestaand regels verwijderen
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -F

#Localhost -ik kijk naar de powerpoint - er zal geen forwarding zijn. Er zal wel output zijn.
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
echo "localhost done"
#Ping, ook geen forwards
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
echo "Ping done"
#poot voor SSH, ze zijn 22
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
echo "SSH done"
#poort voor FTP, allen poort 21
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 21 -j ACCEPT
echo "FTP done"
#poort voor SMB, ze zijn 445 and 137-139
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 445 -j ACCEPT
iptables -A INPUT -p tcp --dport 137:139 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 137:139 -j ACCEPT
echo "SMB done"
#poort voor webverkeer, ze zijn 80 en 443
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT
echo "websverkeer gedaan!"