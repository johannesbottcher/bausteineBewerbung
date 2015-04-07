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
\colorlet{cvGrey}{Ivory4!30!black}
\RequirePackage{xparse}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{fontspec}
\RequirePackage[backend=biber,style=alphabetic,sorting=ydnt]{biblatex}
\RequirePackage{fontawesome}
\RequirePackage{scrletter}

\newkomafont{titlename}{\sffamily}
\newkomafont{attributes}{\color{cvGrey}}

\DeclareDocumentCommand{ \makecover }{ O{} }{
	\begin{titlepage}
		\vspace*{.1\textheight}
		\Huge\usekomafont{titlename}\usekomavar{fromname}\par
		\vfill{\raggedleft\usekomafont{attributes}
			#1
		\par}\vspace{.2\textheight}
	\end{titlepage}
}

\KOMAoption{fromalign}{left}

\KOMAoption{parskip}{half}
\setkomafont{lettersubject}{\normalfont}
\setkomafont{lettertitle}{\normalfont\large\bfseries}

\NewDocumentEnvironment{cv}{ }{
	\clearpage
	\makecvhead
}{
	\clearpage
}



\newbool{symbolsCV}
\newcommand{\cvsymbols}{\booltrue{symbolsCV}}
\newcommand{\nocvsymbols}{\boolfalse{symbolsCV}}

\NewDocumentCommand{ \makecvhead }{ }{
	\begin{center}\huge\color{cvGrey}\usekomafont{titlename}\usekomavar{fromname}
	\end{center}
	\ifbool{symbolsCV}{\KOMAoption{symbolicnames}{true}}{%
		\KOMAoption{symbolicnames}{false}}
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
	indent=6.5em,
	tocindent=1em,
	level=0,
tocnumwidth=1em]{cvsec}

\setcounter{secnumdepth}{-1}
\setkomafont{cvsec}{\normalfont\Large\color{cvGrey}}
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


\newlength{\firstcolwidth}
\setlength{\firstcolwidth}{.25\textwidth}


\DeclareDocumentCommand{\cvdate}{ m m o }{
	\begin{tabular}{@{}>{\raggedright}p{\firstcolwidth}@{}>{\raggedright}p{.65\textwidth}}
		{#1} & {\itshape#2}\IfValueTF{#3}{\\#3}{}\end{tabular}\par
}

\providecaptionname{ngerman,german,austrian}{\cvrefname}{Veröffentlichungen}%
%We can use umlauts, since a unicode aware engine is reuired anyway
\providecaptionname{english,american,british,australian}{\cvrefname}{Publications}
\defbibheading{cvRef}[\cvrefname]{\cvsec{#1}}

\newlist{cvlist}{description}{1}
\setlist[cvlist]{ leftmargin=\firstcolwidth,labelwidth=\firstcolwidth,labelsep=0pt,font=\normalfont }

\endinput
