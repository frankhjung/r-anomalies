#!/usr/bin/make

.PHONY: clean cleanall
.SUFFIXES: .md .Rmd .html .pdf

%.html : %.md
	@pandoc $< -o $@

%.html: %.Rmd
	@R --quiet --slave --vanilla --file=make.R --args $@

%.pdf:	%.Rmd
	@R --quiet --slave --vanilla --file=make.R --args $@

clean:
	@$(RM) -rf cache figure *.log *.tex *.synctex.gz

cleanall: clean
	@$(RM) -rf *.html *.pdf

