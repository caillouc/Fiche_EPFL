pandoc Distributed_algorithms.md -f markdown+tex_math_single_backslash -V geometry:margin=2.5cm -o Distributed_algorithms.pdf --toc --toc-depth=3 --highlight-style=tango --natbib --pdf-engine=pdflatex --standalone --syntax-definition=da.xml