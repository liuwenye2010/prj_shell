#check folder exist 
Write-Host "path exist: " 
Test-Path ..\powershell

#check file exist 
Write-Host "file exist: " 
Test-Path .\loops.ps1

#create folder
if (Test-Path '.\Test_Folder')
{
	Write-Host "Test_Folder exist"
}
else
{
	New-Item -Path '.\Test_Folder' -ItemType Directory 
}

#create file 
if (Test-Path '.\Test_File.txt')
{
	Write-Host "Test_File.txt exist"
}
else
{
	New-Item -Path '.\Test_File.txt' -ItemType File
}
#wirte to file 
Write-Host "write content into file "
Set-Content '.\Test_File.txt' 'Welcome jx'

Write-Host "read content from file "
#read from file  
get-Content '.\Test_File.txt'

Write-Host "append content from file "
Add-Content '.\Test_File.txt' 'World!'
#read from file  
get-Content '.\Test_File.txt'

Write-Host "clear content in the file "
Clear-Content '.\Test_File.txt'


#copy folder with file  
#copy file 
 
#delete file 
Write-Host "Remove the file "
Remove-Item '.\Test_File.txt'

#delete folder
Write-Host "remvoe the folder"
Remove-Item '.\Test_Folder'

ls







