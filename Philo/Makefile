TARGET 	= main
EXT 	= pdf
FLAGS	= --shell-escape --interaction=nonstopmode

$(TARGET).$(EXT) :
	@$(shell for file_name in $(ls Files); do
	num=$(echo $file_name | sed -n 's/\([0-9]*\)_.*$/\1/p')
	name=$(echo $file_name | sed -n 's/[0-9]_\(\S*\)\.md$/\1/p')
	grep -qF "$num $name" titles.txt 2>&1
	[ $? -ne 0 ] && echo "$num $name" >> titles.txt
	[ -n "$num" ] && mv Files/"$file_name" Files/$num.md
	done)
	pdflatex $(FLAGS) $(TARGET).tex 1> /dev/null
	@$(shell for file_name in $(ls Files); do
	num=$(echo $file_name | sed -n 's/\([0-9]*\)\.md$/\1/p')
	name=$(grep -w "$num" titles.txt | awk '{ print $2 }')
	[ -n "$num" ] && [ -n "$name" ] && mv Files/"$num".md Files/"$num"_"$name".md
	done)

pdf : $(TARGET).pdf
	#evince $(TARGET).pdf
	mv $(TARGET).pdf $(HOME)/MyWindows/Working

clear :
	rm -f -d -r _markdown_main/
	rm -f *.out *.aux *.lua *.log *.pdf
	clear && exa
