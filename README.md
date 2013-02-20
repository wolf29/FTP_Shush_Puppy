FTP_Shush_Puppy
===============

A series of scripts for working with uploading to digital repositories.  The way we use these requires that you know the 
collection origin directory - on the hard drive that came from the digitizers
collection mirror directory - on your local harddrive
collection work directory - also on your local hard drive, and starts off as a perfect copy of the mirror directory
collection ftp-staging directory - the place from which the final zipped files are uploaded to:
ftp-server collection destination directory.  

--Scripts List (in order of use to process and upload images)

Mirror_Structure.sh

Filename_Checker.sh

Underscore_Eviscerator_2.sh or
Underscore_Eviscerator.sh
Filename_checker.sh

Renamer.sh

Re_Numb_Er_Er.sh

Parentify.sh

Marc_Er.sh

File_Zipper.sh

Up_Loader.sh

TestCreator.sh

ThumbNailer.sh

ftp_up.py (obsolete)

ftp_up.sh (obsolete version of Mirror_Structure)

ntest.sh

How-cp-works.sh

mvmv2.sh

Old_Filename_checker.sh

-- Order of Precedence

When you get the drives in with the content to be uploaded, make sure it matches the invoice that came withthe disk
check for missing files 

  $ find . -empty | wc -l
  
if there are any empty files alert Upstream, because you cannot amke a file out of empty air, and that is what you are preparing to do if the missing file is not reported.

Then spot-check the image directories to see if the file structure matches the Wonderfetch form.  If you have the authority, it is far easier to adjust the Wonderfetch form to the file structure rather than attempting to adjust the file-structure itself.  

--- Mirror_Structure.sh 

This script makes an exact copy of the original collection file-structure on your working harddrive, but moves only one type of file to the mirror.  The file type that InternetArchives.org seems to like is .jp2.
Mirror_Structure lets you doublecheck that the root directory of the collection is right and asks for the new mirror location.

It then asks you for a filetype to transport, and moves them all across into their own proper place in the mirrored structure.

--- Underscore_Eviscerator_2.sh

Description: This script recursively replaces spaces with underscores in the names of all objects in the directory so that the names can be manipulated safely.  This script does not check for anything but spaces in the filenames.  If your filenames have special characters in them, you might want to use underscore_eviscerator.sh

---  Underscore_eviscerator.sh

Description: This script replaces spaces and special characters with underscores in all objects in the directory so that the names can be manipulated safely.

--- Filename_Checker.sh Version 1.0.0

For testing whether the titles and file structure line up.  This displays the file-structure and the list of new names in the title_file but makes mo changes.  

--- Renamer.sh         Version 1.0.0

Description: This script takes a set of directories and renames them based upon a list of new names.  It simply reads down the list and replaces the directory name at the same place on the list with the name on the list.

The names of the files are created from the Title field of the Wonderfetch document and the Volume Field.  If there is no year in the Title field, then get that from the Pub Date field.  Years should be fully expanded, e.g. "2000-2001" or "2000."  No "1923-4" or "1897-98" style year notation.  

--- Parentify.sh

Description: This script recursively concatenates as a prefix the Parent directory name with the file name.  This is the production version of mvmv2.sh which tests this function.

---  Marc_Er.sh         Version 1.0.0

Description: This script adds the marc.xml file to each first-level child folder. Run Marc_Er.sh after running Parentify.sh

--- Re_Numb_Er_Er.sh         Version 1.0.0

This script is optional but not experimental.

Description: This script takes a folderful of files and adds a sequential number to the file name. This is useful if your files are not sequential and ought to be.  Where we use it is in the case that a particular collection title crosses a microfiche-roll-boundary.  Say you have a directory called "Daily_News_1914_vol_2" at the end of roll 2 and another identically-named folder at the beginning of roll 2.  Spot-checking shows the former folder to be the first 4 issues of the volume year and the latter folder to be the last 8 issues of the volumen year.  This is expected, and one would wish to put the images from the latter folder into the former and run parentify.sh and carry on from there.  However, the numbers assigned to the images in the former folder are in a range from 000000459.jp2 to 000000917.jp2, and the images in the latter folder start with 000000004.jp2.  If you just dump the pictures from the latter into the former, then the later issues will come before the first four issues.  This being an impossible situation that will not pass  Q & A, the Re_Numb_Er_Er.sh tool was born.  This script adds in an index number above the numbers in the latter folder.  It is a blunt instrument and just works with the strings.  000000004 becomes 000010004 and it climbs down the list adding the index '1' into all the files.  There is a large gap between the range of numbers in the former folder, but this is not important, as it ensures that the files from the latter folder are going to drop into sequence properly.

--- File_Zipper.sh Version 1.0.0

Description: This script grabs the jp2 files in a given folder and compresses them into a file with the name  "FolderName_images.zip" 
Make sure you are in the working directory

---  Up_Loader.sh

Description: This script starts the upload to the proper directory in the FTP server

Make sure your PWD is the ftp-staging directory created by the File_Zipper.sh script.

-- Tools, Snippets and Obsolete Scripts
========================================
--- TestCreator.sh Version 0.0.1
Description: This script creates a test environment by grabbing the jp2 files in a given collection folder and moving them to a testing environment"

--- ThumbNailer.sh
Script to create thumbnails using Imagemagick.  Creates 7% resized jpg files from the jp2 files.  This works only inside a single folder, and produces a "pretty" filename, i.e., "file00213.jp2" => "file00213.jpg".
This file also contains a fast and dirty one-liner that works recursively into subdirectories, however it produces ugly filenames, i.e. "file00213.jp2.jpg".

--- ntest.sh
Description: This script is a small list-comparison tool

--- Marc_Pusher
Description: an early version of Marc_Er.sh You would run this before you ran Parentify.sh

--- How-cp-works.sh
Description: This is a test of cp recursively, but it is not a useful tool as it stands

--- mvmv2.sh
Description: This script finds files within the present working directory and renames them to "${PWD}filename"  
