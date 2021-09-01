#!/usr/bin/bash

if [ $# -ne 2 ]; then
    echo "USAGE: $0 [jpg path] [file_list file name]"
    exit
fi

jpg=$1
file_list_file=$2

id_label=-1
old_label=""
while read one; do
    path=$(echo $one | sed "s/\.avi/ dummy/" | awk '{printf $1}')
    label=$(echo $path | sed "s/\/.*//")
    if [ "$label" != "$old_label" ]; then
        id_label=$(($id_label+1))
    fi
    old_label=$label
    num_frames=$(ls ${jpg}/${path}/*.jpg | wc -l)
    echo $path $num_frames $id_label
done < $file_list_file
