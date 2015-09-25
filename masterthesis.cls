%-----------------------------------------------------%
% @author: Tony Beltramelli - www.tonybeltramelli.com %
%       IT University of Copenhagen - www.itu.dk      %
%       creation date: 2015/06/11, version: 0.1       %
%-----------------------------------------------------%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{masterthesis}[2015/06/11 v0.1 Master's thesis]
\LoadClass[11pt, oneside, a4paper]{book}

\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{verbatim}

\RequirePackage{color}
\definecolor{special}{rgb}{0.3, 0.3, 0.3}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lhead{\slshape\nouppercase{\leftmark}}
\cfoot{\thepage}

\renewcommand\bibname{References}
\raggedright

\definecolor{chaptergrey}{rgb}{0.5,0.5,0.5}

\parindent 12pt

\usepackage{setspace}



\newcommand{\abstractpage}{
	\newpage
	\chapter*{Abstract}
	\input{frontmatter/abstract}
	\addcontentsline{toc}{chapter}{\numberline{}Abstract}
}

\newcommand{\acknowledgments}{
    \newpage
	\chapter*{Acknowledgments}
	\input{frontmatter/acknowledgments}
	\addcontentsline{toc}{chapter}{\numberline{}Acknowledgments}
}

\newcommand{\contents}{
    \newpage
    \addcontentsline{toc}{chapter}{\numberline{}Contents}
    \tableofcontents
}

\newcommand{\listfigures}{
    \newpage
    \addcontentsline{toc}{chapter}{\numberline{}List of figures}
    \listoffigures
}

\newcommand{\listtables}{
    \newpage
    \addcontentsline{toc}{chapter}{\numberline{}List of tables}
    \listoftables
}

\newcommand{\makefrontmatter}{
    \setcounter{page}{1}
    \pagenumbering{roman}
    
    \abstractpage
    \acknowledgments
    \contents
    \listfigures
    \listtables
    
    \clearpage
    
    \setcounter{page}{1}
    \pagenumbering{arabic}
}

\def\degree#1{\gdef\@degree{#1}}
\def\university#1{\gdef\@university{#1}}
\def\location#1{\gdef\@location{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}

\renewcommand{\maketitle}{
    \begin{titlepage}
        \begin{center}
            \begin{flushright}
                \includegraphics[width=3cm]{images/ITUlogo}
            \end{flushright}
        
            {\Large {Dissertation Project} \par}
            \vspace*{5mm}
            
            {\huge {\bfseries \@title} \par}
            
            \vspace*{20mm}
            
            {\large {\textit{Author:} \@author} \par}
            {\large {\textit{Supervisor:} \@supervisor} \par}
            
            \vspace*{10mm}
            
            {\large \@university \\ \@location \par}
            
            \vspace*{10mm}
            
            {\large\it {\@degree} \par}
            
            \vspace*{5mm}
            
            {\large \@date \par}
        \end{center}
    \end{titlepage}
}
