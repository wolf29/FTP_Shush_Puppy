#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#       ftp_up.py
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
import clean_pup, find_pup


def main():
    """This script requires you enter
    source folder, ftp IP address, ftp user and password
    for your output"""
    choice = 100
    a = 'a'
    basedir = ""
    zippy = ""
    desdirname = ""
    while a == 'a' or a == 'A':
        print("Enter a '1' to start a project or '2' to exit.")
        choice = input("Do you wish to start an FT Puppy project: ")
        if choice == 1:
            choice2 = 100
            while choice2 != 999:
                print("""OK now comes the time to say what your source
                Directory and Zip file name are""")
                basedir = raw_input('Enter the path to your source\n Example "/home/name/source_dir/"\n[::]  ')
                zippy = raw_input("\nEnter the name for your zip file\n[::] ")
                desdir = basedir+zippy
                print("\n----------------------------------------\nThe path to your source directory is\n %s,\nYour zip file will be called %s \nand your destination file is \n%s.\nYou may wish to inspect your destination file before you zip it for upload" % (basedir, zippy, desdir))
                accurate = 1
                print("If this information is correct type '1'\nIf there is an error, type '2'\nIf you wish to quit, type '3'")
                accurate = input("Enter 1, 2 or 3 [::] ")
                if accurate ==1:
                    continue
                elif accurate ==2:
                    break
                elif accurate == 3:
                    choice2 = 999
                
	return 0

def clean_pup(basedir, zippy, desdir):
    return basedir, zippy, desdir
    
    
def upload(desdir):
    ftpname = raw_input("Enter FTP Username: ")
    ftppass = raw_input("Enter FTP password: ")
    print("You would have uploaded something")
    return 0

if __name__ == '__main__':
	main()

