#!/bin/bash

for f in diagrams/*.svg; do
    g=`echo $f | sed -e "s/.svg/.pdf/"`
    inkscape -z -f $f --export-pdf $g --export-area-drawing
done

pdflatex dev_manual.tex && pdflatex dev_manual.tex && pdflatex dev_manual.tex

if [ "$1" == "-d" ]; then
    evince dev_manual.pdf
fi
