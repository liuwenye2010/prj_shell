
SET /A a=2
SET /A b=3
SET name1=Aston
SET name2=Martin

:: Using if statement
IF %a%==2 echo The value of a is 2
IF %name2%==Martin echo Hi this is Martin

:: Using if else statements
IF %a%==%b% (echo Numbers are equal) ELSE (echo Numbers are different)
IF %name1%==%name2% (echo Name is Same) ELSE (echo Name is different)
PAUSE



@echo OFF
REM Batch File If Else Example To Check If Variable Is Defined Or Not
::If var is not defined SET var = hello
IF "%var%"=="" (SET var=Hello)

:: This can be done in this way as well
IF NOT DEFINED var (SET var=Hello)



REM atch File If Else Example To Check If A File Or Folder Exists
@echo OFF

::EXIST command is used to check for existence
IF EXIST D:\abc.txt ECHO abc.txt found
IF EXIST D:\xyz.txt (ECHO xyz.txt found) ELSE (ECHO xyz.txt not found)

PAUSE


@echo off
Echo Before shifting.
Echo first parameter : %1%
Shift
Echo After shifting.
Echo first parameter : %1%



@echo off
if exist C:\windows. (
echo Found
) else (
echo Not found
)





@echo off
tasklist
cls
if errorlevel 1 (
echo success
) else (
echo Failed
)



@echo off
:begin
color a
echo Access Code :
set /p ac=
if %ac%==12345 (
echo Access Granted
) else (
echo Access Denied
goto begin
)
Pause