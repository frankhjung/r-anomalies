#!/usr/bin/make

.SUFFIXES:	.md .Rmd .html .pdf
.DEFAULT:	anomalies.html

%.html : %.md
	@pandoc $< -o $@

%.html: %.Rmd
	@R --quiet --slave --vanilla --file=make.R --args $@

%.pdf:	%.Rmd
	@R --quiet --slave --vanilla --file=make.R --args $@

.PHONY: clean
clean:
	@$(RM) -rf cache figure *.log *.tex *.synctex.gz

.PHONY: cleanall
cleanall: clean
	@$(RM) -rf *.html *.pdf
