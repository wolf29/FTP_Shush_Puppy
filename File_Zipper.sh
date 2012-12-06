#!/bin/bash  
# -x
# -*- coding: utf-8 -*-
#
#       File_Zipper.sh Version 1.0.0
#       
#       Description: This script grabs the jp2 files in a given folder and
#       compresses them into a file with the name  "FolderName_images.zip"
#
#       Copyright 2011 Wolf Halton <wolf.halton@lyrasis.org>, LYRASIS
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




# (-1 cli script which didn't work) 
# for x in *; do if [ -d "$x" ]; then (echo "$x""/""$x""_images.zip"; zip -T "$x""/""$x""_images.zip" \*.$extt); fi; done

# The following works and puts the expected stuff in the folder
for x in *; do if [ -d "$x" ]; then cd $x; ls |grep .jp2 | zip "$x"_images.zip -@; cd ..; echo ""$x"/"$x"_images.zip is complete" >> ziplog.log; fi; done

# another script that didn't quite work
## find . -print |grep jp2 | zip  $(basename $PWD)_images.zip -@





targetd3="../$(basename "$PWD")_ftp_staging/"
#mkdir -p ${targetd3}
 # Copying the file structure to the ftp_staging directory
find . -depth -maxdepth 1 -type d -exec mkdir -p $targetd3\{\} \;
echo $targetd3 " directory structure is complete." >> ziplog.log
# putting the files you are hunting into the new directory structure
find . -name \*.zip -exec cp {} $targetd3{} \;
echo "$targetd3    *.zip files moved." >> ziplog.log
find . -name \*.xml -exec cp {} $targetd3{} \;
echo "$targetd3    *.xml files moved to staging area." >> ziplog.log

echo "Your files are zipped and staged in ../$(basename "$PWD")_ftp_staging/".  
echo "Now it is time to run Up_Loader.sh"


#for item in (ls $targetd2) ; do
#        scp -r * 74.217.44.233:/home/Lyrasis-FTP/ > ziplog.log 2>&1
#echo "$title  has been copied to FTP server."
#done

