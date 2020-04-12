
Rem Do not using whitespace between variable and value.SET name=Apple will work but SET name = Apple will not.
@echo OFF
SET name=Apple
ECHO %name%

:: For numberic variable
SET a=2
ECHO %a%
PAUSE

:: Any variable assigned in between SETLOCAL and ENDLOCAL is taken as a local variable and its scope terminates and the variable is destroyed as soon as the ENDLOCAL statement is executed.

@echo oFF
SET var1=var1 is global variable
SETLOCAL
SET var2=var2 is a local variable

ECHO %var1%
ECHO %var2%
ENDLOCAL
PAUSE

@echo oFF
SET var1=var1 is global variable 
SETLOCAL
SET var2=var2 is a local variable 

ECHO %var1%
ENDLOCAL
:: In this program, var2 is a local variable and when we try to access it after ENDLOCAL is executed, the following happens.
ECHO %var2%
PAUSE