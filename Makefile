all: slides.html

.dots: $(patsubst %.dot,%.png,$(wildcard *.dot))
	touch $@

%.png: %.dot
	dot $< -Tpng -o$@

slides.html: slides.Rmd .dots Makefile
	R -q -e 'rmarkdown::render("$<")'
