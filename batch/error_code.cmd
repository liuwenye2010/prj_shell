rem http://www.trytoprogram.com/batch-file-return-code/

:: EXIT /B %ERRORLEVEL% at the end of the batch file also returns the error codes from the batch file.

:: EXIT /B < exitcodes > is used to return custom return codes.



IF %ERRORLEVEL% NEQ 0 Echo An error was found
IF %ERRORLEVEL% EQU 0 Echo No error found

IF EXIST C:/abc.txt EXIT 9
EXIT 0