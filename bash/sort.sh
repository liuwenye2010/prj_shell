#!/bin/bash
#Sort
sort -C tmp/a.c ;
if [ $? -eq 0 ]; then
   echo Sorted;
else
   echo Unsorted;
fi