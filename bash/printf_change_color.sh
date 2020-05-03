#!/bin/bash 
#Filename: printf.sh

printf  "%-5s %-10s %-4s\n" No Name  Mark 
printf  "%-5s %-10s %-4.2f\n" 1 Sarath 80.3456 
printf  "%-5s %-10s %-4.2f\n" 2 James 90.9989 
printf  "%-5s %-10s %-4.2f\n" 3 Jeff 77.564

echo -e '\e[1;31m  this is red color \e[0m'

echo -e '\e[1;32m  this is green color \e[0m'

echo -e '\e[1;42m  this is background color \e[0m'

