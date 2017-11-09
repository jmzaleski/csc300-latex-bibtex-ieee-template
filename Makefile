csc300-aX.pdf: csc300-aX.dvi
	dvipdf csc300-aX.dvi
	ls -l csc300-aX.pdf

csc300-aX.ps: csc300-aX.dvi
	dvips csc300-aX.dvi -o csc300-aX.ps
	ls -l csc300-aX.ps

csc300-aX.dvi: csc300-aX.tex csc300-aX.tex IEEEtran.bst
	latex  csc300-aX # complains because no bibtex yet
	bibtex csc300-aX # now bibtex can do its stuff
	latex  csc300-aX 
	latex  csc300-aX # have to rerun latex until stops complaining about refs

IEEEtran.bst:
	echo downloaded from IEEE on CTAN

clean:
	rm -f *.bbl *.blg *.dvi *.lof *.log *.toc *.lot *.lof *.aux  *.ps *.pdf
