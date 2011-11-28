#!/bin/bash -x


for i in $(ls); do
       echo $i
       cd "$i"
       echo "changed dir to $(pwd)"

       ParentDir=$(echo "${PWD}" | awk -F'/' '{print $NF}')
       echo "ParentDir is $ParentDir"

       echo "trying to copy $i to ${ParentDir}_$i"
       if ! cp -v "${i}" ""$ParentDir"_"${i}""; then
               echo "    failed"
       else
               echo "    success"
       fi
       echo

       cd ..
       echo "changed dir to $(pwd)"
done
