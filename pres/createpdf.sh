#!/bin/sh
BASENAME="110529-hafner+marques--klingomorph"
pdflatex ${BASENAME}.tex
rm -f `ls | grep -v tex | grep -v pdf`
