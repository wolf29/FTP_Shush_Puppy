#!/bin/bash 
# -*- coding: utf-8 -*-
#
#       Mirror_Structure.sh
#       
#       Description: This script makes an identical file structure 
#       in the destination directory, and copies all the files of the 
#       sort you wish into that directory structure
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

echo "First we have to change our location to the directory "
echo " where the original file structure is"
echo ' All of the directories on a drive can be duplicated if the '
echo ' Present working directory is /media/source_drive '
echo 'Currently we are here...'
pwd
echo "Enter full or relative path to source directory"
echo " a single dot is appropriate for a relative path of the "
echo " present working directory."
echo "Now the script will cd to the source directory if not already there."
read sourced
# cd to source directory
cd $sourced
pwd
# Create the target directory
echo "enter the full path to the target directory"
echo "If you are working from /media/source_drive and mirroring the "
echo "structure on /media/target_drive, you will see an error "
echo "'Cannot make Directory target_drive, target already exists'  "
echo "This is normal and no cause for alarm."
read targetd 
echo "create the target directory"
mkdir $targetd
echo " what is the type of file you are isolating? \nEnter the 3-character extension - pdf jp2 etc.."
read ext
# Copying the file structure to the destination (target) directory
find * -type d -exec mkdir $targetd\{\} \;
echo $targetd " directory structure is complete." >> ziplog.log
# putting the files you are hunting into the new directory structure
find . -name \*.$ext -exec cp {} $targetd{} \;
echo $targetd "*.$ext files have been moved." >> ziplog.log
