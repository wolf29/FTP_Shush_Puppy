#!/bin/sh -x

# for testing whether the titles and file structure line up
echo "Enter the name and relative location of the title file"
read tfile
echo "Enter the directory location from which we will extract subdirectories and files."
read drectory

a=0
while read line
    do a=$(($a+1));
    # echo $a;
    done < "$tfile"
#echo "Final line count is: $a"
#echo $?

find "$drectory" -type d  > "c.dat"
cat ./c.dat
b=-1
while read line
    do b=$(($b+1));
    # echo $b;
    done < "c.dat"
echo "Folders and files in directory: $b"
echo "Final line count: $a"
#echo $?

j=$(echo "$a - $b" | bc)
#echo $j
if [ $j -ne 0 ]
    then
    echo "Whoa there, pardner - there is a problem with your data"
    exit 113
    #echo $?
    break
else
    echo "The structure is balanced .. We will continue."
    #echo $?
fi
