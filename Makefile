# RMarkdown files
RMD_SRC = $(filter-out README.Rmd, $(wildcard *.Rmd))

all: pages

pages:${RMD_SRC} _site.yml
	rm -rf docs
	R -q -e 'if (!requireNamespace("remotes", quietly=FALSE)) install.packages("remotes", repos="https://cran.rstudio.com/"); remotes::install_deps()'
	R -q -e 'rmarkdown::render_site()'
	mv _site docs

check-spelling:
	Rscript -e "source('check-spelling.R')"
