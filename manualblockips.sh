#!/bin/bash

IPT=/sbin/iptables
BLOCKIPSFILE=IPs.txt

while read line
do
  $IPT -D INPUT -s $line -j DROP
  $IPT -D INPUT -s $line -j LOG --log-prefix "manual ip drop"

  $IPT -A INPUT -s $line -j DROP
  $IPT -A INPUT -s $line -j LOG --log-prefix "manual ip drop"
  echo -ne "."
done < $BLOCKIPSFILE

$IPT save