\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dissertationProject}
\LoadClass[11pt, oneside, a4paper]{book}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{float}
\RequirePackage{titlesec}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}
\geometry{margin=1in}
\usepackage{fontspec}
\usepackage{tabularx}
\usepackage{booktabs}
\hbadness=10000
%\renewcommand{\familydefault}{\sfdefault}
\setmainfont{Georgia}
\RequirePackage{wrapfig}
\RequirePackage[english]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{xr}
\RequirePackage{fancyhdr}
\RequirePackage[table]{xcolor}
\RequirePackage{tabularx}
\pagestyle{fancy}
\fancyhf{}
\headheight 14pt
\fancyhead[OR]{\nouppercase\rightmark}
\lhead{\slshape\nouppercase{\leftmark}}
\cfoot{\thepage}
\usepackage{lscape}
\usepackage{rotating}
\usepackage{epstopdf}
\renewcommand\bibname{References}
\raggedright
\usepackage{listings}
\lstset{ %
language=SQL,                % choose the language of the code
basicstyle=\footnotesize,       % the size of the fonts that are used for the code
numbers=left,                   % where to put the line-numbers
numberstyle=\footnotesize,      % the size of the fonts that are used for the line-numbers
stepnumber=1,                   % the step between two line-numbers. If it is 1 each line will be numbered
numbersep=10pt,                  % how far the line-numbers are from the code
backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
showspaces=false,               % show spaces adding particular underscores
showstringspaces=false,         % underline spaces within strings
showtabs=false,                 % show tabs within strings adding particular underscores
 frame=single,           % adds a frame around the code
tabsize=2,          % sets default tabsize to 2 spaces
captionpos=b,           % sets the caption-position to bottom
breaklines=true,        % sets automatic line breaking
breakatwhitespace=false,    % sets if automatic breaks should only happen at whitespace
escapeinside={\%*}{*)}          % if you want to add a comment within your code
}
\renewcommand{\lstlistingname}{Code snippet}
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
        \addcontentsline{toc}{chapter}{\numberline{}Contents}
            \singlespacing

\tableofcontents
    \newpage
}
\newcommand{\introduction}{
    \newpage
	\addcontentsline{toc}{chapter}{\numberline{}Introduction}
	\chapter*{Introduction}
	 \doublespacing
	\input{frontmatter/introduction}
}
\newcommand{\makefrontmatter}{
\setcounter{page}{1}
\pagenumbering{roman}
 %   \declaration
% \acknowledgments
 %   \abstractpage
    	\contents
	\setcounter{page}{1}
\pagenumbering{arabic}
		\introduction
\doublespacing
}

\def\degree#1{\gdef\@degree{#1}}
\def\university#1{\gdef\@university{#1}}
\def\location#1{\gdef\@location{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\secondreader#1{\gdef\@secondreader{#1}}

\usepackage{tikz}
\usetikzlibrary{calc}

\renewcommand{\maketitle}{

\definecolor{hwcolour}{RGB}{0,81,186}
    \begin{titlepage}
    \begin{tikzpicture}[remember picture, overlay]
 	 \draw[hwcolour, line width = 2pt] ($(current page.north west) + (0.5in,-1in)$) rectangle ($(current page.south east) + (-0.5in,1in)$);
        \end{tikzpicture}
 \vspace*{15mm}
        \begin{center}
                \includegraphics[width=8cm]{images/HWULogo}
        
            {\Large {Dissertation Project} \par}
            \vspace*{5mm}
            
            {\huge {\bfseries \@title} \par}
            
            \vspace*{10mm}
            
            {\large {\textit{Author:} \@author} \par}
            
            \vspace*{10mm}
            
            {\large \@university \\ \@location \par}
            
            \vspace*{10mm}
            
            {\large\it {\@degree} \par}
            
            \vspace*{10mm}
            
            {\large \@date \par}
            
            \vspace*{10mm}
            {\large {\textit{Project Supervisor:} \@supervisor} \hspace{10mm} {\textit{Second Reader:} \@secondreader} \par}
        \end{center}
    \end{titlepage}
}
