#sed awk 101 hacks 
content in  employee.txt 
101,John Doe,CEO 
102,Jason Smith,IT Manager
103,Raj Reddy,Sysadmin
104,Anand Ram,Developer
105,Jane Miller,Sales Manager


sed -n 'p'  /etc/passwd 
sed -n -f test-script.sed /ect/passwd 
sed -n -e '/^johl/p'  -e '/^Guest/p' /etc/passwd
#
sed -n \
-e '/^johl/p' \
-e '/^Guest/p' \
/etc/passwd
#
sed -n '{
/^johl/p
/^Guest/p
}' /etc/passwd


sed 'p' employee.txt 
sed -n 'p' employee.txt  
sed -n '2 p' employee.txt 
sed -n '1,4 p' employee.txt
sed -n '1,+2 p' employee.txt
sed -n '1~2 p' employee.txt  

#patten match 
sed -n '/Jane/ p' employee.txt 
sed -n '/Raj/,/Jane/ p' employee.txt 

#d -->delete
sed -n '1,2 d' employee.txt 

sed  '1,2 d' employee.txt


sed -n -e '1,2 d' -e 'p'  employee.txt

sed -n '/^#/ d' employee.txt 

sed -n '/^$/ d' employee.txt  

#w write to file
sed -n 'w output.txt' employee.txt 

#i ignore the case 

#s 
sed -n 's/a/A/' employee.txt 

#e , excute 
sed   's/^/ls -al / e'  files.txt
sed -n 's/^/ls -al / ep' files.txt

#igpw 标志组合使用
sed  -n 's/manager/Director/igpw output2.txt' employee.txt 











