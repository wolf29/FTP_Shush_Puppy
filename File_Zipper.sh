#!/bin/bash
# -*- coding: utf-8 -*-
#
#       File_Zipper.sh
#       
#       Description: This script grabs the jp2 files in a given folder 
#       and gives it the name "FolderName_images.zip"
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

# This ia still pseudocode and wrong as well.  By this stage, the folders have already been renamed 
zext="_images.zip"
targetd2="../zip_stage/"
if ! -d $targetd2; then
    mkdir $targetd2
fi

for i in .; do
        mkdir -p ${targetd2}/${i}
        echo "${targetd2}/${i} has been created"
        cd .
        echo ${PWD}
        zip ${targetd2}/${i}/${i}$zext *.jp2
        cd ..
        echo ${PWD}
        #cp $pmarc $title/$title+$mext
        #echo $title$mext " is in place." >> ziplog.log
        echo $title " and " $folder " zip done." >> ziplog.log
done

targetd3="../ftp_staging/"
# Copying the file structure to the ftp_staging directory
find * -type d -exec mkdir $targetd3\{\} \;
echo $targetd2 " directory structure is complete." >> ziplog.log
# putting the files you are hunting into the new directory structure
find . -name \*.zip -exec cp {} $targetd2{} \;
echo $targetd2 "*.zip files moved." >> ziplog.log
find . -name \*.xml -exec cp {} $targetd2{} \;
echo $targetd2 " ..complete." >> ziplog.log

for item in (ls $targetd2)
        scp -r item 74.217.44.233:/home/Lyrasis-FTP/ > ziplog.log 2>&1
echo $title " has been copied to FTP server."
done

