#!/bin/bash

for i in `ls  *.jp2`
do
    file=`basename $i`
    #echo $file
    SUFF="jp2"
    slim=${file%.$SUFF}
    #slim=`echo $file ${file%.$SUFF}`
    
    #echo "$slim is the stub"
    suffix='jpg'
    
    convert $i -resize 7%  $slim.$suffix
    echo "$slim.$suffix is created"

done

# This is the script to do all this in a fast and dirty way in multiple subfolders:
#  find -type f -name "*.jp2" -exec convert {} -resize 14% {}.jpg \;

