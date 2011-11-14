#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#       clean_pup.py
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
import os.path
import sys

def main():
    path = os.getcwd(); filelist = "moo"
    print path
    
    if len(sys.argv) == 1:
        root = os.system('pwd &1')
        print root, "following the if path"
    else:
        root = sys.argv[1]
        print root, "Following the else path"

#    for dir_name, sub_dirs, files in os.walk(root):
#        print '\n', dir_name
#        # Make the subdirectory names stand out with /
#        sub_dirs = [ '%s/' % n for n in sub_dirs ]
#        # Mix the directory contents together
#        contents = sub_dirs + files
#        contents.sort()
#        # Show the contents
#        for c in contents:
#            print '\t%s' % c
    flist = open('flist.txt', 'r')
    print flist.readline()
    topdir = os.getcwd()               
    print "Starting:", os.getcwd()
    print(topdir)
    
    print 'Starting:', os.getcwd()
    print 'Moving up one:', os.pardir
    os.chdir(os.pardir)
    print 'After move:', os.getcwd()



if __name__ == '__main__':
	main()

#  clean_pup.py

