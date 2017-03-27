#!/bin/bash
#Author: Alex Cooper
#Date: 03/21/2017

output="/home/alex/Dropbox/level1/"

cd ${output}

input=$1
todo=$2

if [ ${todo} == "m" ]; then
    split -l 4500 -d ${input} process_me_
    for f in process_me_*; do
        sed -i '1s/^/Barcodes\n/' ${f}
        mv ${f} "${f}.txt"
        echo "Processing ${f}"
    done
fi

if [ ${todo} == "w" ]; then
    split -l 4500 -d ${input} delete_me_
    for f in delete_me_*; do
        sed -i '1s/^/Barcodes\n/' ${f}
        mv ${f} "${f}.txt"
        echo "Processing ${f}"
    done
fi

if [ ${input} == "clean" ]; then
    rm delete_me_*
    rm process_me_*
    echo "Directory ${output} is clean"
fi

exit 0
