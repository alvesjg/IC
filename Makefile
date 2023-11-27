# Makefile for LaTeX with BibTeX

# Nome do arquivo principal (sem a extensão .tex)
MAIN = main

# Comando para executar o pdfTeX
PDFLATEX = pdflatex

# Comando para executar o BibTeX
BIBTEX = bibtex

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(MAIN).bbl
	$(PDFLATEX) $<

$(MAIN).bbl: $(MAIN).aux
	$(BIBTEX) $(MAIN)

$(MAIN).aux: $(MAIN).tex
	$(PDFLATEX) $<

clean:
	rm -f *.aux *.log *.bbl *.blg *.out $(MAIN).pdf *.synctex.gz *.toc

.PHONY: all clean
