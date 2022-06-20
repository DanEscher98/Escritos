SHELL := /usr/bin/bash
TARGET 	= $(shell basename $(PWD))
FLAGS	= --shell-escape --interaction=nonstopmode

$(TARGET).pdf:
	@bash -c "source ./format.sh; remove_name"
	pdflatex $(FLAGS) main.tex 1> /dev/null
	@pdflatex $(FLAGS) main.tex 1> /dev/null
	@bash -c "source ./format.sh; restore_name"
	mv main.pdf $(TARGET).pdf

pdf: clear $(TARGET).pdf
	@evince $(TARGET).pdf
	@#mv $(TARGET).pdf $(HOME)/MyWindows/Working/Thoughts.pdf

clear:
	rm -rdf _markdown_main/
	rm -f *.out *.aux *.toc *.lua *.log *.pdf
	clear && exa

