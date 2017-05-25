MAIN := series-notes.tex
TARGETS := series-notes.pdf

# Change these for your needs
ifeq ($(shell uname), Linux)
	PDFLATEX := /usr/texlive/2013/bin/x86_64-linux/pdflatex
	BIBTEX := /usr/texlive/2013/bin/x86_64-linux/bibtex
	OPEN := xdg-open
else
	PDFLATEX := pdflatex
	BIBTEX := bibtex
	OPEN := open
endif


all: $(TARGETS)

open: $(TARGETS)
	open $^

series-notes.pdf: series-notes.tex preamble.tex

%.pdf: %.tex
	$(PDFLATEX) $<
	$(PDFLATEX) $<

clean:
	rm -f $(TARGETS) $(TARGETS:.pdf=.aux) $(TARGETS:.pdf=.log)
