#!/bin/sh
#Written by David

#power ip
# iptables -A INPUT -s [Your-IP-Address] -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -d 127.0.0.0/8 -j REJECT

iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#ssh
iptables -A INPUT -p tcp --dport 2237 -j ACCEPT

#shadowsocks
iptables -A INPUT -p tcp --dport 8388 -j ACCEPT
iptables -A INPUT -p udp --dport 8388 -j ACCEPT

iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
