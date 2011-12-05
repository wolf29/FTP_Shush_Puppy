#!/bin/bash
# -*- coding: utf-8 -*-
#
#       TestCreator.sh Version 0.0.1
#       
#       Description: This script creates a test environment by grabbing 
#       the jp2 files in a given collection folder and
#       moving them to a testing environment"
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


targetd3="../$(basename "$PWD")_Test_Environment/"
#mkdir -p ${targetd3}
 # Copying the file structure to the ftp_staging directory
find . -depth -maxdepth 1 -type d -exec mkdir -p $targetd3\{\} \;
echo $targetd3 " directory structure is complete." >> ziplog.log
# putting the files you are hunting into the new directory structure
find . -name \*23.jp2 -exec cp {} $targetd3{} \;
echo "$targetd3    Test environment created." >> ziplog.log
echo "$targetd3    Test environment created." 
