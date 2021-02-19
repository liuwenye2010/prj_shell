
#https://stackoverflow.com/questions/16414410/delete-empty-lines-using-sed
#remove the empty line (in the file directly)
sed -i '/^\s*$/d' example.txt 

