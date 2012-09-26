all: inchi-cdk-bioclipse.pdf
	@echo "********* Latex Summary *********"
	@grep -i error inchi-cdk-bioclipse.log || true
	@grep -i warning inchi-cdk-bioclipse.log || true

update: inchi-cdk-bioclipse.pdf

inchi-cdk-bioclipse.bbl: inchi-cdk-bioclipse.bib
	pdflatex inchi-cdk-bioclipse || true
	bibtex inchi-cdk-bioclipse || true

inchi-cdk-bioclipse.pdf: inchi-cdk-bioclipse.tex inchi-cdk-bioclipse.bbl
	pdflatex inchi-cdk-bioclipse.tex
	pdflatex inchi-cdk-bioclipse.tex
	pdflatex inchi-cdk-bioclipse.tex

distclean: clean

clean:
	rm -f *.bbl *.aux inchi-cdk-bioclipse.pdf *.blg *.log *.ps *.fff *.lof *.lot *.ttt *.dvi *~ *.Rout *-blx.bib
