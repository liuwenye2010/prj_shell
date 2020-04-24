#!/bin/sh
# A simple script with a function...

echo "example sh"
myname() 
{ echo "hello function name" 
}
myname 

#alias mydir ='echo ${PWD##*/}'

add_a_user()
{
  USER=$1
  PASSWORD=$2
  shift; shift;
  # Having shifted twice, the rest is now comments ...
  COMMENTS=$@
  echo "Adding user $USER ..."
  #echo useradd -c "$COMMENTS" $USER
  #echo passwd $USER $PASSWORD
  echo "Added user $USER ($COMMENTS) with pass $PASSWORD"
}

###
# Main body of script starts here
###
echo "Start of script..."
add_a_user bob letmein Bob Holness the presenter
add_a_user fred badpassword Fred Durst the singer
add_a_user bilko worsepassword Sgt. Bilko the role model


read -p "Do you want to restirct access to this site ?"
[ $REPLY = 'n' ] && exit 0
read -p "Which Network you Need: "  NEW_NETWORK 
echo "new newwork you input is $NEW_NETWORK"

read -p  "input a number:"  counter 

if [ $counter -lt 10 ]
then number=0$counter
else number=$counter
fi

echo "number is $number"

read -p  "input a number:"  number 


### lt (less than ) , le (less and equal ), ge (greate than adn eual ), gt (greater than )    ne (not equal)  eq (equal)
if [ $number -gt 10 ]    
then echo "number >10"
elif  [ $number -gt 1 ]
then echo "number >1"
else echo "number <=1"
fi 

read -p  "input a number (again):"  number 

if (( $number > 10 )) 
then echo "number >10"
elif  (( $number > 1 ))
then echo "number >1"
else echo "number <=1"
fi 


####for ((init; cond; incr))
for ((x=1; x<=10; x+=2))
do
  echo "x== $x"
done

# if ! [ -d $dir ]
# then
# mkdir -m 775 $dir
# fi

function countfiles {
  ls | wc -l
}

#call self define functions 
y=$(countfiles)  

echo "Call function countfiles is $y"

echo "End of script..."