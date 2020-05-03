#!/bin/bash
#Filename: fast_ping.sh
# Change base address 192.168.1 according to your network.

for ip in 192.168.1.{1..255} ;
do
   (
      ping $ip -c2 &> /dev/null ;
	  #ping $ip  # please run at linux host , since -c2 is not support in windows 
      if [ $? -eq 0 ];
      then
       echo $ip is alive
      fi
   )&
  done
wait