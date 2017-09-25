# IMPORTANTE

Si encuentras un error por favor da aviso [aquí](https://bitbucket.org/haskmell/clase-latex-memoria-diinf/issues?status=new&status=open).
Puede ser en español o ingles. Si es un error en el que el formato no concuerda
con el pedido por el Departamento de Informática, especifica en que documento y pagina esta
definido ese formato. También es de gran ayuda que incluyas el documento que
estas usando y un pdf compilado.


Si sabes cómo solucionar el problema puedes hacer un fork, arreglar el problema
y luego hacer un Pull Request. Lee la sección de desarrollo para más
información.


## Versiones

Existen dos versiones: en la branch master se encuentra la versión 16-2 del
formato de memoria y en la rama v15 la versión 15.

# Como usar la clase

*NOTA: Esta sección no pretende ser un tutorial de LaTeX*

Para usar esta clase necesitas tener instalado pdflatex. Es recomendable que se
instalen todos los paquetes de la suite latex.


## Compilación

La compilación se puede realizar por medio de latexmk.


## Agregando la tesis a un documento

Puede utilizar el archivo prueba.tex cómo base para sus documentos. En otros
archivos debe incluir en el preámbulo lo siguiente:

        \documentclass{tesis}
                
Ese comando va a agregar todo lo necesario para que el documento generado
respete el formato de memoria.


## Portada

La portada se genera sola con el comando \portada. Aquí hay un ejemplo de uso:

        \portada{TITULO}{AUTOR}{PROFESOR, AYUDANTES}{FECHA}
                
                
## Indices

El comando \indices genera los indices de: capítulos, tablas y figuras. Se
utiliza simplemente así:

        \indices



## Capitulos

Los capítulos son generados por el comando \capitulo:

        \capitulo{TITULO CAPITULO}
                
LaTeX solo capitaliza el titulo y se encarga de los headers.


### Seccion, Subseccion y Subsubseccion

Estos comandos crean secciones dentro de un capitulo. Se utilizan igual que el
comando capitulo. Es responsabilidad del usuario respetar el orden de
profundidad:


        \capitulo{Capitulo 1}

        \seccion{Seccion 1}

        \seccion{Seccion 2}

        \subseccion{Subseccion 2.1}
                

## Tablas

El comando \tabla tiene el siguiente formato:

        \tabla{Titulo Tabla}{Comandos que generan la tabla}
                

Los comandos que generan la tabla deben estar dentro de un entorno tabular o
tabularx.


## Figuras

El comando para las figuras es el siguiente:

        \figura{Titulo de la figura}{\includegraphics[width=15cm]{archivo}}
                
El ancho de 15cm queda bien en el formato de memoria pero puede ser cambiado
según las necesidades.



## Formatos no considerados

El formato de memoria no especifica un formato para los algoritmos así que no se
incluye uno en esta clase.



# Desarrollo

El desarrollo principal de este repositorio se encuentra en

[https://bitbucket.org/haskmell/clase-latex-memoria-diinf](https://bitbucket.org/haskmell/clase-latex-memoria-diinf)
        
Si desea contribuir con nuevas características o correcciones de errores, debe tener una cuenta
en bitbucket.org, hacer un fork (copia) del repositorio, realizar sus
modificaciones y luego hacer un "Pull Request" para que sus cambios sean
añadidos al repositorio principal.

Más información puede ser encontrada en el manual de bitbucket:

* [Fork](https://confluence.atlassian.com/display/BITBUCKET/Forking+a+Repository)
* [Pull Request](https://confluence.atlassian.com/display/BITBUCKET/Working+with+pull+requests)

## Commits

En [esta](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
pagina hay una buena guia sobre cómo escribir buenos commits y debería ser
respetada al momento de contribuir con código.

# Créditos

        Felipe Garay: Código original.
