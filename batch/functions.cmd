:: To call function without parameters 
rem CALL :function_name
 
:: To call function with parameters
rem CALL :function_name param1, param2,...,paramN

:: To call function with return values
rem CALL :function_name return_value1,return_value2,..,return_valueN

rem So, this is how the function is called in batch files.
rem In the case of batch file functions with parameters, a tilde(~) sign is used to access them in the main program along with the positional number of parameter.
rem Similarly, in the case of batch file functions with return values, return values are set in the function using the set command and the tilde(~) character along with the positional number of the return values.
rem Here is the batch file program to demonstrate the use of the basic function, function with parameters and function with return values.


rem Batch file function example: Program with basic function
@echo OFF
CALL :basic_function 
rem Main function return 
EXIT /B %ERRORLEVEL% 
:basic_function
SET n=Harry
ECHO My name is %n%
PAUSE
EXIT /B 0

rem Batch file function example: Program demonstrating function with parameters
@echo OFF
CALL :param_function 20, 400
rem Main function return
EXIT /B %ERRORLEVEL% 
:param_function
ECHO The first paramater is %~1 
ECHO The second parameter is %~2
PAUSE
rem sub functionr return 
EXIT /B 0


rem Batch file function example: Program demonstrating function with return values
@echo OFF
CALL :retun_value_function ret_val1,ret_val2
ECHO The square root of %ret_val1% is %ret_val2%
PAUSE
EXIT /B %ERRORLEVEL% 
:return_value_function
SET %~1=100
SET %~2=10
EXIT /B 0

