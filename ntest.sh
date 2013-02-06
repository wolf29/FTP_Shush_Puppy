#!/bin/bash
# -x
#       ntest.sh  
#	copyright (c) 2011 Wolf Halton <wolf@sourcefreedom.com>
# 
#       Description: This script is a small list comparison tool 
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

# Read source directories in array
mapfile -t oldnames < <(find ../ftarget7/example1/ -maxdepth 1 -mindepth 1 -type d | sort)
# Read target names in array
mapfile -t newnames < flist16.txt

echo "oldnames: ${#oldnames[@]} : ${oldnames[@]}"
echo "newnames: ${#newnames[@]} : ${newnames[@]}"

# Compare array sizes
[[ ${#oldnames[@]} -ne ${#newnames[@]} ]] && echo "Data inconsistent" && exit
