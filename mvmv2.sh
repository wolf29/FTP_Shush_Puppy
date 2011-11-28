#!/bin/bash

shopt -s globstar

for f in $PWD/**
do
 if [ -f "$f" ]
 then
   echo $f is a file
   d="${f%/*}"; d=${d##*/}
   echo mv -v "$f" "${f%/*}/${d}_${f##*/}"
 else
   echo $f is a dir
 fi
done
