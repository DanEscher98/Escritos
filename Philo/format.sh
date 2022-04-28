#!/usr/bin/bash

# For files in ./Files
#	Store $num and $name
# 	Append "$num $name" to titles.txt
# 	Rename file as $num.md
# Compile
# Rename all files as $num_$name.md


for file_name in $(ls Files); do
	num = $(echo $file_name | sed -n 's/\([0-9]*\)_.*$/\1/p')
	name = $(echo $file_name \
		| sed -n 's/[0-9]_\(\S*\).md$/\1/p')
	if [ ! grep -qF "$num $name" titles.txt 2>&1 ]; then
		echo "$num $name" >> titles.txt
	fi
	mv Files/"$file_name" Files/$num.md
done


