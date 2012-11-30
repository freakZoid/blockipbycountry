#!/bin/bash

IPT=/sbin/iptables
BLOCKIPSFILE=IPs.txt

while read line
do
  $IPT -A INPUT -s $line -j DROP
  $IPT -A INPUT -s $line -j LOG --log-prefix "manual ip drop"
done < $BLOCKIPSFILE
