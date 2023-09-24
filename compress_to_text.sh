#!/bin/bash
#
#
#
#<TODO> 
#ADD IGNORE OPTION TO IGNORE DIRECOTRY 

# ADD EXTRACT OPTION 
function Usage() {
  cat << EOF
Usage:
  ./script.sh -c [-h]
  ./script.sh -e [-h]

Options:
  -c, --compress   Compress plain text files and folders in the current working directory to a text file called illegal.txt.
  -e, --extract    Extract plain text files and folders from the illegal.txt file to the current working directory.
  -h, --help       Display this help message.

Examples:
  # Compress plain text files and folders in the current working directory to a text file called illegal.txt.
  ./script.sh -c

  # Extract plain text files and folders from the illegal.txt file to the current working directory.
  ./script.sh -e
EOF
}


if [[ $# -eq 0 ]]; then
  Usage
  exit 1
fi


function delim(){
cat <<EOF >> $log_file
--------------------------
EOF
return 0;
}




ignored=(.git )


# Get the current directory
cwd=$($0)

# Create a log file
log_file="illegal.txt"
files=()
lines=$(find $cwd | tr '\n' ' ')

touch $log_file

#adding visual tree representation to the file
tree $cwd >> $log_file&

find * >> $log_file

delim

 echo $lines
 for line in $lines; do
 	if[["$ignored[@]" =~ "$line"]]; then 
        	cat $line > $log_file
	fi
	done
	delim
 done



