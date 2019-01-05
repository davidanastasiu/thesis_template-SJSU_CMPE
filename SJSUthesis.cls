%%
%% SJSUthesis.cls 2018-12-21 version V0.2
%%   derived from IEEEtran.cls 2015/08/26 version V1.8b
%% 
%% This is an IEEEtran-based Masters Thesis and Project class for students 
%% in the Colleges of Engineering or Science at San Jose State University.
%% The class is derived from IEEEtran.cls 2015/08/26 version V1.8b.
%% 
%% Support sites:
%% http://davidanastasiu.net
%%
%%
%% Current maintainer (V0.2): David C. Anastasiu
%%                                     See:
%%                                     http://davidanastasiu.net/
%%                                     for current contact information.
%%
%% 
%%*************************************************************************
%% Legal Notice:
%% This code is offered as-is without any warranty either expressed or
%% implied; without even the implied warranty of MERCHANTABILITY or
%% FITNESS FOR A PARTICULAR PURPOSE! 
%% User assumes all risk.
%% In no event shall the IEEE or any contributor to this code be liable for
%% any damages or losses, including, but not limited to, incidental,
%% consequential, or any other damages, resulting from the use or misuse
%% of any information contained here.
%%
%% All comments are the opinions of their respective authors and are not
%% necessarily endorsed by the IEEE.
%%
%% This work is distributed under the LaTeX Project Public License (LPPL)
%% ( http://www.latex-project.org/ ) version 1.3, and may be freely used,
%% distributed and modified. A copy of the LPPL, version 1.3, is included
%% in the base LaTeX documentation of all distributions of LaTeX released
%% 2003/12/01 or later.
%% Retain all contribution notices and credits.
%%
%% File list of work: SJSUthesis.cls, IEEEtran.cls, main.tex, references.bib
%% 
%%*************************************************************************
%%
%
% Available class options 
% e.g., \documentclass[10pt,project]{SJSUthesis} 
% 
%             *** choose only one from each category ***
%
% 9pt, 10pt, 11pt, 12pt
%    Sets normal font size. The default is 12pt.
% 
% thesis, project
%    determines format mode - thesis is used for a Masters thesis,
%    project for a capstone project.
%    The default is thesis.
%
% 3committee, 4committee, 5committee
%    Number of committee members: 3, 4, or 5.
%    The default is 3.
%
% rights
%    Print only the Library rights page.
%
% tables
%    Add list of tables page (default for thesis).
%
% figures
%    Add list of figures page (default for thesis).
%
% copy, nocopy
%    Whether you want to give the Library permission to make copies of the thesis.
%    The option only applies when printing the Library rights page.
%    The default is copy.
%
% Examples:
%
%   For a Masters thesis with 4 committee members:
%     \documentclass[fourcom]{SJSUthesis}
%
%   For the library page of a Masters thesis, with copy permissions:
%     \documentclass[rights,copy]{SJSUthesis}
%
%   For a Masters project:
%     \documentclass[project]{SJSUthesis}
%
%
% Notes:
%
%   Portions of this package were derived from an SJSU thesis template
%   by Timothy Toolan, Department of Electrical Engineering at the 
%   San Jose State University.
%
%   The acknowledgments, abbreviations, and appendices sections are not
%   required, but the abstract section is.
%

\ProvidesClass{SJSUthesis}[2018-12-21 V0.2 by David C. Anastasiu]
\typeout{-- Derived from the "IEEEtran" class version V1.8b by Michael Shell.}
\typeout{-- See the "IEEEtran_HOWTO" manual for usage information.}
\typeout{-- http://davidanastasiu.net/}

% current version
\def\SJSUthesisversionmajor{0}
\def\SJSUthesisversionminor{1}

% default class options
\def\@optdoctype{thesis}
\def\@optptsize{12pt}
\def\@optnumside{oneside}
\def\@optnumcolumn{onecolumn}
\def\@optfinish{final}
\def\@optspacing{double}

%%%%%%
% Declare options
%%%%%%

% Font size
\DeclareOption{9pt}{\def\@optptsize{9pt}}
\DeclareOption{10pt}{\def\@optptsize{10pt}}
\DeclareOption{11pt}{\def\@optptsize{11pt}}
\DeclareOption{12pt}{\def\@optptsize{12pt}}

% Draft or final
\DeclareOption{draft}{\def\@optfinish{draftclsnofoot}}
\DeclareOption{final}{\def\@optfinish{final}}

% Spacing
\newif\if@doublespacing \@doublespacingtrue
\DeclareOption{double}{\def\@optspacing{double}\@doublespacingtrue}
\DeclareOption{single}{\def\@optspacing{single}\@doublespacingfalse}

% Margins
\newif \if@optwidemargins \@optwidemarginsfalse
\DeclareOption{wide}{\@optwidemarginstrue}

% List of tables
\newif \if@optlisttables \@optlisttablesfalse
\DeclareOption{tables}{\@optlisttablestrue}

% List of figures
\newif \if@optlistfigures \@optlistfiguresfalse
\DeclareOption{figures}{\@optlistfigurestrue}

% One or two sided printing
\DeclareOption{oneside}{\def\@optnumside{oneside}}
\DeclareOption{twoside}{\def\@optnumside{twoside}}

% One or two columns
\DeclareOption{onecolumn}{\def\@optnumcolumn{onecolumn}}
\DeclareOption{twocolumn}{\def\@optnumcolumn{twocolumn}}

% number of committee members
\newif\if@fourcommittee \@fourcommitteefalse
\newif\if@fivecommittee \@fivecommitteefalse
\DeclareOption{3committee}{\@fourcommitteefalse \@fivecommitteefalse}
\DeclareOption{4committee}{\@fourcommitteetrue \@fivecommitteefalse}
\DeclareOption{5committee}{\@fourcommitteetrue \@fivecommitteetrue}

% library rights page
\newif\if@libraryrights \@libraryrightstrue
\DeclareOption{nocopy}{\@libraryrightsfalse}
\DeclareOption{copy}{\@libraryrightstrue}
\newif\if@libraryrightspage \@libraryrightspagefalse
\DeclareOption{nolibraryrightspage}{\@libraryrightspagefalse}
\DeclareOption{libraryrightspage}{\@libraryrightspagetrue}

% Document type
\DeclareOption{thesis}{\def\@optdoctype{thesis}
					   \def\@optspacing{double}
                       \def\@optnumcolumn{onecolumn}
                       \@optlisttablestrue
                       \@optlistfigurestrue
}
\DeclareOption{project}{\def\@optdoctype{project}
 					   \def\@optspacing{single}\@doublespacingfalse
                       \def\@optnumcolumn{twocolumn}
                       \@optwidemarginstrue
}

% Pass other options to IEEEtran
\DeclareOption{romanappendices}{\PassOptionsToClass{romanappendices}{IEEEtran}}
\DeclareOption{nofonttune}{\PassOptionsToClass{nofonttune}{IEEEtran}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
\ProcessOptions\relax
% default to US letter paper, 12pt, onecolumn, one sided, final, draft with no footer
\LoadClass[letterpaper,\@optptsize,
			\@optnumside,\@optnumcolumn,\@optfinish,
            journal,compsoc]{IEEEtran}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set some default values for certain things.
\def\@title{}
\def\@author{}
\def\@dept{Computer Engineering}
\def\@graduationmonth{May}
\def\@copyrightyear{\number\the\year}
\def\@abstract{abstract}  % Default file name for abstract
\def\@references{references}  % Default file name for references


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic packages and definitions

\RequirePackage{ifthen}
\RequirePackage{times}
\RequirePackage{etoolbox} % needed for AfterEndPreamble
\RequirePackage{setspace} % needed for single- and double-space
\RequirePackage[letterpaper, vmargin={1.25in, 1.25in}, hmargin={1.5in, 1in}, includeheadfoot]{geometry}  % set page margins
\RequirePackage{microtype}
\RequirePackage[all]{nowidow}   % prevent widows and orphans
\RequirePackage[compress,sort,nobreak]{cite}
\RequirePackage{hyperref} % Creates links in the PDF document.
\hypersetup{hidelinks} % Do not include boxes around links
\PassOptionsToPackage{hyphens}{url}
\RequirePackage{mfirstuc} % Capitalize single word
\RequirePackage{indentfirst} % Indent the first paragraph after section or chapter heading
\RequirePackage{xspace} % ensure spaces where needed
\RequirePackage{layout}

% Set no limit on percentage of floats per page
\renewcommand{\floatpagefraction}{1.0}
\renewcommand{\topfraction}{1.0}
\renewcommand{\textfraction}{0.0}

% used to make correct pdf index for hyperref
\def\addcustomcontentsline{}

% Set \@worktype to either "Thesis" or "Project", based on project type
\def\@worktype{%
  \xmakefirstuc{\@optdoctype}\xspace
}

% Disable full paper if only wanting library page
\if@libraryrightspage
  \@noprelimtrue
  \@simplereftrue
  \@wantchapterreffalse
  \@sequentialtrue
  \@nobibtrue
  \def\@include#1 {}%
\fi

% -- Custom functions --

\let\IEEEappendices \appendices
\def\dept#1{\gdef\@dept{#1}}
\def\graduationmonth#1{\gdef\@graduationmonth{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
\def\references#1{\gdef\@references{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\acknowledgments#1{\gdef\@acknowledgments{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\def\abbreviations#1{\gdef\@abbreviations{#1}}
\def\appendices#1{\gdef\@appendices{#1}}

\def\committee#1#2{
  \@ifundefined{@committeeA}{%
    \gdef\@committeeA{#1}
    \gdef\@affiliationA{#2}
  }{
  \@ifundefined{@committeeB}{%
    \gdef\@committeeB{#1}
    \gdef\@affiliationB{#2}
  }{
  \@ifundefined{@committeeC}{%
    \gdef\@committeeC{#1}
    \gdef\@affiliationC{#2}
  }{
  \@ifundefined{@committeeD}{%
    \gdef\@committeeD{#1}
    \gdef\@affiliationD{#2}
  }{
    \gdef\@committeeE{#1}
    \gdef\@affiliationE{#2}
  }}}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set page dimensions.
\setlength{\oddsidemargin}{.5in}
\setlength{\textwidth}{5.95in}
\setlength{\textheight}{8.5in}
\setlength{\topmargin}{-0.25in}
\setlength{\footskip}{0.5in}

\newlength{\@realheadsep}
\newlength{\@realtextheight}
\setlength{\@realheadsep}{0.4in}
\setlength{\@realtextheight}{8.5in}
\setlength{\headsep}{\@realheadsep}
\setlength{\textheight}{\@realtextheight}

% Lengths used by preambleheadings where we expand the header and shrink
% the text body to allow the heading on each page within original margins.
\newlength{\@headerextra}
\setlength{\@headerextra}{0.25in}

\newlength{\@altheadsep}
\setlength{\@altheadsep}{\@realheadsep}

\newlength{\@alttextheight}
\setlength{\@alttextheight}{\@realtextheight}

\newlength{\@fullheadheight}
\setlength{\@fullheadheight}{\headheight}
\addtolength{\@fullheadheight}{\@realheadsep}

\newlength{\@headtofootheight}
\setlength{\@headtofootheight}{\@alttextheight}
\addtolength{\@headtofootheight}{\@realheadsep}


% set paragraph indentation to 0.25in
\raggedright
\setlength{\parindent}{0.25in}

% Set double spacing command for 12pt font.
\def\doublespace{%
  \renewcommand{\baselinestretch}{1.66}
  \renewcommand{\arraystretch}{0.602}
  \normalsize%
}

% Set double spacing command for 11pt font.
\def\@tmppt{2}
\ifx\@ptsize\@tmppt
  \def\doublespace{%
    \renewcommand{\baselinestretch}{1.62}
    \renewcommand{\arraystretch}{0.617}
    \normalsize%
  }
\fi

% Set double spacing command for 10pt font.
\def\@tmppt{1}
\ifx\@ptsize\@tmppt
  \def\doublespace{%
    \renewcommand{\baselinestretch}{1.67}%
    \renewcommand{\arraystretch}{0.599}%
    \normalsize%
  }
\fi

% fixes hyperref warning
\providecommand*{\toclevel@sectionx}{0}

\if@doublespacing
  \doublespace
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deal with sections -- should have same spacing and font as the rest of the thesis

% compsoc
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
% compsoc conference
\def\section{\@startsection{section}{1}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\normalsize\bfseries}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\normalsize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{0ex}{\normalfont\normalsize\bfseries}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize}}%
\else% compsoc journals
% % use negative top separation as compsoc journals do not indent paragraphs after section titles
\def\section{\@startsection{section}{1}{\z@}{-1.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus 0.5ex minus 0ex}{\normalfont\normalsize\bfseries\uppercase}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{-1.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus 0.5ex minus 0ex}{\normalfont\normalsize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-1.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus 0.5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{-0ex plus -0.1ex minus -0.1ex}%
{0ex}{\normalfont\normalsize}}%
\fi\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deal with figures and tables - the description should be in the same font type and size as the thesis
\ifCLASSOPTIONcompsoc
% V1.7 compsoc \@makecaption
\ifCLASSOPTIONconference% compsoc conference
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@IEEEtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@IEEEtabletopskipstrut{\normalfont\normalsize {#1.}\nobreakspace #2}\par\addvspace{0.5\baselineskip}\egroup%
\@IEEEtablecaptionsepspace
% if not a table, format it as a figure
\else
\@IEEEfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center
\else%
\hbox to\hsize{\normalfont\normalsize\hfil\box\@tempboxa\hfil}%
\fi\fi}
%
\else% nonconference compsoc
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@IEEEtablestring%
% if a table, do table caption
\normalsize\bgroup\par\centering\@IEEEtabletopskipstrut{\normalfont\normalsize #1}\\{\normalfont\normalsize #2}\par\addvspace{0.5\baselineskip}\egroup%
\@IEEEtablecaptionsepspace
% if not a table, format it as a figure
\else
\@IEEEfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, left justify
\else%
\hbox to\hsize{\normalfont\normalsize\box\@tempboxa\hfil}%
\fi\fi}
\fi
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fix some standard labels

% Sets name of bibliography file to main.bbl assuming the
% main.tex file was not renamed.
\def\@bibliofileext{bib}
\def\@bibliofile{\jobname\@bibliofileext}

% Set some names used as chapter headings.
\renewcommand\contentsname{\normalfont\normalsize Table of Contents}
\renewcommand\listtablename{\normalfont\normalsize List of Tables}
\renewcommand\listfigurename{\normalfont\normalsize List of Figures}
\renewcommand\refname{Literature Cited}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These two things must be done after all other packages are included,
% specifically cite and/or overcite.
\AfterEndPreamble{
  % Redefine nocite so it writes to the bibliography only, and
  % doesn't complain about undefined references since bibtex
  % will complain anyway.  It came from latex.ltx.
  \def\nocite#1{\@bsphack
    \@for\@citeb:=#1\do{%
      \edef\@citeb{\expandafter\@firstofone\@citeb}%
      \if@filesw\immediate\write12{\string\citation{\@citeb}}\fi
    }\@esphack}

  % Redefine \bibliographystyle and \bibliography to do nothing 
  % They should not be used by the user.
  \bibliographystyle{ieeetr}
  \def\bibliographystyle#1{}
  \let \SJSUbibliography \bibliography
  \def\bibliography#1{}
  % Reset Bibliography font to normalsize and make space between items doublespace
  \IEEEtriggercmd{\reset@font\normalfont\normalsize\singlespace\vspace{-5pt}}
  \IEEEtriggeratref{1}
  \def\IEEEbibitemsep{\baselineskip}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fix TOC, LOT, LOF formatting
%
%% LOF and LOT require more customization to match template in Guidelines -- using tocbasic package
\RequirePackage{tocbasic}

\renewcommand\@dotsep{1}
\setcounter{tocdepth}{4}
\renewcommand*\l@section{%
    \vspace{\baselineskip}
	\@dottedtocline{1}{0.25in}{0.25in}
    }
\renewcommand*\l@subsection{
	\@dottedtocline{2}{0.5in}{0.5in}
    }
\renewcommand*\l@subsubsection{
	\@dottedtocline{3}{0.75in}{0.6in}
    }
\renewcommand*\l@paragraph{
	\@dottedtocline{4}{1.00in}{0.7in}
    }
\renewcommand*\l@subparagraph{
	\@dottedtocline{5}{1.25in}{1.0in}
    }
\def\tableofcontents{%
	\section*{\centering\normalfont{\MakeUppercase\contentsname}\vspace{-1em}}%
	{{ \singlespace\@starttoc{toc} }}%
    }% end \tableofcontents
    
\newcommand\entrynumberwithprefix[2]{#1\enspace#2.\hfill}
\DeclareTOCStyleEntry[
  entrynumberformat=\entrynumberwithprefix{Fig.},
  beforeskip=1em plus 1pt,
  dynnumwidth,
  numsep=1em
]{tocline}{figure}
\DeclareTOCStyleEntry[
  entrynumberformat=\entrynumberwithprefix{Table},
  beforeskip=1em plus 1pt,
  dynnumwidth,
  numsep=1em
]{tocline}{table}
\renewcommand\listoffigures{%
    \section*{\centering\normalfont{\MakeUppercase\listfigurename}\vspace{-\baselineskip}}%
	{{%
      \singlespace\@starttoc{lof}%
    }}%
    \addcontentsline{toc}{section}{\listfigurename}%
    }% end \listoffigures
\renewcommand\listoftables{%
    \section*{\centering\normalfont{\MakeUppercase\listtablename}\vspace{-\baselineskip}}%
	{{ \singlespace\@starttoc{lot} }}%
    \addcontentsline{toc}{section}{\listtablename}%
    }% end \listoftables


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Preamble headings
% This is the heading used for list of figures and list of tables.
% The header actually generates both the header and the page number
% on the bottom of the page because \textheight may be incorrect on
% the last page of the list if there is a single entry that gets pushed
% to the next page.
\def\ps@preambleheadings{%
  \let\@mkboth\@gobbletwo%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \let\@evenhead\@empty%
  \def\@oddhead{%
     \settoheight{\@tmpheighta}{\rightmark}%
     \settoheight{\@tmpheightb}{\thepage}%
     \shortstack{%
        \rule{0in}{\@fullheadheight}\rule{\textwidth}{0in}\\%
        \rightmark\\%
        \rule{0in}{\@headtofootheight}%
          \vspace{-\@tmpheighta}\vspace{-\@tmpheightb}\\%
        \thepage}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adjust spacing for captions and related environments.

% Set single spacing in figures, tables, etc.  This is from latex.ltx.
\def \@floatboxreset {%
        \singlespace
        \reset@font
        \normalsize
        \@setminipage
}

% Set single spacing in footnotes.
\let\ele@footnotetext\@footnotetext
\def\@footnotetext#1{{\singlespace%
                      \ele@footnotetext{#1}}}

% Set single spacing in quote and quotation environment.
% These are from report.cls.
\renewenvironment{quotation}
                 {\list{}{\singlespace%
                          \listparindent 1.5em%
                          \itemindent    \listparindent
                          \rightmargin   \leftmargin
                          \parsep        \z@ \@plus\p@}%
                  \item\relax}
                 {\endlist}
\renewenvironment{quote}
                 {\list{}{\singlespace%
                          \rightmargin\leftmargin}%
                  \item\relax}
                 {\endlist}

% Set single spacing in the verbatim environment.
% This is from latex.ltx.
\def\verbatim{\singlespace%
      \@verbatim \frenchspacing\@vobeyspaces \@xverbatim}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create pages of the thesis/project.

% Create the library rights page.
\def\libraryrightspage{
  \thispagestyle{empty}
  \null\vfill
  \begin{center}
  {Library Rights Statement}\\
  \end{center}
  In presenting the {\@worktype}, {\em \@title}, in partial fulfillment
  of the requirements for an advanced degree at San Jos\'{e} State University,
  I agree that the Library shall make it freely available for
  inspection.  I further agree that permission for copying, as provided
  for by the Copyright Law of the United States (Title 17, U.S.~Code),
  of this {\@worktype} for scholarly purposes may be granted by the
  Librarian.  It is understood that any copying or publication of this
  {\@worktype} for financial gain shall not be allowed without my written
  permission.

  I hereby
  \if@libraryrights\else
    {\bf do not}
  \fi
  grant permission to the San Jos\'{e} State University Library to use
  my {\@worktype} for scholarly purposes.

  \begin{center}
  \shortstack{\rule{0in}{0.6in}\\\rule{3in}{0.4pt}\\{\@author}}
  \shortstack{\rule{0in}{0.4in}\\\rule{3in}{0.4pt}\\Date}
  \end{center}
  \vfill
  \newpage
}

% Create the title page.
\def\titlepage{%
\thispagestyle{empty}%
\begin{center}{
\vspace*{-12pt}
  \ifthenelse{\equal{\@optdoctype}{project}}% uppercase for thesis, not uppercase for report
           {{\@title} \\ }
           { \singlespace \MakeUppercase{\@title} \\ } % 
  }

  \vfill

  A {\@worktype}

  Presented to

  The Faculty of the Department of \@dept

  San Jos\'{e} State University

  \vspace{3\baselineskip}

  In Partial Fulfillment
  
  of the Requirements for the Degree
  
  Master of Science

  \vspace{3\baselineskip}
 
  by

  {\@author}
  
  \@graduationmonth\ {\@copyrightyear}\\
  \vspace{3\baselineskip}
\end{center}
\newpage
}



% Create the title page.
\def\copyrightpage{%
  \thispagestyle{empty}%
  \null
  \vfill
  \begin{center}
  \doublespace % ZSH per thesis guidelines
  \copyright~{\@copyrightyear}
  
  {\@author}
  
  ALL RIGHTS RESERVED
  
  \vspace{0.5\baselineskip}
  \end{center}
  \newpage
}

% Create the committee approval page.
\def\committeepage{%
  % define all committee members that are still undefined
  \@ifundefined{@committeeA}{\gdef\@committeeA{} \gdef\@affiliationA{}}{}%
  \@ifundefined{@committeeB}{\gdef\@committeeB{} \gdef\@affiliationB{}}{}%
  \@ifundefined{@committeeC}{\gdef\@committeeC{} \gdef\@affiliationC{}}{}%
  \@ifundefined{@committeeD}{\gdef\@committeeD{} \gdef\@affiliationD{}}{}%
  \@ifundefined{@committeeE}{\gdef\@committeeE{} \gdef\@affiliationE{}}{}%
  \thispagestyle{empty}%
  \begin{center}
    \singlespace
    \ \vspace{4\baselineskip}

    The Designated {\@worktype}\ Committee Approves the {\@worktype} Titled
    \vspace{2\baselineskip}

    \begin{minipage}[t]{\linewidth}\centering
    \ifthenelse{\equal{\@optdoctype}{project}}% uppercase for thesis, not uppercase for report
               {{\@title}}
               { \singlespace \MakeUppercase{\@title}} %
    \end{minipage}
    \vspace{2\baselineskip}

    by 
    \vspace{\baselineskip}

    {\@author} 
    \vspace{2\baselineskip}

    \begin{minipage}[t]{\linewidth}\centering
    APPROVED FOR THE DEPARTMENT OF \MakeUppercase{\@dept}
    \end{minipage}
    \vspace{\baselineskip}

    SAN JOS\'{E} STATE UNIVERSITY
    \vspace{2\baselineskip}

    \@graduationmonth\ {\@copyrightyear}
    \vspace{6\baselineskip}

    {\renewcommand{\arraystretch}{1}
    \begin{tabular}{ l l }%
      \begin{minipage}[t]{0.4\textwidth} \@committeeA \end{minipage} & 
      \begin{minipage}[t]{0.5\textwidth} \@affiliationA \end{minipage} \tabularnewline
      \ & \tabularnewline
      \begin{minipage}[t]{0.4\textwidth} \@committeeB \end{minipage} & 
      \begin{minipage}[t]{0.5\textwidth} \@affiliationB \end{minipage} \tabularnewline
      \ & \tabularnewline
      \begin{minipage}[t]{0.4\textwidth} \@committeeC \end{minipage} & 
      \begin{minipage}[t]{0.5\textwidth} \@affiliationC \end{minipage} \tabularnewline
      \if@fourcommittee
        \ & \tabularnewline
        \begin{minipage}[t]{0.4\textwidth} \@committeeD \end{minipage} & 
        \begin{minipage}[t]{0.5\textwidth} \@affiliationD \end{minipage} \tabularnewline
      \fi
      \if@fivecommittee
        \ & \tabularnewline
        \begin{minipage}[t]{0.4\textwidth} \@committeeE \end{minipage} & 
        \begin{minipage}[t]{0.5\textwidth} \@affiliationE \end{minipage} \tabularnewline
      \fi
    \end{tabular}
    }
  \end{center}
}

% Create abstract page(s), counted, not numbered.
\def\abstractpage{\@ifundefined{@abstract}{}{
  \newpage
  \pagestyle{empty}
  \vspace*{-1.5\baselineskip}
  \section*{\centering {\normalfont\normalsize\singlespace ABSTRACT\\
  			\vspace{0.5\baselineskip} {\MakeUppercase{\@title}}\\ 
            \MakeLowercase{by} \@author}}
  \input{\@abstract}
}}

% Create acknowledgments page, counted, numbered.
\def\acknowledgementpage{\@ifundefined{@acknowledgments}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize ACKNOWLEDGMENTS}}
  \input{\@acknowledgments}
}}

% Create dedication page, not counted, not numbered.
\def\dedicationpage{\@ifundefined{@dedication}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize DEDICATION}}
  \input{\@dedication}
}}

% Create abbreviations page, counted, numbered.
\def\abbreviationspage{\@ifundefined{@abbreviations}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize LIST OF ABBREVIATIONS}}
  \input{\@abbreviations}
  \addcontentsline{toc}{section}{List of Abbreviations}
}}

% Create appendices page, counted, numbered.
\def\appendixpages{\@ifundefined{@appendices}{}{
  \newpage
  \IEEEappendices
  \input{\@appendices}
}}

% Create preface page(s), counted, numbered.
\def\prefacepages{\@ifundefined{@preface}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize PREFACE}}
  \addcontentsline{toc}{section}{Preface}
  \input{\@preface}
}}

% Create Table of Contents page(s), counted, numbered.
\def\tocpages{%
  \setlength{\textheight}{\@alttextheight}%
  \newpage
  \pagestyle{plain}
  \setlength{\headsep}{\@altheadsep}%
  \tableofcontents
  \setlength{\textheight}{\@realtextheight}%
}%

% Create List of Tables page(s), counted, numbered.
\def\lotpages{%
  \if@optlisttables
    \setlength{\textheight}{\@alttextheight}%
    \newpage
    \pagestyle{preambleheadings}%
    \setlength{\headsep}{\@altheadsep}%
    \listoftables
    \setlength{\textheight}{\@realtextheight}%
  \fi
}%

% Create List of Figures page(s), counted, numbered.
\def\lofpages{%
  \if@optlistfigures
    \setlength{\textheight}{\@alttextheight}%
    \newpage
    \pagestyle{preambleheadings}%
    \setlength{\headsep}{\@altheadsep}%
    \listoffigures
    \setlength{\textheight}{\@realtextheight}%
  \fi
}%

% Produce all of the pages up to the start of section 1.
\def\startingpages{%
  \pagenumbering{arabic}
  \setcounter{page}{0}
  \pagenumbering{roman}
  \pagestyle{plain}
  \titlepage
  \copyrightpage
  \committeepage
  \abstractpage
  \acknowledgementpage
  \dedicationpage
  \prefacepages
  \tocpages
  \lotpages
  \lofpages
  \abbreviationspage
  % Finalize preamble pages
  \addtocontents{toc}{ }
  \newpage
  \setlength{\headsep}{\@realheadsep}%
}

% Allow for wide margins in the project
\def\widemargins{
  \if@optwidemargins
	\newgeometry{left=0.75in,right=0.75in,top=0.75in,bottom=0.75in}
  \fi
}


\AfterEndPreamble{
  % Preamble should always be onecolumn
  \newif\iftwocol
  \if@twocolumn
    \onecolumn
    \twocoltrue
  \fi
  % open the aux file for the bibliography
  \immediate\openout12=\@bibliofile.aux
  \immediate\write12{\string\bibstyle{ieeetr}}
  \immediate\write12{\string\bibdata{\@references}}
  \newcounter{@tmppage}
  \newlength{\@tmpheighta}
  \newlength{\@tmpheightb}
  \if@libraryrightspage
  	% Print only the library page
    \libraryrightspage
  \else
    % Include the starting pages
    \startingpages
    % Reset page numbering and page type
    \pagenumbering{arabic}
    \pagestyle{plain}
    % Reset back to twocolumn and wide margins if need be
    \iftwocol \twocolumn \fi
    \widemargins
    \newgeometry{left=1.5in,right=1.05in,top=1.25in,bottom=1.25in}
    % Add page break after each section
    \let\oldsection\section
	\renewcommand\section{\clearpage\oldsection}
    % Add sections
    \include{sections}
    % Include the bibliography
    \SJSUbibliography{references}
    % Include appendices if they exist
    \appendixpages
  \fi%
}

\endinput


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of SJSUthesis.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% That's all folks!

