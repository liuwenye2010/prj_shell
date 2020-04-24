#!/usr/bin/bash
find `pwd` -name .config  >config.list.txt 
#sed -n p config.list.txt 
#val= `sed -n '3'p  config.list.txt`
line_num=`cat config.list.txt | wc  -l`
echo "conig_nums: $line_num"   
for (( i=1; i<=$line_num; i++ ))
do
	val=`sed -n "$i"p config.list.txt`
	echo "change config $val"
	sed -i 's/CONFIG_DATA_OFFSET=.*/CONFIG_DATA_OFFSET=100/' $val
	echo "change CONFIG_DATA_OFFSET=100"
done