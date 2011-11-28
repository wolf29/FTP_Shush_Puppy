#!/bin/bash
# -*- coding: utf-8 -*-
#
#       Parentify.sh
#       
#       Description: This script recursively concatenates as a prefix the 
#       Parent directory name with the file name.  This is the production 
#       version of mvmv2.sh which tests this function.
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
shopt -s globstar

for f in $PWD/**
do
 if [ -f "$f" ]
 then
   # echo $f is a file
   d="${f%/*}"; d=${d##*/}
   mv -v "$f" "${f%/*}/${d}_${f##*/}" > /dev/null 2>&1
 else
   continue
   # echo $f is a dir
 fi
done
