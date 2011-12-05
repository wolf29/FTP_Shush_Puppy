#!/bin/bash 
# -x
#
#       Renamer.sh         Version 1.0.0
#
#       Copyright 2011 Wolf Halton <wolf.halton@lyrasis.org>, LYRASIS
#
#        Description: This script takes a set of directories and renames 
#       them based upon a list of new names.  It simply reads down the list 
#       and replaces the directory name at the same place on the list with 
#       the name on the list.
#
#        This program is free software; you can redistribute it and/or modify
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


# for changing the names of directories in the renaming stage.

# The following 2 lines makes the script treat the spaces in the 
#  variables as 'just another character' 
IFS='
'
#-----------------
echo "Before you begin, cd to the directory you are processing"
echo "Enter Ctrl C to abort this action."
echo "Enter the name and relative location of the title file"
read title_file

directory="${PWD}/"
echo "$directory"

# Read source directories in array
mapfile -t oldnames < <(find "$directory" -maxdepth 1 -mindepth 1 -type d | sort)
# Read target names in array
mapfile -t newnames < "$title_file"

echo "oldnames: ${#oldnames[@]} : ${oldnames[@]}"
echo "newnames: ${#newnames[@]} : ${newnames[@]}"
directory2="../newNames/"
if [ ! -d "${directory2}" ]; then
    mkdir "${directory2}"
fi
h=0
# 'h' is the incrementer for the 'mv' command.  It didn't work to do 
# 'h=$((i-1))' because 'i' was a filename - the content of index[x] 
# - this is the problem to which one of the weird errors was pointing.
for i in "${oldnames[@]}"
    do
        
        #echo "$h is i minus one"
        mv ${oldnames[$h]}  ${directory}${newnames[$h]}
        echo "${oldnames[$h]} is now ${newnames[$h]}"
        #echo "${i}"
        h=$((h+1))
    done
exit 0
