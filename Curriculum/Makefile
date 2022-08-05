TARGET		= Curriculum
TEMPLATES 	= Preamble_CV.tex
FLAGS  		= --interaction=nonstopmode

$(TARGET).pdf : $(TARGET).tex $(TEMPLATES)
	pdflatex $(TARGET).tex $(FLAGS) 1> /dev/null

open: $(TARGET).pdf
	evince $(TARGET).pdf

clear:
	rm -f *.aux *.log *.out *.pdf
	clear && exa --color=always
