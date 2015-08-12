#!/bin/bash
#监控主机的磁盘空间,当使用空间超过90％就通过发mail来发警告
space=`df | sed 's/%//' | awk 'BEGIN{getline;sum=0} {sum+=$5} END{print sum}'`
if [ $space -gt 20 ]
then
	echo "Disk Full" | mail -s "Your disk is full" root@localhost 
fi

