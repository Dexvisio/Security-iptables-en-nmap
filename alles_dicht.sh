#!/bin/bash
#2	Script waarbij alles dicht staat
# alles regels weg
iptables -F
#in powerpoint is input, output, forward, ik ga alles DROP typen.
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP


echo "Alle poorten zijn dicht, GOODBYE."