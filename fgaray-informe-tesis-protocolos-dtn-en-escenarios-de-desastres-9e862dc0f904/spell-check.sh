#!/bin/bash

echo "" > errors.txt

#for file in *.tex; do
  #echo "$file" >> errors.txt
  #aspell --lang=es -a -t -d castellano --add-extra-dicts=./spell.pws < $file | grep ^\& >> errors.txt
  #echo "" >> errors.txt
  #echo "" >> errors.txt
#done

#echo "" > errors.txt
#aspell --lang=es -a -t -d castellano --add-extra-dicts=./spell.pws < arte.tex | grep ^\& >> errors.txt
#echo "" >> errors.txt
#echo "" >> errors.txt

#echo "" > errors.txt
#aspell --lang=es -a -t -d castellano --add-extra-dicts=./spell.pws < desarrollo/movilidad.tex | grep ^\& >> errors.txt
#echo "" >> errors.txt
#echo "" >> errors.txt


#echo "" > errors.txt
#aspell --lang=es -a -t -d castellano --add-extra-dicts=./spell.pws < apendices/optimizaciones.tex | grep ^\& >> errors.txt
#echo "" >> errors.txt
#echo "" >> errors.txt


echo "" > errors.txt
aspell --lang=es -a -t -d castellano --add-extra-dicts=./spell.pws < apendices/simulaciones_dinamico.tex | grep ^\& >> errors.txt
echo "" >> errors.txt
echo "" >> errors.txt
