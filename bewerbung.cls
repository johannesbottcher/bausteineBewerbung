\ProvidesClass{bewerbung}[2015/03/20 demo test class]
\LoadClass{scrartcl}
\RequirePackage{xparse}
\RequirePackage{scrletter}

\newkomavar{firstname}
\newkomavar{lastname}

\DeclareDocumentCommand{ \makeletter }{}{
\clearpage
\centering
\vspace*{.3\textheight}
\Large Letter Page by \usekomavar{firstname} \usekomavar{lastname}\par
\clearpage
}
\DeclareDocumentCommand{ \makecv }{}{
\clearpage
\centering
\vspace*{.3\textheight}
\Large CV Page \par
\clearpage
}
\DeclareDocumentCommand{ \makecover }{}{
\clearpage
\centering
\vspace*{.3\textheight}
\Large Cover Page \par
\clearpage
}
\endinput
