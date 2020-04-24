#!/usr/bin/bash

##awk -F '|' '{print $1, $8}' logfile

#val=`awk -F '	'  '{print $2}' tasks.su`
#echo $val 
#echo $val >val.txt 
#sort -n val.txt 
sort -t$'\t' -k2 -nr tasks.su  > tasks_sorted_by_stack_usage.su  

#awk -F '	'  '{print $2}' tasks.su  | sort  -n -k1