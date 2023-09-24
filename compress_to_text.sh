#!/bin/bash

# Get the current directory
cwd=$(pwd)

# Create a log file
log_file="illegal.txt"
files=()
lines=$(find | tr '\n' ' ')

touch $log_file

#adding visual tree representation to the file
tree $cwd >> $log_file&

function delim(){
cat <<EOF >> $log_file
--------------------------
EOF
return 0;
}

find * >> $log_file

cat <<EOF >> $log_file
--------------------------
EOF
j=0
for i in $files; do
	$j=$j+1
	echo $j
done


 echo $lines
 for line in $lines; do
 	#
 
	cat $line > $log_file
	delim
 done



