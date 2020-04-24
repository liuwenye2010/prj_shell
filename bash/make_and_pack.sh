#!/bin/sh
ScriptName=${0#*/}	# file'name and delete the path
CopyBuild=0


DateTimePrefix=`date +%F`
User=`whoami`
echo -e "\n+++++++++++++++++++\n"
echo "User:$User"
echo "DateTime:$DateTimePrefix"
export DISPLAY_VERSION=$DateTimePrefix

#-----------------------------------------------------------------------------------
# Function to check if the previous command succeeded or not.
# Script exits with the previous command exit code in case of failure.
#-----------------------------------------------------------------------------------
exit_if_failed ()
{
	ExitCode=$?
	if [ $ExitCode -ne 0 ]; then
	    echo "Failed with error code $ExitCode"
		exit $ExitCode 
	fi
}

usage ()
{
	echo "No usage avaiable now"
}

build_and_copy ()
{
	ReleaseDir="./release"
	if [ -d $ReleaseDir ] ; then 
		rm -rf $ReleaseDir
		echo "delete the old $ReleaseDir"
	fi 
	echo -e "\nMake release folder to $ReleaseDir"
	mkdir -p "$ReleaseDir"
	cd "$ReleaseDir"
	exit_if_failed
    
	SourceFileName="example.c"
	ExeuteFileName="example.exe"
    echo -e "\nMake $SourceFileName to $ReleaseDir"
    touch $SourceFileName
	echo "#include<stdio.h>" > $SourceFileName
	echo "int main(void)" >> $SourceFileName 
	echo -e "{ \n" >> $SourceFileName
	echo -e " printf(\"hi example at ${DateTimePrefix} \"); \n"  >> $SourceFileName
	echo -e " getchar();\n" >> $SourceFileName
	echo -e " return 0 ;\n "  >> $SourceFileName
	echo -e "} \n"  >> $SourceFileName

    echo  "build (make) the file using gcc"
	# Build all
	TaregetExe=$ExeuteFileName
    cp  ../Makefile.template  ./Makefile
	sed -i "s/main_normal/$TaregetExe/g" ./Makefile
	make clean 
	make $TaregetExe -j $NumOfJobs
	exit_if_failed
	cd ..

	ZipFile="release_$DateTimePrefix"
	if [ -d $ReleaseDir ]; then
        echo "Creating Zip file $ZipFile"
		if [ -f  ${ZipFile}.zip ] ; then 
			echo "remove the old zip file"
			rm -f $ZipFile

		fi 
		zip -rq "$ZipFile" release
	fi
}



# Check number of parameters
if [ $# -lt 1 ]; then
	echo "Usage: $ScriptName [<options>] <configuration> "
	echo "    Options"
	echo "    -h | --help	Usage Help" 
	echo "    -c | --copy	Build_and_Zip"
	exit 1
fi

#if [ $# -eq 0 ] ; then  
#	${1}="-c"
#fi
echo "\$1 is $1"



# parse the command options 
while :
do
	case $1 in
		-h | --help | -\?)
			#  Call your Help() or usage() function here.
			usage 
			exit 0      
			;;
		-c | --copy)
			CopyBuild=1 
			build_and_copy  # call function build_and_copy 
			shift
			;;	
		-t | --test-copy)
			TestCopy=1
			shift
			;;
		--) # End of all options
			shift
			break
			;;
		-*)
		echo "$ScriptName: WARN: Unknown option (ignored): '$1'" >&2
			shift
			;;
		*)  # no more options. Stop while loop
			break
			;;
	esac
done



echo -e "\nshcmd end to exit"
echo -e "\n+++++++++++++++++++\n"

