#!/bin/bash
for file in ./.*
do
	if  [[ $file != ./.git* ]] && [[ $FILE != *.  ]] && [[ -f $file || -d $file ]];
	then
		FILE_NAME=$(basename "$file")
		CURRENT_DIR=$(pwd)
		SOURCE_PATH="$CURRENT_DIR/$FILE_NAME"
		TARGET_PATH="$CURRENT_DIR/../$FILE_NAME"
		ln -s $SOURCE_PATH $TARGET_PATH
	fi
done
