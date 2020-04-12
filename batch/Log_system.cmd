@echo off
echo. > l1.txt
echo Log File >> l1.txt
echo. >> l1.txt
echo User : %username% >> l1.txt
Date /t >>l1.txt
Time /t >> l1.txt
echo. >> l1.txt
echo Process Ran by %username% >> l1.txt
echo. >> l1.txt
qprocess >> l1.txt
echo. >> l1.txt
echo Network Activities >> l1.txt
netstat -s >> l1.txt
exit