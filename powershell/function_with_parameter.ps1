function MyFunc([int]$arg1, [string]$arg2)
{
    Write-Host "`$arg1 value: $arg1"
    Write-Host "`$arg2 value: $arg2"
}

MyFunc("123") ("ABCD") #call the function
MyFunc 123  ABCD  #call the function with spaces