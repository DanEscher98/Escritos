SHELL := /usr/bin/bash
TARGET 	= $(shell basename $(PWD))
FLAGS	= --shell-escape --interaction=nonstopmode
EDITOR	= nvim +'colorscheme PaperColor'

$(TARGET).pdf: main.tex
	@bash -c "source ./format.sh; remove_name"
	pdflatex $(FLAGS) main.tex 1> /dev/null
	@pdflatex $(FLAGS) main.tex 1> /dev/null # 2nd compilation for TOC
	@bash -c "source ./format.sh; restore_name"
	mv main.pdf $(TARGET).pdf

note: ./Files
	$(EDITOR) $(shell bash -c "source ./format.sh; daily_note")

pdf: $(TARGET).pdf clear
	@#evince $(TARGET).pdf
	@#cp $(TARGET).pdf $(HOME)/Downloads
	@cp $(TARGET).pdf $(HOME)/MyWindows/Downloads

clear:
	@rm -rdf _markdown_main/
	@rm -f *.out *.aux *.toc *.lua *.log *.err
	@clear && exa

.PHONY: clear

