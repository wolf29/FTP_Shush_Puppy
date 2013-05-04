FTP_Shush_Puppy
===============

Table of Contents
VPN into Lyrasis.Local  1
Order of Precedence	2
Byobu	2
First Byobu Session	3
Adding Screens	3
To detach the byobu/screen session 	3
Match the invoice with the folders sent.	4
check for empty files 	4
Mirror_Structure.sh 	4
Underscore_Eviscerator_2.sh	5
Underscore_eviscerator.sh	5
Make the new File-name List 	5
Filename_Checker.sh Version 1.0.0	5
Renamer.sh         Version 1.0.0	6
Parentify.sh	6
Marc_Er.sh         Version 1.0.0	6
Re_Numb_Er_Er.sh         Version 1.0.0	6
File_Zipper.sh Version 1.0.0	7
Up_Loader.sh	7
Tools, Snippets and Obsolete Scripts	8
TestCreator.sh Version 0.0.1	8
ThumbNailer.sh	8
ntest.sh	8
Marc_Pusher	9
How-cp-works.sh	9
mvmv2.sh	9


[Usage note: “#” is the symbol that tells the bash shell that what follows is a comment if you accidentally copy and paste a line like

ls -l # this command shows you the detail view of the present working directory.

Only the part before the “#” is run as a command by the server.]

ssh [test_server]

log in with your own credentials

The way to make sure somebody hasn’t been in before you and saves stuff to an unreachable state is to 

cd /media/[WORK_DISK]/  # This is an example drive in the drive-toaster

Check the ownership of the data on the drive

your_login@[test_server]:/media/[WORK_DISK$ ls –l

Do do the following anywhere but the work disk or in your  home folder.  Changing permissions indiscriminately will hose your system.

In the off chance that you are not the owner of the files, run:

$ sudo chown -R your_login ./*

$ sudo chmod -R 775 ./*

From this test server, you can shell into the ftp server as the lyrasis user, which is the user that invokes the upload script, without using a password.  To do this:

ssh ftp_user@ftp.server.org

Put your public ssh key into the ~/ftp_user/.ssh/authorized_keys so your scripts work to upload the files without a password.  You may need the ftp_user on the ftp server to have sudo, but not to upload the files to its own home folder.

This is a series of scripts for working with uploading to digital repositories.  The way we use these requires that you know the:

Collection origin – on the hard drive that came from the digitizers

Collection mirror directory – on your local harddrive – A reasonable mirror-naming convention is “Original_collection_name.”  Since you are sending your original disk back to the digitization company, you need a true copy of the original on a local drive.

collection work directory – also on your local hard drive, and starts off as a perfect copy of the mirror directory. A sane naming convention for this directory is  “Original_collection_name_work.”  Work in the work directory rather than you copy of original.

collection ftp-staging directory – the place from which the final zipped files are uploaded to the FTP server.  By default this will be “Original_collection_name_work_ftp_staging.” 

ftp-server collection destination directory – You will create this folder on the ftp server.  A sane name for the folder here is “Original_collection_name,” since the Internet Archives uploaders want a folder-name that matches the collection owner's name.

-- Order of Precedence

--Scripts List (in order of use to process and upload images)

-- Byobu

Suggestion: use a byobu session to run these scripts.

Byobu is a wrapper for screen, which lets you have multiple terminal sessions (among other features).

To start the byobu session, type

byobu

One of the major features of byobu is that the byobu session is not controlled by your ssh shell session.  If the connection drops, byobu is still running on the server, so all the setup you have done or applications you are running in a screen in byobu are actually fine.  When you are able to shell back in, you type byobu again and it asks you were in or if you want to start a new session
You can also break your shell session on purpose and the byobu session remains active
  Note: by break, I mean “X” out of the client application without attempting to shut-down the session properly.  If you were logged into the server from the console, you would just lock the screen and walk away.

First Byobu Session
In your first byobu session, the application asks you if you want to use emacs-style commands or screen-style controls  Choose “1” for screen-like controls.

Adding Screens

[Ctrl][c]

This command will add virtual screens to your terminal session.  At the bottom of the terminal window, you now have a bash #0 and #1.

Moving from one screen to the next sequential screen

[Ctrl][n]  # “n” for “next”


To detach the byobu/screen session 

[Ctrl][d]

When you return the command "screen -r" will resume your screen session.

To learn more about basic commands in byobu, look at this web page.  
http://dj-bri-t.net/2009/10/gnu-screen-and-byobu-made-easy/ 

Match the invoice with the folders sent.
Match the invoice that is in the same folder as the collection directories with the folders sent.  

check for empty files 

$ find . -empty | wc -l  
# The “$” is right end of the command prompt for a regular user
# The “#” at the beginning of a command in this document is the right end of the command prompt for the root user.

If there are any empty files alert Upstream, because you cannot make a file out of empty air, and that is what you are preparing to do if the missing file is not reported.

--- Mirror_Structure.sh 

This script makes an exact copy of the original collection file-structure on your working harddrive, but moves only one type of file to the mirror.  The file type that InternetArchives.org seems to like is .jp2.

Mirror_Structure lets you double-check that the root directory of the collection is right and asks for the new mirror location.  To make your life easier, change directory to the directory you wish to copy from the Source disk, for instance

$ cd /media/Source_disk/[Example library or college]
Example
$ cd /media/Source_disk/”Bowdoin University”  
# Often source filenames have spaces in them. We don't need to fix this on the source disk, but we will fix it on the local disk.

Mirror_Structure copies the directory structure of the source collection and the image files.  
1 You are asked for the source directory you want to mirror.  If you are already in the source directory type a '.' and hit enter.  This is a single dot without the quotes.

The script then asks for the destination directory.  This is where something like:
/media/WORK_DISK/Bowdoin_University 
makes sense.  Get rid of the spaces in the filename.  They will break subsequent scripts.

It then asks you for a filetype to transport, and moves them all across into their own proper place in the mirrored structure.

jp2

Then spot-check the image directories to see if the file structure matches the Wonderfetch form.  

--- Underscore_Eviscerator_2.sh

Description: This script recursively replaces spaces with underscores in the names of all objects in the directory so that the names can be manipulated safely.  This script does not check for anything but spaces in the filenames.  If your filenames have special characters in them, you might want to use underscore_eviscerator.sh

Underscore_eviscerator.sh

Description: This script replaces spaces and special characters with underscores in all objects in the directory so that the names can be manipulated safely.

“Long Island Tea, volume 277 Issue 1 – 20” becomes 
“Long_Island_Tea_volume_277_Issue_1–20”

Make the new File-name List 
Take the file-names from the wonderfetch file-names field and put them into a text file.  Use one line per  file name and make sure there are no errant spaces in any lines.
Filename_Checker.sh Version 1.0.0

For testing whether the titles and file structure line up.  This displays the directories in the file-structure and the list of new names in the title_file but makes no changes.  It does not display files (as opposed to folders) and so you need to make sure that the directory names in the collection are earlier in the alphabet than the names of any files in the collection directory.

--- Renamer.sh         Version 1.0.0

Description: This script takes a set of directories and renames them based upon a list of new names.  It simply reads down the list and replaces the directory name at the same place on the list with the name on the list.

The names of the files are created from the Title field of the Wonderfetch document and the Volume Field.  If there is no year in the Title field, then get that from the Pub Date field.  Years should be fully expanded, e.g. "2000-2001" or "2000."  No "1923-4" or "1897-98" style year notation.  An alternate naming convention comes from a list of directory-names that Laurie prepares.

Cd to the collection directory, if you are not already there.  

$ cd /media/LYRASIS_Mule_4/Bowdoin_University_work/ 

First the script requests the path to the filename list, e.g.,  ../flist.txt if the file is in the container folder or just flist.txt if the file is in the present working directory.  You can also use absolute paths here, e.g. /home/rdale/MaddDigNotes/Oct_2012/Bowdoin_University/flist.txt

--- Parentify.sh

Description: This script recursively concatenates as a prefix the Parent directory name with the file name.  This is the production version of mvmv2.sh which tests this function.

The jp2 files inside the directory “Long_Island_Tea_volume_277_Issue_1–20” become 
“Long_Island_Tea_volume_277_Issue_1–20_0000001”
“Long_Island_Tea_volume_277_Issue_1–20_0000002”
“Long_Island_Tea_volume_277_Issue_1–20_0000003”
and so on.

--- Marc_Er.sh         Version 1.0.0

Description: This script adds the marc.xml file to each first-level child folder. Run Marc_Er.sh after running Parentify.sh

Copy the marc.xml file for this collection to the parent collection folder under the name “marc.xml”

cd inside the collection folder and run this script.
$ cd /media/LYRASIS_Mule_4/Bowdoin_University_work/ 
It will add all the marc files properly named, into each subfolder.

--- Re_Numb_Er_Er.sh         Version 1.0.0


This script is optional but not experimental.

Description: This script takes a folderful of files and adds a sequential number to the file name. This is useful if your files are not in sequential number-range and ought to be.  Where we use it is in the case that a particular collection title crosses a microfiche-roll-boundary.  Say you have a directory called "Daily_News_1914_vol_2" at the end of roll 2 and another identically-named folder at the beginning of roll 3.  Spot-checking shows the former folder to be the first 4 issues of the volume year and the latter folder to be the last 8 issues of the volume year.  This is expected, and one would wish to put the images from the latter folder into the former and run parentify.sh and carry on from there.  However, the numbers assigned to the images in the former folder are in a range from 000000459.jp2 to 000000917.jp2, and the images in the latter folder start with 000000004.jp2.  If you just dump the pictures from the latter into the former, then the later issues will come before the first four issues.  This being an impossible situation that will not pass  Q & A, the Re_Numb_Er_Er.sh tool was born.  This script adds in an index number above the numbers in the latter folder.  It is a blunt instrument and just works with the strings.  000000004 becomes 000010004 and it climbs down the list adding the index '1' into all the files.  There is a large gap between the range of numbers in the latter folder and the range of numbers  in the former folder, but this is not important, as it ensures that the files from the latter folder are going to drop into sequence properly.

1. 	CD into the folder where the sequence needs to be raised by 10,000
2. 	Run this script
3. 	$ ls the folder to see that the files have been renamed properly
4. 	Move these files to the former folder 

--- File_Zipper.sh Version 1.0.0

Description: This script grabs the jp2 files in a given folder and compresses them into a file with the name  "FolderName_images.zip" 

Make sure you are in the working directory

$ cd /media/[WORKING_DISK]/Bowdoin_University_work/ 

The script is entirely automated but takes a long time.  It would create in this example, 
/media/{WORKING_DISK/Bowdoin_University_work_ftp_staging/ 

--- Up_Loader.sh

Description: This script starts the upload to the proper directory in the FTP server

Make sure your PWD is the ftp-staging directory created by the File_Zipper.sh script.

Example: 

Up_Loader.sh collection_name/  #puts the collections into the folder named "collection_name" You have to make sure that on the ftp server there is a directory of that name that is in the ftp folder on the ftp server, and it is owned by lyrasis in group ftp 

chown -R ftp_user:ftp   collection_name

chmod -R 775 collection_name



-- Tools, Snippets and Obsolete Scripts

========================================

--- TestCreator.sh Version 0.0.1

Description: This script creates a test environment by grabbing the jp2 files in a given collection folder and moving them to a testing environment"

--- ThumbNailer.sh

Script to create thumbnails using Imagemagick.  Creates 22% resized jpg files from the jp2 files.  This works only inside a single folder, and produces a "pretty" filename, i.e., "file00213.jp2" => "file00213.jpg".

This file also contains a fast and dirty one-liner that works recursively into subdirectories, however it produces ugly filenames, i.e. "file00213.jp2.jpg".  To get the code for this line
$ less ThumbNailer.sh 

$ cd /media/[WORK_DISK]/Bowdoin_University_work/
$ find -type f -name "*.jp2" -exec convert {} -resize 22% {}.jpg \;
$ Creates jpg copies of your jp2 files in the work folder.

Run Mirror_Structure.sh on this collection and isolate for jpg files in the new /media/LYRASIS_Mule_4/Bowdoin_University_work_jpgs directory.
Then you can download the jpg directory to your desktop to look at the puctures without having to download 3MB jp2 files.

You can choose any percentage of resize in this one-liner.

--- ntest.sh

Description: This script is a small list-comparison tool

--- Marc_Pusher

Description: an early version of Marc_Er.sh. You would run this before you ran Parentify.sh

--- How-cp-works.sh

Description: This is a test of cp recursively, but it is not a useful tool as it stands, and can be considered “Under construction”

   -mvmv2.sh

Description: This script finds files within the present working directory and renames them to "${PWD}filename"  Obsolete.
