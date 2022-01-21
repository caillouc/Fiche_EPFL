command="pandoc ./Distributed_algorithms.md \
	-V geometry:margin=2.5cm \
	-V linkcolor:blue \
	--toc \
	--toc-depth=3 \
	--highlight-style=tango \
	--syntax-definition=da.xml \
	--pdf-engine=pdflatex \
	--standalone \
	-o ./Distributed_algorithms.pdf"
eval $command
open "./Distributed_algorithms.pdf"
