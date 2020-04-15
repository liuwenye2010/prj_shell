Write-Host "for loop count" ; 
#for count 
$n = 6
for ($i =1 ;  $i -le $n ;$i++)
{
	Write-Host $i ; 
}

Write-Host "for loop" ; 
#for 
$array = @("item1", "item2", "item3")
for($i = 0; $i -lt $array.length; $i++)
{ 
	$array[$i] 
}


Write-Host "foreach loop" ; 
#foreach
$array = @("item4", "item5", "item6")
foreach ($element in $array) { $element }

Write-Host "foreach loop" ; 
#foreach 
$array | foreach { $_ }


Write-Host "while loop" ;
$counter = 0;
while($counter -lt $array.length){
   $array[$counter]
   $counter += 1
}
 
Write-Host "do while loop" ;
$counter = 0;
do {
   $array[$counter]
   $counter += 1
} while($counter -lt $array.length)