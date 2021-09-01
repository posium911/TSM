#!/usr/bin/bash

if [ $# -ne 2 ]; then
    echo "USAGE: $0 [jpg path] [file_list file name]"
    exit
fi

jpg=$1
file_list_file=$2

while read one; do
    path=$(echo $one | sed "s/\.avi/ dummy/" | awk '{printf $1}')
    num_frames=$(ls ${jpg}/${path}/*.jpg | wc -l)
    label=$(echo $one | awk '{if(NF==2){printf $2-1} else{""} }')
    echo $path $num_frames $label
done < $file_list_file
