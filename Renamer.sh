#!/bin/sh -x
#
#       Renamer.sh         Version 0.0.1
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


# for changing the names of directories in the renaming stage.
echo "Enter the name and relative location of the title file"
read title_file
echo "cd to the directory you are processing"
echo "Enter the directory location and file name in which"
echo "  you will be changing directory names."
echo "enter the absolute or relative path to this directory."
echo "  ./  is valid for checking the present working directory."
read directory

# Read source directories in array
mapfile -t oldnames < <(find $directory -maxdepth 1 -mindepth 1 -type d | sort)
# Read target names in array
mapfile -t newnames < $title_file

echo "oldnames: ${#oldnames[@]} : ${oldnames[@]}"
echo "newnames: ${#newnames[@]} : ${newnames[@]}"
directory2="../newNames/"
for i in ${oldnames[@]
    do
        cp "${oldnames[${i}-1]" "$directory2${newnames[${i}-1]"
        echo "${oldnames[${i}-1] is now  ${newnames[${i}-1]"
    done
