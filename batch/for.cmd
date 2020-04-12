@ECHO OFF
rem http://www.trytoprogram.com/batch-file-for-loop/
rem FOR /D %%v IN (*.*) DO dir/s "%%v"

rem FOR /L %G IN (20,-2,0) DO @ECHO %G

rem for /L %%v in (1,1,20) do telnet %1 %%v

rem in batch file for loops is that, variable declaration is done with %%var_name instead of %var_name%.
@ECHO OFF
FOR %%x IN (1 2 3) DO ECHO %%x
PAUSE

rem Batch file for loop – looping through a range of values
@ECHO OFF
FOR /L %%y IN (0, 1, 3) DO ECHO %%y
PAUSE


rem Batch file for loop – looping through files
@ECHO OFF
FOR %y IN (C:\*) DO @ECHO %y
PAUSE


rem Batch file for loop – looping through directories
@ECHO OFF
FOR /D %y IN (C:\*) DO @ECHO %y
PAUSE