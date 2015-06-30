COMP = pdflatex
READ = evince
NAME = homogeneous

$(NAME).pdf: $(NAME).tex unswmaths.cls unswshortcuts.sty artwork/* Bibliography.bib
	$(COMP) $<
	bibtex $(NAME).aux
	$(COMP) $<
	$(COMP) $<

read: $(NAME).pdf
	$(READ) $^

clean:
	rm -f *.log *.aux *.lot *.lof *.toc *~ *.out *.blg *.bbl

spell: $(NAME).tex
	ispell $^

coffee:
	@echo "Knowing you, you've had enough."
