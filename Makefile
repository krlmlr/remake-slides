all: slides.html

.dots: $(patsubst %.dot,%.png,$(wildcard dots/*.dot))
	touch $@

dots/%.png: dots/%.dot
	dot $< -Tpng -o$@

slides.html: slides.Rmd .dots Makefile
	R -q -e 'rmarkdown::render("$<")'
