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
\usepackage{enumitem}
\usepackage{framed}
\usepackage{fontspec}
\usepackage[hidelinks]{hyperref}
\usepackage{booktabs}
\usepackage{scrextend}
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
\definecolor{background}{HTML}{EEEEEE}
\usepackage{lscape}
\usepackage{rotating}
\usepackage{epstopdf}
\renewcommand\bibname{References}
\raggedright
\usepackage{listings}
\lstset{ %                % choose the language of the code
basicstyle=\footnotesize,       % the size of the fonts that are used for the code
numbers=left,                   % where to put the line-numbers
numberstyle=\footnotesize,      % the size of the fonts that are used for the line-numbers
stepnumber=1,                   % the step between two line-numbers. If it is 1 each line will be numbered
numbersep=10pt,                  % how far the line-numbers are from the code
backgroundcolor=\color{background},  % choose the background color. You must add \usepackage{color}
showspaces=false,               % show spaces adding particular underscores
showstringspaces=false,         % underline spaces within strings
showtabs=false,                 % show tabs within strings adding particular underscores
 frame=single,           % adds a frame around the code
tabsize=2,          % sets default tabsize to 2 spaces
captionpos=b,           % sets the caption-position to bottom
breaklines=true,        % sets automatic line breaking
breakatwhitespace=false,    % sets if automatic breaks should only happen at whitespace
escapeinside={\\*}{\\*}          % if you want to add a comment within your code
}

\renewcommand{\lstlistingname}{Code snippet}
\colorlet{punct}{red!60!black}
\definecolor{delim}{RGB}{20,105,176}
\colorlet{numb}{magenta!60!black}
\lstdefinelanguage{json}{
    basicstyle=\footnotesize,
    numbers=left,
    numberstyle=\footnotesize,
    stepnumber=1,
    numbersep=10pt,
    breakatwhitespace=false,    % sets if automatic breaks should only happen at whitespace
    captionpos=b,
    showspaces=false,               % show spaces adding particular underscores
    showstringspaces=false,
    showtabs=false,                 % show tabs within strings adding particular underscores
    breaklines=true,
    tabsize=2,          % sets default tabsize to 2 spaces
    frame=single,
    backgroundcolor=\color{background},
    literate=
     *{0}{{{\color{numb}0}}}{1}
      {1}{{{\color{numb}1}}}{1}
      {2}{{{\color{numb}2}}}{1}
      {3}{{{\color{numb}3}}}{1}
      {4}{{{\color{numb}4}}}{1}
      {5}{{{\color{numb}5}}}{1}
      {6}{{{\color{numb}6}}}{1}
      {7}{{{\color{numb}7}}}{1}
      {8}{{{\color{numb}8}}}{1}
      {9}{{{\color{numb}9}}}{1}
      {"}{{{\color{delim}{"}}}}{1}
      {:}{{{\color{punct}{:}}}}{1}
      {,}{{{\color{punct}{,}}}}{1}
      {\{}{{{\color{delim}{\{}}}}{1}
      {\}}{{{\color{delim}{\}}}}}{1}
      {[}{{{\color{delim}{[}}}}{1}
      {]}{{{\color{delim}{]}}}}{1}
}

\definecolor{dkgreen}{rgb}{0,.6,0}
\definecolor{dkblue}{rgb}{0,0,.6}
\definecolor{dkyellow}{cmyk}{0,0,.8,.3}
%
%\lstset{
 % language        = php,
 % basicstyle      = \footnotesize,
 % captionpos=b,
 %   showspaces=false,               % show spaces adding particular underscores
 %  showstringspaces=false,
 %   showtabs=false,
  %      stepnumber=1,
  %  numbersep=10pt,
 % keywordstyle    = \color{dkblue},
 % stringstyle     = \color{red},
 % identifierstyle = \color{dkgreen},
 % commentstyle    = \color{gray},
 % emph            =[1]{php},
 % emphstyle       =[1]\color{black},
 % emph            =[2]{if,and,or,else},
 % emphstyle       =[2]\color{dkyellow}}
\parindent 15pt

\newcommand{\declaration}{
\newpage
	\vspace*{\fill}
	\section*{Declaration}
	\input{frontmatter/declaration}
		\vspace*{\fill}
}

\newcommand{\abstractpage}{
\newpage
	\vspace*{\fill}
	\section*{\centering{Abstract}}
	\input{frontmatter/abstract}
		\vspace*{\fill}
}


\newcommand{\acknowledgments}{
\newpage
	\vspace*{\fill}
	\section*{\centering{Acknowledgments}}
	\input{frontmatter/acknowledgments}
	\vspace*{\fill}
}

\newcommand{\contents}{
\tableofcontents
    \newpage
}
\newcommand{\introduction}{
    \newpage
    \setcounter{chapter}{1}
	\addcontentsline{toc}{chapter}{\numberline{}Introduction}
	\chapter*{Introduction}
	\input{frontmatter/introduction}
}
\newcommand{\makefrontmatter}{
\setcounter{page}{1}
\pagenumbering{roman}
\doublespacing
\declaration
 \acknowledgments
     \abstractpage

    	\contents
    	\doublespacing
	\setcounter{page}{1}
\pagenumbering{arabic}
		\introduction
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
