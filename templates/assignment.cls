% ===========================================================================
% Simple LaTeX class for assignments at USI
% Matteo Muscella 2014-2015
% matteo.muscella@usi.ch
% ===========================================================================

%% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2014/02/10 Matteo Muscella's Assignment Class]

%% Fallback
\DeclareOption*{
  \ClassWarning{assignment}{Unknown option '\CurrentOption'}
}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass{scrartcl}

%% Language and Encoding
\RequirePackage[english]{babel}
\RequirePackage{ifxetex}
\ifxetex{}
\else
   \RequirePackage[utf8x]{inputenc}
\fi
\RequirePackage{textcomp}

%% Font 
\RequirePackage[T1]{fontenc}
%% New Century Schoolbook
%\RequirePackage{newcent}
%% Adobe Utopia
%\RequirePackage{fourier}
%% Palatino
\RequirePackage[sc]{mathpazo}
\RequirePackage{microtype}
\RequirePackage{textcomp}

%% Page layout
\RequirePackage{geometry}
\RequirePackage{scrlayer-scrpage}

%% Header and Footer
\RequirePackage{titling}

%% Math
%\RequirePackage{eucal}
%\RequirePackage[euler-digits,small]{eulervm}
\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{wasysym}

%% Tables
\RequirePackage{booktabs}

% Bullets and Enumeration
\RequirePackage{enumitem}

%% Graphics
\RequirePackage{graphicx}
\RequirePackage{pgf}

%% Options
\linespread{1.05}
\geometry{a4paper, margin=3.3cm}

% Set up headers
\lehead{\@course}
\lohead{\@course}
\rehead{\@semester}
\rohead{\@semester}
% Enable headings
\pagestyle{scrheadings}

% Redefine the make title command
\renewcommand\maketitle{
    \begin{center}
    {\bfseries\LARGE\@title}
    \vspace{.15em}\\
    {\small\@author}
    \end{center}
}
%    \makeatletter
%    \noindent\@course\hfill {\bfseries\@semester}\\
%    \noindent\@title\hfill \@author
%    \makeatother

% Commands to put info
\newcommand{\@semester}{{\em No semester specified}}
\newcommand{\@course}{{\em No course title specified}}
\newcommand{\semester}[1]{\renewcommand{\@semester}{{#1}}}
\newcommand{\course}[1]{\renewcommand{\@course}{{#1}}}

% Sections font
% restore sans-serif font - only for scrartcl
\addtokomafont{disposition}{\rmfamily}

% Provide Good Code Display
\RequirePackage{listings}
\lstdefinestyle{mystyle}
{
    keywordstyle = \color{black}\bfseries
  , commentstyle = \tiny\color{darkgray}
  , stringstyle  = \color{black}
}
\lstset{style=mystyle}

\newcommand{\includecode}%
  [2][c]%
  {\lstinputlisting[escapechar=, style=mystyle]{#2}}

%% general abbreviations
\newcommand{\eg}{e.g., \;}
\newcommand{\bigeg}{E.g.,\xspace}
\newcommand{\etal}{\textit{et~al.\xspace}}
\newcommand{\etc}{etc.\@\xspace}
\newcommand{\ie}{i.e.,\xspace}
\newcommand{\bigie}{I.e.,\xspace}

%% math symbols and operations
\renewcommand{\LaTeX}{{\rm \LaTeX}}
\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\cmat}[1]{\begin{pmatrix}#1\end{pmatrix}}
\newcommand{\bs}{\textbackslash}
\newcommand{\mtext}[1]{\text{\small\texttt{(#1)}}}
\newcommand{\horrule}[1]{\rule{\linewidth}{#1}}
\newcommand{\ct}[1]{\begin{center} {#1} \end{center}}
\newcommand{\uvec}[1]{\underline{#1}}
\newcommand{\gvec}[2]{#1 \underline{#2}}
\newcommand{\mvec}[2]{\begin{pmatrix}#1\\#2\end{pmatrix}}
\newcommand{\tvec}[3]{\begin{pmatrix}#1\\#2\\#3\end{pmatrix}}
\newcommand{\bigo}{{\mathcal O}}
\newcommand{\half}{\frac{1}{2}}
\newcommand{\N}{\ensuremath{\mathbb{N}}}
\newcommand{\Z}{\ensuremath{\mathbb{Z}}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\E}[1]{\ensuremath{E\left[{#1}\right]}}
\newcommand{\Var}[1]{\ensuremath{Var\left({#1}\right)}}
\newcommand{\X}{\mathcal{X}}
\newcommand{\Y}{\mathcal{Y}}
\newcommand{\degrees}[1]{\ensuremath{#1^\circ}}
\newcommand{\Prob}[1]{P (#1)}

%% Vectors typesetting
\makeatletter
\newcommand\bigvec[2][\\]{%
    \global\def\my@delim{#1}%
    \left(\negthinspace\begin{matrix}
        \big@vec #2,\relax\noexpand\@eolst%
    \end{matrix}\right)}

\def\big@vec #1,#2\@eolst{%
   \ifx\relax#2\relax
      #1
   \else
      #1\my@delim
      \big@vec #2\@eolst%
   \fi}

\newcommand\smallvec[2][\\]{%
    \global\def\my@delim{#1}%
    \left(\negthinspace\begin{smallmatrix}
        \small@vec #2,\relax\noexpand\@eolst%
    \end{smallmatrix}\right)}

\def\small@vec #1,#2\@eolst{%
   \ifx\relax#2\relax
      #1
   \else
      #1\my@delim
      \small@vec #2\@eolst%
   \fi}

\makeatother

%% http://tex.stackexchange.com/a/43009
%%
\DeclarePairedDelimiter\abs{\lvert}{\rvert}%
\DeclarePairedDelimiter\norm{\lVert}{\rVert}%

% Swap the definition of \abs* and \norm*, so that \abs
% and \norm resizes the size of the brackets, and the 
% starred version does not.
\makeatletter
\let\oldabs\abs
\def\abs{\@ifstar{\oldabs}{\oldabs*}}
%
\let\oldnorm\norm
\def\norm{\@ifstar{\oldnorm}{\oldnorm*}}
\makeatother

%% Computer Graphics
%% formula for Area of a triangle
%%
\newcommand{\area}[3]{%
    \ensuremath{\mathcal{A}\left( #1\;#2\;#3 \right)}  
}%
\newcommand{\areaOfTriangle}[3]{%
    \ensuremath{%
        \frac{1}{2}\;\Big(%
            \left( x_{#1} - x_{#3} \right) \cdot%
                \left( y_{#2} - y_{#1} \right) -%
            \left( x_{#1} - x_{#2} \right) \cdot%
                \left( y_{#3} - y_{#1} \right)%
        \Big)
    }%
}%
%%     XA  YA      XB  YB      XC YC 
%%  A ( 1, 2 )  B ( 3, 4 )  C ( 5, 6 )
\newcommand{\areaOfTriangleCalc}[6]{%
    \ensuremath{%
        \frac{1}{2}\;\Big(%
            \left( {#1} - {#5} \right) \cdot%
                \left( {#4} - {#2} \right) -%
            \left( {#1} - {#3} \right) \cdot%
                \left( {#6} - {#2} \right)%
        \Big)
    }%
}%


\endinput
