#!/usr/bin/env R

# Render R markdown (Rmd) to HTML or PDF.
#
# Usage:
#   R -q -f make.R --args [file.(html|pdf)] ...
#   R --quiet --slave --vanilla --file=make.R --args [file.(html|pdf)] ...

# load packages
require(rmarkdown)

# require a parameter naming file to render
args = commandArgs(trailingOnly=TRUE)
if (length(args) == 1) {
    if (endsWith(args[1], 'html')) {
        render(gsub('html$', 'Rmd', args[1]), html_document())
    } else if(endsWith(args[1], 'pdf')) {
        render(gsub('pdf$', 'Rmd', args[1]), pdf_document())
    }
} else {
    stop("ERROR: too many operands", call. = TRUE)
}
