#!/usr/bin/bash
SourceDir_Prefix="/home/johl/fcp_local"
pwd 
cur_dir=`pwd`

for (( ver_y=48; ver_y <=60; ver_y++ )) 
do 
rm   -f  $cur_dir/copy_list.txt

fcp_ver_z=7
fcp_ver_y="$ver_y"    
fcp_ver_x=0
fcp_ver_w=0
fcp_ver="${fcp_ver_z}.${fcp_ver_y}.${fcp_ver_x}.${fcp_ver_w}"
Fcp_packages="${fcp_ver}"                 
SourceDir="${SourceDir_Prefix}/${Fcp_packages}"
echo "SourceDir:${SourceDir}"
cd  "$cur_dir"
if cd  "${SourceDir}"
then 
echo "Last cd: $?"
dst="/home/johl/fcp_local/temp3/${Fcp_packages}/"
mkdir -p "$dst"
#find -type f -regex .*.zip$ > $cur_dir/copy_list.txt   #too slow when access the web 
ls   fcp*.zip   >  $cur_dir/copy_list.txt
num_files=`cat $cur_dir/copy_list.txt | wc -l`
echo  "num_files:$num_files"
for ((i=1; i<=$num_files; i++))
do
	 src=`sed -n "$i"p $cur_dir/copy_list.txt`
	 if [ src != "" ]
	 then 
		echo "copy file from $src to $dst"
		cp  --preserve=timestamps -fr  $src  $dst 
	 fi 
done
fi
done 