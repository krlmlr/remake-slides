all: linear.png detailed.png full.png

%.png: %.dot
	dot $< -Tpng -o$@
