#!/bin/bash -x
# -x
#
#       Marc_Er.sh         Version 0.0.1
#
#       Copyright 2011 Wolf Halton <wolf@sourcefreedom.com>, LYRASIS
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


# for copying the marc.xml file into each folder.

# The following 2 lines makes the script treat the spaces in the
#  variables as 'just another character'
IFS='
'
#-----------------

echo "copy the proper marc.xml file into the parent directory of the directories being processed "
echo "CD into that parent directory.  Run this script." 
echo "If you are not set up properly, stop this script with <CTRL> <C>"
ls *.xml
echo "If this is the file you expected to see enter a 'y' to continue,"
echo "If this is not the file you are using or if more than one file appears, enter a 'n' for a prompt to enter the filename."
echo "otherwise enter the proper file name at the next prompt"
read m1

if $m1="y"; then
    marc=$((ls *.xml))
else
    read marc
fi
for i in $((ls -d)); do
    cd $i
    echo $i
    ParentDir=$(echo "${PWD}" | awk -F'/' '{print $NF}')
    cp "../$marc" "$ParentDir"_marc.xml""
    cd ..
    done 
#echo "${PWD}" | awk -F'/' '{print $NF}'
#echo "$ParentDir is the parent Directory name"



