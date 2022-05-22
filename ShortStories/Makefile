TARGET 	= CuentosCortos
EXT 	= pdf
FLAGS	= --shell-escape --interaction=nonstopmode

$(TARGET).$(EXT) :
	pdflatex $(FLAGS) main.tex 1> /dev/null
	mv main.pdf $(TARGET).$(EXT)

pdf : $(TARGET).$(EXT)
	mv $(TARGET).$(EXT) $(HOME)/MyWindows/Working


clear :
	rm -f -d -r _markdown_main/
	rm -f *.out *.aux *.lua *.log *.pdf
	clear && exa
