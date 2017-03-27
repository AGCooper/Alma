#!/bin/bash

directory="/home/alex/Dropbox/level1/work/"
bindir="/home/alex/bincustom/"

dos2unix ${directory}*
for f in ${directory}to_delete*; do
    cat ${f} | ${bindir}buildXml.py
    rm ${f}
done

exit 0
