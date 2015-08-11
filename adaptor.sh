#!/bin/bash
#查看主机网卡流量
while :; do
time=`date "+%X"`
rxbefore=`ifconfig eth0 | sed -n "8p" | awk '{print $2}' | cut -c7-`
txbefore=`ifconfig eth0 | sed -n "8p" | awk '{print $6}' | cut -c7-`
sleep 2
rxafter=`ifconfig eth0 | sed -n "8p" | awk '{print $2}' | cut -c7-`
txafter=`ifconfig eth0 | sed -n "8p" | awk '{print $6}' | cut -c7-`
rxresult=$[(rxafter-rxbefore)/16]
txresult=$[(txafter-txbefore)/16]
echo "$time Now_in_speed:"$rxresult"Kbps Now_out_speed:"$txresult"Kbps"
sleep 2
done
