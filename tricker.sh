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
function delim2(){
cat <<EOF >> $log_file

+++++++++++++++++++++++++
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
    lines=$(find $dir -type f -name "*.py" | tr '\n' ' ')
    # find h -type f -name "*.java" -o -name "*.py"
    
    # echo -n $lines
    
    touch $log_file
    
    
    # delim
    # tree $dir >> $log_file
    # delim
    
    for i in ${lines[@]}; do
        delim2
        echo -n "$i" >> $log_file
        delim
        cat $i >> $log_file
        delim
        
    done
    
}

function toggle_flag() {
    if [ "$del_flag" = true ]; then
        del_flag=false
    else
        del_flag=true
    fi
}
dir_made=false
file_open=true
file_path=" "
file=$1
dest="dest"
fc=false
write=false
del_flag=false
dd="--------------------------"
dd2="+++++++++++++++++++++++++"

function extract(){
    while IFS= read -r line; do
        if [ "$line" = "$dd" ];then
            toggle_flag
            if [ "$file_open" = true ];then
                file_open=false
            fi
            if [ '$write' = true ];then
                write=false
                echo "wrote to file $file_path"
            fi
            continue 1
        fi
        
        if [ "$line" = "" ];then
            continue 1
        fi
        # <generating folders>
        if [ "$dir_made" = false ]; then
            for i in ${line[@]}; do
                #            echo -e "\nmaking dir $i "
                mkdir -p "./dest/$i"
            done
            dir_made=true
        fi
        
        
        if [ "$line" = "$dd2" ];then
            file_open=true
            fc=true
            echo "$fc"
            continue 1
        fi
        
        
        if [ "$fc" = true ];then
            #        echo -e "\nfile created $line"
            echo "$line"
            touch "./dest/$line"
            file_path="./dest/$line"
            file_open=true
            fc=false
            write=true
            continue 1
        fi
        
        if [ "$write" = true ] && [ "$fc" = false ]; then
            
            echo -e "$line" >> "$file_path"
            
            
        fi
        
    done < "$file"
    
    
    
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
            extract
            # echo "extra?"
        shift;;
        -c|--compress)
            echo "compressing -----"
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

