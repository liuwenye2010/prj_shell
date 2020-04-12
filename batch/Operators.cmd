REM http://www.trytoprogram.com/batch-file-programming-operators/
ECHO http://www.trytoprogram.com/batch-file-programming-operators/

@echo off
Set /A s = (20 - 5) * 2 + 8 / 2
echo s = %s%
pause

REM EQU	equal to	x EQU y
REM Return true if x is equal to y
REM NEQ	not equal to	x NEQ y
REM Returns true if x is not equal to y
REM LSS	less than	x LSS y
REM Returns true if x is less than y
REM LEQ	less than or equal to	x LEQ y
REM Returns true if x is less than or equal to y
REM GTR	greater than	x GTR y
REM Returns true if x is greater than y
REM GEQ	greater than or equal to	x GEQ y
REM Returns true if x is greater than or equal to y

@echo off
SET /A x = 3
SET /A y = 4
if %x% EQU %y% echo x is equal to y
if %x% NEQ %y% echo x is not equal to y
if %x% LSS %y% echo x is less than y
if %x% LEQ %y% echo x is less than or equal to y
if %x% GTR %y% echo x is greater than y
if %x% GEQ %y% echo x is greater than or equal to y
pause



@echo off
SET /A x = 4
SET /A x += 2
echo x = %x%
SET /A x -= 2
echo x = %x%
SET /A x *= 2
echo x = %x%
SET /A x /= 2
echo x = %x%
SET /A x %= 2
echo x = %x%
pause


@echo off
SET /A x = 4 && SET /A x += 2
echo x = %x%
pause

@echo off
NET USER > test.txt

@echo off
ping www.baidu.com >> test.txt


@echo off
SORT < Num.txt
pause


