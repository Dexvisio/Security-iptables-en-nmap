#!/bin/bash
#1	Script waarbij alles open staat
# alles regels weg
iptables -F
#in powerpoint is input, output, forward, ik ga alles accept typen.
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT


echo "Alle poorten zijn open, welkom te bezoeken. "