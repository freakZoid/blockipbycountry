#!/bin/bash

IPT=/sbin/iptables
BLOCKIPSFILE=IPs.txt

while IFS=$'\n' read -r line || [[ -n "$line" ]];
do
	if [ -n $line ]; then
		if [ "$line" != "" ]; then
			$IPT -D INPUT -s $line -j DROP
			$IPT -D INPUT -s $line -j LOG --log-prefix "manual ip drop"

			$IPT -A INPUT -s $line -j DROP
			$IPT -A INPUT -s $line -j LOG --log-prefix "manual ip drop"
  			#echo -ne "."
  			echo $IPT -A INPUT -s $line -j DROP
		fi
	fi
done < $BLOCKIPSFILE

/etc/init.d/iptables save
