TARGET 	= main
EXT 	= pdf

$(TARGET).$(EXT) :
	pdflatex --shell-escape $(TARGET).tex

clear :
	rm -f -d -r _markdown_main/
	rm -f *.out *.aux *.lua *.log
	clear && exa
