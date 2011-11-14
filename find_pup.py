#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#       find_pup.py
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
import os


def main():
    words = raw_input("enter a series of words: ")
    print(str(words))
    sTring = words.replace(' ', '_')
    print sTring
    

    print "Add all the jp2 files in the working folder to a list:"
    path = os.getcwd() 
    print path, "is the current working directory"
    place = os.system('ls')
    
    ext = '.py'
    filelist = []
    for filename in place:
        if filename.endswith(ext):
            filelist.append(filename)
    print(filelist)
    os.system('mkdir $sTring')
    #return 

if __name__ == '__main__':
    main()

