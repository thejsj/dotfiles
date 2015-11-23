#!/bin/bash
for file in ./.*
do
	if  [[ $file != ./.git* ]] && [[ -f $file || -d $file ]];
	then
		echo "File: $file"
		rm ../$file 
		ln -s $file ../$file
	fi
done
