all: docs/index.html

.dots: $(patsubst %.dot,%.png,$(wildcard dots/*.dot))
	touch $@

dots/%.png: docs/dots/%.png
	ln -sf $(PWD)/$< $@

docs/dots/%.png: dots/%.dot
	dot $< -Tpng -o$@

docs/index.html: index.Rmd .dots Makefile
	R -q -e 'rmarkdown::render("$<", output_dir = "docs")'
