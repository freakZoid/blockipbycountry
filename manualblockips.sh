#!/bin/bash

ISO="TracedIPs-2.txt"
IPT=/sbin/iptables
# BLOCKIPSFILE=TracedIPs.txt

# while IFS=$'\n' read -r line || [[ -n "$line" ]];
# do
	# if [ -n $line ]; then
		# if [ "$line" != "" ]; then
			# $IPT -D INPUT -s $line -j DROP
			# $IPT -D INPUT -s $line -j LOG --log-prefix "manual ip drop"

			# $IPT -A INPUT -s $line -j DROP
			# $IPT -A INPUT -s $line -j LOG --log-prefix "manual ip drop"
  			# #echo -ne "."
  			# echo $IPT -A INPUT -s $line -j DROP
		# fi
	# fi
# done < $BLOCKIPSFILE

for c  in $ISO
do
	while IFS=$'\n' read -r line || [[ -n "$line" ]];
	do
		if [ -n $line ]; then
			if [ "$line" != "" ]; then
				$IPT -D INPUT -s $line -j DROP
				$IPT -D INPUT -s $line -j LOG --log-prefix "manual $c"

				$IPT -A INPUT -s $line -j DROP
				$IPT -A INPUT -s $line -j LOG --log-prefix "manual $c"
				#echo -ne "."
				echo $IPT -A INPUT -s $line -j DROP "manual $c"
			fi
		fi
	done < $c
done

/etc/init.d/iptables save
/etc/init.d/iptables stop
/etc/init.d/iptables start