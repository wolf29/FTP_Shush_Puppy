#!/bin/bash
#
#       Up_Loader.sh
#
#       Description: This script starts the upload to the proper 
#       directory in the FTP server
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


echo "User can specify which directory to put the file into by \
entering on command line 'Up_Loader.sh [directory_name]'. \ 
If no directory name is specified, the uploaded files \
will be placed at hard-coded root."
echo $1
rsync -var -O * lyrasis@ftp.lyrasistechnology.org:/home/Lyrasis-FTP/$1/ >> ziplog.log 2>&1 



