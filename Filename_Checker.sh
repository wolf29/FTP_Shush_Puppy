#!/bin/sh -x


# for testing whether the titles and file structure line up
echo "Enter the name and relative location of the title file"
read title_file
echo "cd to the directory you are processing"
echo "Enter the directory location from which we will extract subdirectories and files."
echo "enter the absolute or relative path to this directory.
echo " './' is valid for checking the present working directory."
read directory

# Read source directories in array
mapfile -t oldnames < <(find $directory -maxdepth 1 -mindepth 1 -type d | sort)
# Read target names in array
mapfile -t newnames < $title_file

echo "oldnames: ${#oldnames[@]} : ${oldnames[@]}"
echo "newnames: ${#newnames[@]} : ${newnames[@]}"

# Compare array sizes
[[ ${#oldnames[@]} -ne ${#newnames[@]} ]] && echo "Whoa there, pardner - there is a problem with your data" && exit
[[ ${#oldnames[@]} -eq ${#newnames[@]} ]] && echo "The arrays have identical lengths - You can continue to the next stage" && exit



