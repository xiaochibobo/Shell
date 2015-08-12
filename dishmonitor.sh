#!/bin/bash
#监控主机的磁盘空间,当使用空间超过90％就通过发mail来发警告
space=`df | awk 'BEGIN{getline} {print $5}' | sed 's/$//' | awk 'BEGIN{sum=0} {sum+=$1} END{print sum}'`
if [ $space -gt 20 ]
then
	echo "Disk Full" | mail -s "Your disk is full" root@localhost 
fi

