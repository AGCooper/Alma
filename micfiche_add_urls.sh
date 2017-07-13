#!/bin/bash

input_file="/tmp/micfiche_test.txt"
output_file="/tmp/micfiche_urls.txt"
count=0

cat ${input_file}|\
while read line; do
    curl "${line}" > "/tmp/junk"
    number_of_records=`cat "/tmp/junk" | grep -B 2 "&nbsp;for" | head -1 | sed 's/[^0-9]*//g'`
    if [ ${number_of_records} -gt 0 ]; then
        echo ${line} >> ${output_file}
        count=$((count + 1))
    fi
done
echo ${count}

exit 0
