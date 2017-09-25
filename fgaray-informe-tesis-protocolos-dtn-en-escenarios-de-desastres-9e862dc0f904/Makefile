RM_CMD=-f


all:
	latexmk

test:
	apvlv informe.pdf

clean:
	latexmk -c
	@rm $(RM_CMD) informe.bcf
	@rm $(RM_CMD) informe.fdb_latexmk
	@rm $(RM_CMD) informe.fls
	@rm $(RM_CMD) informe.pdf
	@rm $(RM_CMD) informe.run.xml
	@rm $(RM_CMD) informe.aux
	@rm $(RM_CMD) informe.bbl
	@rm $(RM_CMD) informe.log
	@rm $(RM_CMD) diff.bcf
	@rm $(RM_CMD) diff.fdb_latexmk
	@rm $(RM_CMD) diff.fls
	@rm $(RM_CMD) diff.pdf
	@rm $(RM_CMD) diff.run.xml
	@rm $(RM_CMD) diff.aux
	@rm $(RM_CMD) diff.bbl
	@rm $(RM_CMD) diff.log



spell:
	./spell-check.sh


diff:
	cat informe_nuevo.tex | detex > nuevo.tex
	cat informe_viejo.tex | detex > viejo.tex
