PROJ := agglayer

ifeq ($(OS),Windows_NT)
	OPEN := start
else
	UNAME := $(shell uname -s)
	ifeq ($(UNAME),Linux)
		OPEN := xdg-open
	else # Darwin
		OPEN := open
	endif
endif

.PHONY: view clean cleanall


%.pdf: FORCE
	latexmk -pdf -interaction=nonstopmode -file-line-error -synctex=1 $*

all: $(PROJ)

$(PROJ): $(PROJ).pdf

view: $(PROJ)
	$(OPEN) $(PROJ).pdf

clean:
	latexmk -c || true

cleanall:
	latexmk -C || true

FORCE:
