
name=robust2

texsources=$(name).tex 

$(name).pdf : $(texsources) $(name).bib figs/
	make -C figs
	latexmk -pdf -interaction=nonstopmode $(name)

reset : clean $(name).pdf

clean :
	rm -f $(name).pdf

install: $(name).pdf
	scp $< cglab.ca:public_html/publications/drafts/$(name)/$(name)-`date --iso`.pdf
