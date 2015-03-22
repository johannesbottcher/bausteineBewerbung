\ProvidesClass{bewerbung}[2015/03/20 demo test class]
\LoadClass{scrartcl}
\RequirePackage{xparse}
\RequirePackage{scrletter}

\newkomavar{firstname}
\newkomavar{lastname}

\DeclareDocumentCommand{ \makecover }{ O{} }{
\begin{titlepage}
\vspace*{.1\textheight}
	\sffamily\Huge\usekomavar{fromname}\par
\vfill{\raggedleft
#1
\par}\vspace{.2\textheight}
\end{titlepage}
}

\setkomavar{fromname}{\usekomavar{firstname}~\usekomavar{lastname}}

\KOMAoption{parskip}{half}
\setkomafont{subject}{\normalfont}
\setkomafont{title}{\normalfont\large\bfseries}
\endinput
