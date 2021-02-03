#!/bin/bash

# Copy Dot Files that are not git files
for file in $(find . -maxdepth 1)
do
	if  [[ $file != ./.git* ]] && [[ $file != *.  ]] || [[ $file = ./.gitconfig ]];
	then
		FILE_NAME=$(basename "$file")
		CURRENT_DIR=$(pwd)
		SOURCE_PATH="$CURRENT_DIR/$FILE_NAME"
		TARGET_PATH="$CURRENT_DIR/../$FILE_NAME"


		if ! [[ -L $TARGET_PATH ]];
		then

			# File
			if [[ -f $SOURCE_PATH ]];
			then
				echo -n "File ($TARGET_PATH) already exists. Do you want to delete it? (Y[es]/N[o]) "
				if read -t 60 DELETE_EXISTING_FILE;
				then
					if [[ $DELETE_EXISTING_FILE = y* || $DELETE_EXISTING_FILE == Y* ]];
					then
						rm $TARGET_PATH
						ln -s $SOURCE_PATH $TARGET_PATH
					else
						echo "File not linked. ($TARGET_PATH)"
					fi;
				else
					echo "File not linked. ($TARGET_PATH)"
				fi;
			else
				ln -s $SOURCE_PATH $TARGET_PATH
			fi

			# Directory
			if [[ -d $SOURCE_PATH ]];
			then
				echo -n "Directory ($TARGET_PATH) already exists. Do you want to delete it (rm -rf)? (Y[es]/N[o]) "
				if read -t 60 DELETE_EXISTING_FILE;
				then
					if [[ $DELETE_EXISTING_FILE = y* || $DELETE_EXISTING_FILE == Y* ]];
					then
						rm -rf $TARGET_PATH
						ln -s $SOURCE_PATH $TARGET_PATH
					else
						echo "File not linked. ($TARGET_PATH)"
					fi;
				else
					echo "File not linked. ($TARGET_PATH)"
				fi;
			else
				ln -s $SOURCE_PATH $TARGET_PATH
			fi;
		fi;
	fi;
done
