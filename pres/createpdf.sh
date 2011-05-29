#!/bin/sh
BASENAME="110529-hafner+marques--klingomorph"
latex ${BASENAME}.tex
dvipdf ${BASENAME}.dvi ${BASENAME}.pdf
rm -f `ls | grep -v tex | grep -v pdf`
