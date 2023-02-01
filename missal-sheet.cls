\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{missal-sheet}

% default to 10pt
\PassOptionsToClass{10pt}{memoir}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\LoadClass[letterpaper, twoside]{memoir}

\RequirePackage[utf8]{inputenc}
\RequirePackage[bitstream-charter]{mathdesign}
\RequirePackage{titlesec}
\RequirePackage{paracol}
\RequirePackage{mdframed}
\RequirePackage{paracol}
\RequirePackage{xcolor}

\RequirePackage{babel}
%\babelprovide[hyphenrules=liturgicallatin]{ecclesiasticlatin}

\RequirePackage[autocompile]{gregoriotex}

% memoir page format setup
\settrims{0pt}{0pt}
\settypeblocksize{9in}{6.5in}{*}
\setlrmargins{*}{*}{1.4}
\setulmargins{*}{*}{1.2}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{.8\onelineskip}{*}

\checkandfixthelayout

\tolerance=5000
\pretolerance=3000

\setlength{\parskip}{4pt plus 2pt minus 1pt}
\setlength{\parindent}{0pt}
\setlength{\stanzaskip}{4pt plus 2pt minus 1pt}

\pagestyle{plain}

\titleformat{\chapter}[block]{\huge\scshape\filcenter}{}{1em}{}
\titleformat{\section}[block]{\Large\bfseries\filcenter}{}{1em}{}

\setlength{\columnseprule}{0.4pt}

\mdfsetup{skipabove=\topskip, skipbelow=\topskip}

\newcommand{\rubric}[1]{
	\switchcolumn[0] {
		\selectlanguage{english}\itshape
		#1
	}
}

\newcommand{\latinenglish}[2]{
	\switchcolumn[0]* {
		\selectlanguage{latin}
		#1
	}
	\switchcolumn[1] {
		\itshape\small
		#2
	}
}

\newenvironment{latinenglishsection}
	{\columnratio{.5, .5} \begin{paracol}{2}}
	{\end{paracol}}
	
\newenvironment{rubricbox}
{
	\begin{mdframed}
%	\begin{minipage}{0.8\linewidth}
}{
%	\end{minipage}
	\end{mdframed}
}

\newenvironment{versicles}{\par\leavevmode\parskip=0pt}{}

\newenvironment{collect}
{
	\leavevmode
	\parindent=1em
	\parskip=0pt
	\noindent Orémus.\par
}{}

\newenvironment{optionbox}
{
	\switchcolumn[0]
	\begin{mdframed}
%	\begin{minipage}{0.8\linewidth}
}{
%	\end{minipage}
	\end{mdframed}
}

\newcommand{\optionrule}{
	\begin{center}
	\rule{0.5\linewidth}{0.6pt}
	\end{center}
}

\newenvironment{optionruled}
{
	\optionrule
}
{
	\optionrule
}

% For general usage:
\newcommand{\RRbar}{\par\noindent {\color{red}\Rbar.}}
\newcommand{\RVbar}{\par\noindent {\color{red}\Vbar.}}

% For use inside the collect environment:
\newcommand{\Amen}{\par\noindent {\color{red}\Rbar.} Amen.}