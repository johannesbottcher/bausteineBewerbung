\ProvidesClass{bewerbung}[2015/03/20 demo test class]
\LoadClass{scrartcl}
\RequirePackage{ifxetex,ifluatex}
\ifluatex\else
\ifxetex\else
\ClassError{bewerbung}{Seems you are using pdf(La)TeX to run, but
either XeLaTeX or LuaTeX are required}{No need to panic, keep
	calm. You simply have to make some minor adjustments with
your editor.}
\fi
\fi
\RequirePackage{xcolor}
\RequirePackage{isodate}
\RequirePackage{xparse}
\RequirePackage{array}
\RequirePackage{fontspec}
\RequirePackage[backend=biber]{biblatex}
	\RequirePackage{fontawesome}
	\RequirePackage{scrletter}

	\newkomafont{titlename}{\sffamily}

	\DeclareDocumentCommand{ \makecover }{ O{} }{
	\begin{titlepage}
	\vspace*{.1\textheight}
	\Huge\usekomafont{titlename}\usekomavar{fromname}\par
	\vfill{\raggedleft
	#1
	\par}\vspace{.2\textheight}
	\end{titlepage}
	}

	\KOMAoption{fromalign}{left}

	\KOMAoption{parskip}{half}
	\setkomafont{subject}{\normalfont}
	\setkomafont{title}{\normalfont\large\bfseries}

	\NewDocumentEnvironment{cv}{ }{
		\clearpage
		\makecvhead
	}{
	\clearpage
	}

	\NewDocumentCommand{ \makecvhead }{ }{
		\begin{center}\huge\usekomafont{titlename}\usekomavar{fromname}
			\end{center}
%			\KOMAoption{symbolicnames}{true}
			\begin{minipage}{.48\linewidth}
				\raggedright
			\usekomavar{fromname}\\
			\usekomavar{fromaddress}\\
		\end{minipage}\hfill%
			\begin{minipage}{.48\linewidth}
				\raggedleft
				\ifkomavarempty{fromphone}{}{\usekomavar*{fromphone}\usekomavar{fromphone}\\}
				\ifkomavarempty{frommobilephone}{}{\usekomavar*{frommobilephone}\usekomavar{frommobilephone}\\}
				\ifkomavarempty{fromemail}{}{\usekomavar*{fromemail}\usekomavar{fromemail}\\}
				\ifkomavarempty{github}{}{\usekomavar*{github}\usekomavar{github}\\}
				\ifkomavarempty{linkedin}{}{\usekomavar*{linkedin}\usekomavar{linkedin}\\}
		\end{minipage}
		\par\addvspace{5ex}
}


%\newkomafont{cvsec}{\normalfont\large}
\DeclareNewSectionCommand[
beforeskip=2ex plus .2ex minus .1ex,
style=section,
afterskip=1ex plus .1ex minus 1sp,
font={},
indent=5em,
tocindent=1em,
level=0,
tocnumwidth=1em]{cvsec}

\setcounter{secnumdepth}{-1}
\setkomafont{cvsec}{\normalfont\Large\color{Ivory4}}
%set up new symbols, all based on FontAwesome

\newkomavar[\if@scrsymbols\LinkedIn\else\linkedinname\fi]{linkedinseparator}
\setkomavar{linkedinseparator}{\if@scrsymbols\else:\fi\nobreakspace}
\newkomavar[\if@scrsymbols\Github\else\githubname\fi]{githubseparator}
\setkomavar{githubseparator}{\if@scrsymbols\else:\fi\nobreakspace}
\providecommand{\Mobilefone}{\faMobilePhone}
\providecommand{\Email}{\faicon{envelope}}
\providecommand{\Telefon}{\faicon{phone}}
\providecommand{\FAX}{\faicon{print}}
\providecommand{\Github}{\faGithub}
\providecommand{\LinkedIn}{\faLinkedin}
\providecommand{\githubname}{Github}
\providecommand{\linkedinname}{LinkedIn}
\newkomavar[\usekomavar*{linkedinseparator}\usekomavar{linkedinseparator}]{linkedin}
\newkomavar[\usekomavar*{githubseparator}\usekomavar{githubseparator}]{github}


\DeclareDocumentCommand{\cvdate}{ m m o}{
	\begin{tabular}{l >{\raggedright}p{.5\textwidth}}
		\printdate{#1} & {\itshape#2}\IfValueTF{#3}{\\#3}{}\end{tabular}\par
}


\endinput
