#!/bin/bash



function Usage() {
  cat << EOF
Usage:
  - encrypt
  ./script.sh -c <dir> <file_extention>
  - decrypt
  ./script.sh -e <destination_dir>

Options:
  -c, --compress   Compress plain text files and folders in the current working directory to a text file called illegal.txt.
  -e, --extract    Extract plain text files and folders from the illegal.txt file to the current working directory.
  -h, --help       Display this help message.

Examples:
  # Compress plain text files and folders in the current working directory to a text file called illegal.txt.
  ./script.sh ./folder1 .txt

EOF
}









function delim(){
cat <<EOF >> $log_file

--------------------------
EOF
    return 0;
}



#in compress $1 is the directory to encode
#in extract $i is the encoded file

function compress(){
    # Get the directory
    dir=$1
    
    # output file
    log_file="illegal.txt"
    
    delim
    
    dirs=$(find $dir -type d | tr '\n' ' ')
    echo -n $dirs >> $log_file;
    
    delim
    files=()
    lines=$(find $dir -type f -name "*.c" | tr '\n' ' ')
    # find h -type f -name "*.java" -o -name "*.py"
    
    # echo -n $lines
    
    touch $log_file
    
    
    delim
    tree $dir >> $log_file
    
    delim
    
    for i in ${lines[@]}; do
        
        echo -n "$i" >> $log_file
        delim
        cat $i >> $log_file
        delim
    done
    
}

function extract(){
    #get file
    dd="--------------------------"
    file=$1

    sos=$(cat "$file")
    for line in $sos;
    do 
    if $line = $dd; then
    echo $line
    fi
    done
}



# <TODO>
# check $1 is a directory

args=$@  # array of all argumenst (0th -> file_name, 1-> reserved to directory)
largs=$#
# echo ${@:2:largs}

for i in ${@:2:largs}; do
    case $i in
        -e|--extract)
            echo "extracting -----"
            compress
            echo "saved as illegal.txt"
        shift;;
        -*|--*)
            echo "unknown opitons $i"
            Usage
            exit 1
        ;;
        *)
            Usage
        ;;
    esac
done


toggle_flag() {
    if [ "$bla_flag" = true ]; then
        bla_flag=false
    else
        bla_flag=true
    fi
}
