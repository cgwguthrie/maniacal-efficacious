
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dissertationProject}
\LoadClass[11pt, oneside, a4paper]{book}
\RequirePackage{geometry}
\RequirePackage{setspace}

\geometry{margin=1in}
\renewcommand{\baselinestretch}{1.5}

\RequirePackage{wrapfig}
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}


\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\headheight 14pt
\fancyhead[OR]{\nouppercase\rightmark}
\lhead{\slshape\nouppercase{\leftmark}}
\cfoot{\thepage}

\renewcommand\bibname{References}
\raggedright

\parindent 15pt

\newcommand{\declaration}{
	\newpage
	\chapter*{Declaration}
	\input{frontmatter/declaration}
	\addcontentsline{toc}{chapter}{\numberline{}Declaration}
}

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
    \renewcommand{\baselinestretch}{0}
    \addcontentsline{toc}{chapter}{\numberline{}Contents}
    \tableofcontents
}

\newcommand{\makefrontmatter}{
    \setcounter{page}{1}
    \pagenumbering{roman}
    
    \declaration
% \acknowledgments
    \abstractpage
    \contents
% \introduction    
    
    \setcounter{page}{1}
    \pagenumbering{arabic}
}

\def\degree#1{\gdef\@degree{#1}}
\def\university#1{\gdef\@university{#1}}
\def\location#1{\gdef\@location{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}

\usepackage{tikz}
\usetikzlibrary{calc}

\renewcommand{\maketitle}{

\definecolor{hwcolour}{RGB}{0,81,186}
    \begin{titlepage}
    \begin{tikzpicture}[remember picture, overlay]
 	 \draw[hwcolour, line width = 2pt] ($(current page.north west) + (0.5in,-1in)$) rectangle ($(current page.south east) + (-0.5in,1in)$);
        \end{tikzpicture}

        \begin{center}
            \begin{flushright}
                \includegraphics[width=3cm]{images/HWUlogo}
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
