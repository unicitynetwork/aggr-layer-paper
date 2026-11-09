MAIN = aggregation-layer-lncs

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib
	latexmk -pdf -interaction=nonstopmode -file-line-error $<

clean:
	latexmk -c $(MAIN).tex
	rm -f DescriptionTexts.txt

.PHONY: all clean
