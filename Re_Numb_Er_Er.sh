#!/bin/bash -x
# -x
#
#       Re_Numb_Er_Er.sh         Version 1.0.0
#
#       Copyright 2011 Wolf Halton <wolf.halton@lyrasis.org>, LYRASIS
#
#       Description: This script takes a folderful of files and adds a 
#       sequential number to the file name.  
#       This is useful if your files are not sequential and ought to be.
#         
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
ml=100
while [[ "${ml}" -ne 0 ]]; do
	echo "Are you in the proper directory? "
	echo "CD into that parent directory.  Run this script." 
	echo "If you are not set up properly, stop this script with <CTRL> <C>"
	echo "Running this script in the wrong place could be very dangerous."
	echo "You are Here =>  ", $PWD
	echo "If this is not where you expected to be, enter an '0' to exit"
	echo "To test what your new file structure will look like without "
	echo " making changes, enter a '1' for 'test.'"
	echo " to make the changes to the file system, enter '2' for 'yes.'"
	read m1

	if [[ ${m1} -eq 0 ]]; then
		echo "The program will exit now without making any changes."
		break
	else
		if [[ ${ml} -eq 1 ]]; then
			echo "This is a test of the changes you are planning to make"
			break
		else
			if [[ ${ml} -eq 2 ]]; then
				echo "There is still time to change your mind"
				echo "If you are having second thoughts, press 'x' to quit"
				echo "If you intend to continue, press 'y'"
				read mm
				if [[ ${mm} -eq 0 ]]; then
					break
				else
					if [[ ${mm} -eq 2 ]]; then
						crawl=001
						for i in * ; do
							crawl="${crawl}"+1
							echo "cp '${i}' '${crawl}${i}'" 
							done
						echo "Your files are renamed.  "
						fi
					fi
				fi
			fi
		fi;
	done
