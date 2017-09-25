%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clase que provee el formato pedido por el Departamento de Ingeniería
% Informática de la Universidad de Santiago de Chile para las tesis.
%
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.
%
%
%       Copyright (C) 2012, 2013, 2014 Felipe Garay
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\ProvidesClass{memoria}[12/03/2015 v16-2 Formato DIINF]


% Para que los márgenes se muevan para imprimir por ambos lados hay que sacar
% oneside
\LoadClass[10pt, letterpaper, oneside]{book}


\usepackage[headheight=2.5cm, top=2.5cm, left=4cm, bottom=2.5cm, right=2.5cm]{geometry}
\usepackage{fancyhdr} %para usar fácilmente los headers
\usepackage{graphicx} %usar gráficos, usado para el logo de la USACH
\usepackage{ifpdf}
\usepackage{ragged2e}
\usepackage{hyphenat}

\ifpdf
  \newcommand{\arial}{\familydefault}
\else
  \usepackage{fontspec}
  \setmainfont{Arial}
  \newfontfamily\arial{Arial}
\fi




%es-lcroman nos permite usar números romanos en minúsculas
\usepackage[spanish, es-lcroman, english]{babel} 
\usepackage[utf8]{inputenc}
\usepackage{tocloft}
\usepackage{etoolbox}
\usepackage{ifthen}


\usepackage{csquotes}
\usepackage{xpatch}
% cargamos biblatex para la bibliografia
\usepackage[citestyle=ieee, style=ieee, backend=biber]{biblatex}
\addbibresource{bibliografia.bib}
\AtEveryBibitem{\clearfield{doi}}
\AtEveryBibitem{\clearfield{month}}
\AtEveryBibitem{\clearfield{timestamp}}
\AtEveryBibitem{\clearfield{biburl}}
\AtEveryBibitem{\clearfield{bibsource}}

%\DefineBibliographyStrings{english}{%
  %urlseen = {visitado el}
%}




\usepackage{url}
\urlstyle{same}


\renewbibmacro*{bbx:savehash}{}

\makeatletter
\newcommand{\customlabel}[2]{%
\protected@write \@auxout {}{\string \newlabel {#1}{{#2}{}}}}
\makeatother


\renewcommand*{\bibfont}{\arial}

\newcounter{apendice}
\newcounter{anexo}
\newcounter{codigo}


% Con esto sabemos si debemos mostrar el nombre del capitulo o no en el header.
% Por ejemplo en los indices no debemos mostrar el capitulo
\newtoggle{mostrarcapitulo}
\togglefalse{mostrarcapitulo}

\newtoggle{mostrarapendice}
\togglefalse{mostrarapendice}

\newtoggle{mostraranexo}
\togglefalse{mostraranexo}


\fancypagestyle{style2}{
  \fancyhead[LE,RO]{}
  \fancyfoot[LE,RO]{\thepage}
}



% Si la pagina es par entonces crea una pagina en blanco, si no entonces
% simplemente salto de pagina. Esto es para que los capítulos siempre empiecen
% en la hoja de la derecha
\newcommand{\paginablanco}{
      \newpage
      %check par, si es par incluir los siguiente
      %\ifthenelse{\isodd{\value{page}}}
      %{}
      %{
              %\mbox{}
              %\thispagestyle{empty}
              %\newpage
      %}
}


% Genera la portada del informe
% Argumentos: {Titulo}{Autores}{Profesora \\ ayudantes}{fecha}
\newcommand{\portada}[4]{
        \newgeometry{headheight=4cm, top=4cm, left=4cm, bottom=2.5cm, right=2.5cm}

        \pagestyle{fancy}
        \fancyhf{} %Sin estilo de pagina

        \renewcommand{\headrulewidth}{0pt} %sacamos la linea horizontal del header

        % header central
        \chead{
                \fontsize{14}{17}
                \arial
                \selectfont
                \linespread{1.2}
                \textbf{UNIVERSIDAD DE SANTIAGO DE CHILE} \\
                \fontsize{12}{14}
                \selectfont
                \textbf{FACULTAD DE INGENIERÍA} \\
                Departamento de Ingeniería Informática}

        % logo universidad
    \rhead{\vspace*{0.8cm}\includegraphics[height=3cm]{logo.pdf}}

		\vspace*{0.5cm}
        % titulo
        \begin{center}
                \fontsize{12}{14}
                \arial
                \selectfont
                \textbf{#1} \\
        \end{center}


        % autores
        \begin{center}
                \fontsize{10}{11}
                \arial
                \selectfont
                \textbf{#2}		% debe estar en mayusculas
        \end{center}

        % el profesor debe esta a la mitad, con vfill llenamos con espacios
        % hasta la mitad
        \vfill

        %profesor guia, ayudantes
        \fontsize{10}{11}
        \arial
        \selectfont
        \hskip 6.795cm % debe estar desde la mitad hacia la derecha
        \begin{minipage}[b]{0.45\linewidth}
            %\begin{flushright}
                #3
            %\end{flushright}
        \end{minipage}


		    \vspace*{0.7cm}
        %Protocolo titulación
        \fontsize{10}{11}
        \arial
        \selectfont
        \hskip 6.795cm % debe estar desde la mitad hacia la derecha
        \begin{minipage}[b]{0.5\linewidth}
          { \justify
          \nohyphens{
          Trabajo de titulación en conformidad a los
          requisitos para obtener el grado de Magíster
          en Ingeniería Informática
          }
          }
        \end{minipage}




        % con mas espacios hasta el final de la pagina
        \vfill


        % fecha y lugar
        \begin{center}
                \fontsize{10}{11}
                \arial
                \selectfont
                Santiago - Chile \\
                #4
        \end{center}

        \paginablanco

        \pagestyle{fancy}
        \fancyhf{} %reset el estilo



        \newcommand{\nombrecaptitulo}{}

        %\fancyhead[LE,RO]{\thepage}
        %\fancyhead[RE,LO]{\capituloheading}
        \fancyfoot[LE,RO]{\thepage}
        \fancyhead[LE,RO]{}
        \renewcommand{\headrulewidth}{0pt}


        \restoregeometry
}


% Crea los indices del contenido, figuras y tablas
\newcommand{\indices}{
        %\pagenumbering{roman}

        \newpage
        \arial

        \renewcommand{\thepage}{\roman{page}} % numeración romana

        % para que los capitulos tengan puntos entre el nombre y la pagina
        \renewcommand{\cftchapdotsep}{\cftdot}

        \setcounter{tocdepth}{3}

        %\renewcommand{\cfttoctitlefont}{\hfill}
        %\renewcommand{\cftaftertoctitle}{\hfill}
        %\renewcommand{\cftlottitlefont}{\hfill}
        %\renewcommand{\cftafterlottitle}{\hfill}

        \renewcommand{\cfttoctitlefont}{\hspace*{\fill}\Huge\bfseries}
        \renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
        \renewcommand{\cftlottitlefont}{\hspace*{\fill}\Huge\bfseries}
        \renewcommand{\cftafterlottitle}{\hspace*{\fill}}
        \renewcommand{\cftloftitlefont}{\hspace*{\fill}\Huge\bfseries}
        \renewcommand{\cftafterloftitle}{\hspace*{\fill}}


        \renewcommand{\contentsname}{
          \fontsize{14}{17}
          \arial
          \selectfont
          \textbf{TABLA DE CONTENIDO}
        }

        \tableofcontents

        \newpage



        \renewcommand{\cfttabdotsep}{\cftdotsep}

        \renewcommand{\listtablename}{
          \fontsize{14}{17}
          \arial
          \selectfont
          \textbf{ÍNDICE DE TABLAS}
        }
        %\addcontentsline{toc}{chapter}{ÍNDICE DE TABLAS}
        \listoftables

        

        \newpage



        \renewcommand{\cftfigdotsep}{\cftdotsep}
        \renewcommand{\listfigurename}{
          \fontsize{14}{17}
          \arial
          \selectfont
          \textbf{ÍNDICE DE FIGURAS}
        }
        %\addcontentsline{toc}{chapter}{ÍNDICE DE FIGURAS}
        \listoffigures

        \newpage


        \renewcommand{\thepage}{\arabic{page}} % Numeración arábiga
        %\pagenumbering{arabic}

}



% ve si es necesario mostrar el capitulo en el heading.
\newcommand{\capituloheading}{
        \iftoggle{mostrarcapitulo}{
                \arial CAPÍTULO \arabic{chapter}: \nombrecaptitulo
        }{}
        \iftoggle{mostrarapendice}{
                \arial APÉNDICE \Alph{apendice}: \nombrecaptitulo
        }{}
        \iftoggle{mostraranexo}{
                \arial ANEXO \Alph{anexo}: \nombrecaptitulo
        }{}
}


% Genera un capitulo, equivalente a \chapter
% Argumentos: {Titulo del capitulo}{label}
\newcommand{\capitulo}[1]{

        \paginablanco
        \renewcommand{\headrulewidth}{0.0pt} 
        
        \fontsize{14}{17}
        \arial
        \selectfont

        \addtocounter{chapter}{1}

        \noindent\textbf{CAPÍTULO \arabic{chapter}.  \hspace{0.2cm} \uppercase{#1}}
        \newline

        

        \addcontentsline{toc}{chapter}{\arial CAPÍTULO \arabic{chapter}. \hspace{0.2cm} \uppercase{#1}}

        \renewcommand{\nombrecaptitulo}{\uppercase{#1}}




        % para que muestre el nombre del capitulo en el heading
        \toggletrue{mostrarcapitulo}

        %resetamos los counters
        \setcounter{figure}{0}
        \setcounter{table}{0}
        \setcounter{section}{0}
        \setcounter{equation}{0}
        \setcounter{subsection}{0}


        % fuente estándar para el texto
        \fontsize{10}{11}
        \arial
        \selectfont

}



% crea una sección, equivalente a \seccion
% Argumentos: {Titulo de la sección}
\newcommand{\seccion}[1]{
        \vspace{5mm}

        \fontsize{12}{14}
        \arial
        \selectfont
        
        \addtocounter{section}{1}
        \setcounter{subsection}{0}

        \noindent\textbf{\arabic{chapter}.\arabic{section} \hspace{0.2cm}  \uppercase{#1}}

        \addcontentsline{toc}{section}{\arial \arabic{chapter}.\arabic{section} \hspace{0.5cm}\uppercase{#1}}

        \fontsize{10}{11}
        \arial
        \selectfont
}



% crea una subseccion, equivalente a \subseccion
% Argumentos: {Titulo de la subseccion}
\newcommand{\subseccion}[1]{
        \vspace{3mm}

        \fontsize{10}{11}
        \arial
        \selectfont
        
        \addtocounter{subsection}{1}

        \textbf{\arabic{chapter}.\arabic{section}.\arabic{subsection} \hspace{0.2cm} #1}

        \addcontentsline{toc}{subsection}{\arial \arabic{chapter}.\arabic{section}.\arabic{subsection} \hspace{0.2cm} #1}


        \fontsize{10}{11}
        \arial
        \selectfont

}


% crea una subsubseccion, equivalente a \subsubseccion
% Argumentos: {Titulo de la subsubseccion}
\newcommand{\subsubseccion}[1]{

        \fontsize{12}{14}
        \arial
        \selectfont
        
        \addtocounter{subsubsection}{1}

        \emph{#1}

        \addcontentsline{toc}{subsubsection}{\arial #1}

        \fontsize{10}{11}
        \arial
        \selectfont
}



% Define una tabla
% Argumentos {caption}{tabla}{label}
\newcommand{\tabla}[4]{
\begin{center}
\begin{minipage}{\textwidth}
        \fontsize{10}{11}
        \arial
        \selectfont

        \addtocounter{table}{1}


        \begin{center}
                \emph{Tabla \arabic{chapter}.\arabic{table}: #1} \\
                Fuente: #4.\\
                        #2
        \end{center}

        \addcontentsline{lot}{table}{\arial Tabla \arabic{chapter}.\arabic{table}: #1} 
        \customlabel{#3}{\arial Tabla \arabic{chapter}-\arabic{table}}

        \fontsize{10}{11}
        \arial
        \selectfont
\end{minipage}
\end{center}
}


\newcommand{\tablaApendice}[4]{
\begin{center}
\begin{minipage}{\textwidth}
        \fontsize{10}{11}
        \arial
        \selectfont

        \addtocounter{table}{1}


        \begin{center}
                \emph{Tabla \Alph{apendice}.\arabic{table}: #1} \\
                Fuente: #4.\\
                        #2
        \end{center}

        \addcontentsline{lot}{table}{\arial Tabla \Alph{apendice}.\arabic{table}: #1} 
        \customlabel{#3}{\arial Tabla \Alph{apendice}-\arabic{table}}

        \fontsize{10}{11}
        \arial
        \selectfont
\end{minipage}
\end{center}
}






% Define una figura
% Argumentos {CAPTION}{FIGURA}{label}
\newcommand{\figura}[3]{
\begin{center}
\begin{minipage}{\textwidth}
  \centering
  \addtocounter{figure}{1}

    {\makebox[\textwidth][c]{#2}}
          \emph{Figura \arabic{chapter}.\arabic{figure}: #1} \\
          Fuente: Elaboración propia, (2017).\\

  \addcontentsline{lof}{figure}{\arial Figura \arabic{chapter}.\arabic{figure}: #1}

  \customlabel{#3}{\arial Figura \arabic{chapter}.\arabic{figure}}
\end{minipage}
\end{center}
}


\newcommand{\figuraFuente}[4]{
\begin{center}
\begin{minipage}{\textwidth}
  \addtocounter{figure}{1}

  \begin{center}
    {\makebox[\textwidth][c]{#2}}
          \emph{Figura \arabic{chapter}.\arabic{figure}: #1} \\
          Fuente: #4.\\
  \end{center}

  \addcontentsline{lof}{figure}{\arial Figura \arabic{chapter}.\arabic{figure}: #1}

  \customlabel{#3}{\arial Figura \arabic{chapter}.\arabic{figure}}
\end{minipage}
\end{center}
}




% crea una bibliografia con el estilo apa y la base de datos bibliografia.bib
\newcommand{\bibliografia}{
  \capitulo{Bibliografía}
  { \arial
    \printbibliography[heading=none]
  }
}


\newcommand{\bibliografiasincita}{
  \capitulo{Bibliografía}
  { \arial
    \printbibliography[heading=none]
  }
  \nocite{*}
}

\renewcommand{\baselinestretch}{1.5} %interlineado 1.5


% Genera el título adecuado para poner un resumen
% Argumentos: {título}
% Ejemplo
%   \resumen{Resumen}
%   \resumen{Abstract}
\newcommand{\resumen}[1]{
        \renewcommand{\thepage}{\roman{page}} % numeración romana

        \paginablanco
        
        \fontsize{14}{17}
        \arial
        \selectfont

        \hfill\textbf{\uppercase{#1}}\hfill\hfill
        
		    \vspace*{1.0cm}

        %\addcontentsline{toc}{chapter}{\arial \uppercase{#1}}


        % fuente estándar para el texto
        \fontsize{10}{11}
        \arial
        \selectfont
}



% Genera un capitulo, equivalente a \chapter
% Argumentos: {Titulo del apendice}{label}
\newcommand{\apendice}[2]{


        \paginablanco
        
        \fontsize{16}{19}
        \arial
        \selectfont

        \addtocounter{apendice}{1}

        \noindent\textbf{APÉNDICE \Alph{apendice}.  \hspace{0.2cm} \uppercase{#1}} \newline
        

        \addcontentsline{toc}{chapter}{\arial APÉNDICE \Alph{apendice}. \hspace{0.2cm} \uppercase{#1}}

        \renewcommand{\nombrecaptitulo}{\uppercase{#1}}




        % para que muestre el nombre del capitulo en el heading

        \togglefalse{mostrarcapitulo}
        \toggletrue{mostrarapendice}

        %resetamos los counters
        \setcounter{figure}{0}
        \setcounter{table}{0}
        \setcounter{section}{0}
        \setcounter{equation}{0}
        \setcounter{subsection}{0}


        % fuente estándar para el texto
        \fontsize{10}{11}
        \arial
        \selectfont

        \customlabel{#2}{Apéndice \Alph{apendice}}
}



% Define una figura dentro de un apendice
% Argumentos {CAPTION}{FIGURA}{label}
\newcommand{\figuraApendice}[3]{
\begin{center}
\begin{minipage}{\textwidth}
  \addtocounter{figure}{1}

  \begin{center}
    {\makebox[\textwidth][c]{#2}}
          \emph{Figura \Alph{apendice}.\arabic{figure}: #1} \\
          Fuente: Elaboración propia, (2017).\\
  \end{center}

  \addcontentsline{lof}{figure}{\arial Figura \Alph{apendice}.\arabic{figure}: #1}

  \customlabel{#3}{\arial Figura \Alph{apendice}.\arabic{figure}}
\end{minipage}
\end{center}
}





% Define una figura dentro de un aenxo
% Argumentos {CAPTION}{FIGURA}{label}
\newcommand{\codigo}[3]{
  \addtocounter{codigo}{1}

  #2
  \begin{center}
    \emph{Código \Alph{apendice}.\arabic{codigo}: #1}\\
  \end{center}

  %\addcontentsline{lof}{figure}{\arial Código \Alph{anexo}.\arabic{codigo}: #1}

  \customlabel{#3}{\arial Código \Alph{apendice}.\arabic{codigo}}
}


\newcommand{\codigoEnviroment}[2]{
  \addtocounter{codigo}{1}

  \begin{center}
    \emph{Código \Alph{apendice}.\arabic{codigo}: #1}\\
  \end{center}

  %\addcontentsline{lof}{figure}{\arial Código \Alph{anexo}.\arabic{codigo}: #1}

  \customlabel{#2}{\arial Código \Alph{apendice}.\arabic{codigo}}
}



\newcommand{\anexo}[2]{

        \paginablanco
        
        \fontsize{16}{19}
        \arial
        \selectfont

        \addtocounter{anexo}{1}

        \noindent\textbf{ANEXO \Alph{anexo}.  \hspace{0.2cm} \uppercase{#1}} \newline
        

        \addcontentsline{toc}{chapter}{\arial ANEXO \Alph{anexo}. \hspace{0.2cm} \uppercase{#1}}

        \renewcommand{\nombrecaptitulo}{\uppercase{#1}}




        % para que muestre el nombre del capitulo en el heading

        \togglefalse{mostrarcapitulo}
        \togglefalse{mostrarapendice}
        \togglefalse{mostraranexo}

        %resetamos los counters
        \setcounter{figure}{0}
        \setcounter{table}{0}
        \setcounter{section}{0}
        \setcounter{equation}{0}
        \setcounter{subsection}{0}


        % fuente estándar para el texto
        \fontsize{10}{11}
        \arial
        \selectfont

        \customlabel{#2}{Anexo \Alph{anexo}}
}




\newcommand{\derechos}{
        \renewcommand{\thepage}{\roman{page}} % numeración romana

        \setcounter{page}{0}
        \paginablanco
        
		    \vspace*{1.0cm}

        % fuente estándar para el texto
        \fontsize{10}{11}
        \arial
        \selectfont

        \vspace*{\fill}

        \noindent
        \textcopyright Felipe Ignacio Garay Pérez y Erika Rosas Olivos, 2017\\
        Todos los derechos reservados. Queda prohibida la reproducción total o
        partical sin autorización previa y por escrito.
}


