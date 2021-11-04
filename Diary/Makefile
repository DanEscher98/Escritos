TARGET 	= main
EXT 	= pdf
FLAGS	= --shell-escape --interaction=nonstopmode

$(TARGET).$(EXT) :
	pdflatex $(FLAGS) $(TARGET).tex 1> /dev/null

pdf : $(TARGET).pdf
	evince $(TARGET).pdf

clear :
	rm -f -d -r _markdown_main/
	rm -f *.out *.aux *.lua *.log *.pdf
	clear && exa
