MAIN := series-notes.tex
TARGETS := series-notes.pdf

# Change these for your needs
ifeq ($(shell uname), Linux)
	PDFLATEX := pdflatex
	BIBTEX := bibtex
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
