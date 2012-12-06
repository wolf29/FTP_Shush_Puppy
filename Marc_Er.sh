#!/bin/bash 
# -x
#
#       Marc_Er.sh         Version 1.0.0
#
#       Copyright 2011 Wolf Halton <wolf.halton@lyrasis.org>, LYRASIS
#
#       Description: This script adds the marc.xml file to each folder 
#       and renames it as basename_marc.xml
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program; if not, write to the Free Software
#       Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#       MA 02110-1301, USA.

# The following 2 lines makes the script treat the spaces in the
#  variables as 'just another character'
IFS='
'
#-----------------

echo "copy the proper marc.xml file into the parent directory of the directories being processed "
echo "CD into that parent directory.  Run this script." 
echo "If you are not set up properly, stop this script with <CTRL> <C>"
ls *.xml
witty=$(ls *.xml)
echo $witty
echo "If this is the file you expected to see enter a 'y' to continue,"
echo "If this is not the file you are using or if more than one file appears, enter a 'n' for a prompt to enter the filename."
echo "otherwise enter the proper file name at the next prompt"
read m1

if [[ ${m1} -eq "y" ]]; then
    marc=$witty
else
    echo "Enter proper marc.xml filename"
    read marc
fi
for i in * ; do
    if [ -d $i ]; then 
        echo "$i - is a directory"
        #cp "${marc}" "${i}/${i}_marc.xml"
        cp "${marc}" "${i}/marc.xml"
        #echo "${i}/${i}_marc.xml is in place" >> ziplog.log
        echo "${i}/marc.xml is in place" >> ziplog.log
    fi
    done 


echo "Your files are in place.  Now it is time to run Parentify.sh"
