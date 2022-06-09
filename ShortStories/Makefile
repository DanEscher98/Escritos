SHELL := /usr/bin/bash
TARGET 	= main
EXT 	= pdf
FLAGS	= --shell-escape --interaction=nonstopmode

$(TARGET).$(EXT):
	@bash -c "source ./format.sh; remove_name"
	pdflatex $(FLAGS) $(TARGET).tex 1> /dev/null
	@bash -c "source ./format.sh; restore_name"

pdf : $(TARGET).pdf
	@#evince $(TARGET).pdf
	cp $(TARGET).pdf $(HOME)/MyWindows/Working/ShortStories.pdf

clear:
	rm -f -d -r _markdown_main/
	rm -f *.out *.aux *.lua *.log *.pdf
	clear && exa

