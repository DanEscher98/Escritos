#!/usr/bin/bash

# For files in ./Files
#       Store $num and $name
#       Append "$num $name" to titles.txt
#       Rename file as $num.md
# Compile
# Rename all files as $num_$name.md

function daily_note() {
	# if file with current date exists
	#	then return its name
	# else
	#	1. Ask for a tag and set name
	#	2. Touch file
	#	3. Fill the file with template
	#	4. Return the name
	CURRENT_DATE=$(date "+%a%d-%b-%y")
	TODAY_FILE=$(find Files/ -name "*_$CURRENT_DATE:*.md" | head -n 1)

	if [ ! -z "$TODAY_FILE" ]; then
		printf "$TODAY_FILE\n"
	else
		echo -n "Set a tag for the file: "
		read TAG
		NUM=$(bc <<< "$(ls Files | wc -l) + 1")
		FILE_NAME="Files/$NUM"_"$CURRENT_DATE:$TAG.md"
		echo "# $(date '+%A %d of %B-%y'):" > "./$FILE_NAME"
		echo "$FILE_NAME"
	fi
}

function remove_name() {
	for file_name in $(ls Files); do
		num=$(echo $file_name | sed -n 's/\([0-9]*\)_.*$/\1/p')
		name=$(echo $file_name \
			| sed -n 's/[0-9]*_\(\S*\)\.md$/\1/p')

		grep -qF "$num $name" titles.txt 2>&1
		if [ $? -ne 0 ]; then # Add if doesn't exist
			echo "$num $name" >> titles.txt
		fi
		if [ -n "$num" ]; then # Move if not null
			mv Files/"$file_name" Files/$num.md
		fi
	done
}

function restore_name() {
	for file_name in $(ls Files); do
		num=$(echo $file_name | sed -n 's/\([0-9]*\)\.md$/\1/p')
		name=$(grep -w "$num" titles.txt | awk '{ print $2 }')

		if [ -n "$num" ] && [ -n "$name" ]; then 
			mv Files/"$num".md Files/"$num"_"$name".md
		fi
	done
}
