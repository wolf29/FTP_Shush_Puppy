#!/bin/bash -x
# -*- coding: utf-8 -*-
#
#       Underscore_Eviscerator_2.sh
#       
#       Description: This script recursively removes underscores 
#       from all objects in the directory so that 
#       the names can be manipulated safely.
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

find . -depth -name "* *" -execdir rename 's/ - /_-_/g' "{}" \;
find . -depth -name "* *" -execdir rename 's/ /_/g' "{}" \;



