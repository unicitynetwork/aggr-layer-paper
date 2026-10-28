PROJ := uniqueness-service

.PHONY: all clean cleanall view FORCE

all: $(PROJ).pdf

%.pdf: %.tex FORCE
	latexmk -pdf -interaction=nonstopmode -file-line-error $<

view: $(PROJ).pdf
	open $(PROJ).pdf

clean:
	latexmk -c

cleanall:
	latexmk -C

FORCE:
