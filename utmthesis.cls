% Identification
% ==============
\NeedsTeXFormat{LaTeX2e}

\newcommand\@classname    {utmthesis}
\newcommand\@classabout   {Class File for Universiti Teknologi Malaysia Thesis Writing}
\newcommand\@classdate    {2016/8/18}
\newcommand\@classversion {v5.1}
\ProvidesClass{\@classname}[\@classdate\space\@classversion\space\@classabout]

\RequirePackage{acronym}
\RequirePackage{emptypage}
\RequirePackage{times}
% \RequirePackage[colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black, pdfborder=false]{hyperref} %yap% [v4.1] commented out. 
\RequirePackage[hidelinks]{hyperref} %yap% [v4.1] new method to hide links. does not produce hyperref error.
\pdfstringdefDisableCommands{%
\let\MakeUppercase\relax
} 
\let\maketitle\relax
\let\appendix\relax


% Initial code
% ============
\newcommand{\@initializeThesisAsEnglish}{
  \def\utmthesis@language{en}
  \def\abstract@filename{abstract}
  \def\abstract@translated@filename{abstrak}
}
\newcommand{\@initializeThesisAsMalay}{
  \def\utmthesis@language{ms}
  \def\abstract@filename{abstrak}
  \def\abstract@translated@filename{abstract}
}

% Returns (english/malay) externalized string according to \utmthesis@language
% E.g. if \def\utmthesis@language{en} is set,
%      then \getstring{chaptername} calls \chaptername@en
%
\newcommand{\getstring}[1]{\csname #1@\utmthesis@language \endcsname}

% Declaration of options
% ======================
\DeclareOption{final}{\PassOptionsToClass{final}{book}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{book}}
\DeclareOption{english}{\@initializeThesisAsEnglish}
\DeclareOption{malay}{\@initializeThesisAsMalay}

\DeclareOption*{%
  \ClassWarning{\@classname}{Unknown option `\CurrentOption'}%
}

% Execution of options
% ====================
\ExecuteOptions{final,english}% the default settings
\ProcessOptions

% Package loading
% ===============

% Already met by default (in book.cls or LaTeXe2 itself)
%
% [A5] Page number style (frontmatter): small-letter Roman (i,ii,iii,..)
% [A6] Page number style (mainmatter): Arabic (1,2,3,..)
% [B2] If heading is more than 1 line, same line spacing in text should be used
% [B5] Appendix can be named, e.g. Appendix A. Specific title can also be given
% [C1] Use same font type throughout thesis
% [D9] 2-character spacing after a full-stop (.)
% [D10] 1-character spacing after a comma (,)
% [D14] New chapter must start with a new page
% [E3] Caption is Arabic-numbered respect to chapter number
% [E4] If caption is single line, aligned to center
% [E5] If caption is multi-line, aligned to left
% ----------------------------------------------------------------------

% Must do-it-yourself when writing the thesis text:
%
% [B3] Subsection headings beyond level 4 (\subsubsection) should be labeled
%      with characters.
% [C4] Chapter title (UPPERCASE)
% [C6] Write quotation in a separate paragraph
% [C7] If quotation is in different language, use italic
% [E1] Caption is positioned at the top of table
% [E2] Caption is positioned at the bottom of figure
% [E6] Table/figure should be positioned after being cited for the 1st time
% [E7] Tables/figures in a chapter can also be grouped together
% ----------------------------------------------------------------------


% [A1] A4 size (210 x 297mm)
% [A2] Printed on one side
% [C2] Preferred font type: Time News Roman, size: 12 or bigger
% [C3] Character size
%      (CAPITAL LETTER not less than 0.2cm, small-letter not less than 0.15cm)
% ---------------------------------------------------------

%default oneside printing
\LoadClass[a4paper,oneside,12pt,onecolumn]{book}

% To allow ToC level changes
\RequirePackage{tocvsec2}

% To meet [D1], we use \setstretch{1.435} command provided by 'setspace' package.
% In addition, this package fixes common line-spacing issues (e.g. too-large
% line-spacing in footnote) that happens when line-spacing is modified.
\RequirePackage{setspace}

% To meet [D7], we increase \parskip to non-zero height,
% but this will cause unexpected extra spacing problems (e.g in environment).
% The 'parskip' package is known to fix these problems.
\RequirePackage{parskip}

%Needed for optional list of algorithms
\RequirePackage{algorithm}
\RequirePackage{enumitem}
\setlist{leftmargin=0.5in}

%\RequirePackage{pdfpages}

% [A3] Page margin (left: 4cm, top/right/bottom: 2.5cm)
% [A4] Page number position (top: 1.25cm, right: 2.5cm)
% -----------------------------------------------------
%
% Set page margin without using 'geometry' package.
%
% The resulting layout is closely equivalent to:
\RequirePackage[top=2.5cm,left=4cm,right=2.5cm,bottom=2.5cm]{geometry}
%
% The only difference: page number top margin (1.25cm) is set precisely here.
%
\newlength{\margin@pagenumber@top}
%\newlength{\margin@top}
%\newlength{\margin@bottom}
%\newlength{\margin@left}
%\newlength{\margin@right}
%%
%% Define margin values:
\setlength\margin@pagenumber@top {1.25cm}
%\setlength\margin@top            {2.5cm}
%\setlength\margin@bottom         {2.5cm}
%\setlength\margin@left           {4.0cm}
%\setlength\margin@right          {2.5cm}
%%
%% Set page margin:
%% left
%\setlength\oddsidemargin      {\margin@left}
%  \addtolength\oddsidemargin  {-1.0in}% remove the default 1 inch
%% top
%\setlength\topmargin          {\margin@pagenumber@top}
%  \addtolength\topmargin      {-1.0in}% remove the default 1 inch
%\setlength\headheight         {0.8\baselineskip}% 0.8 = -20% extra line spacing
%\setlength\headsep            {\margin@top}
%  \addtolength\headsep        {-\margin@pagenumber@top}
%  \addtolength\headsep        {-\headheight}
%% bottom
%\setlength\textheight         {\paperheight}
%  \addtolength\textheight     {-\margin@top}
%  \addtolength\textheight     {-\margin@bottom}
%% right
%\setlength\textwidth          {\paperwidth}
%  \addtolength\textwidth      {-\margin@left}
%  \addtolength\textwidth      {-\margin@right}

% Define an if@appendix flags, to be used in \chapter
% to switch formatting between chapter/appendix title.
% When \appendix is called, the flag is set to TRUE.
\newif\if@appendix% to check if appendix is used
\@appendixfalse%  initially set to FALSE
\newif\if@appendixtoc % to check if appendix page number is being printed in ToC
\@appendixtocfalse%  initially set to FALSE

% Define "list of appendices" file extension (.loa) % Nadzir Changed this to loapp. Seems like loa is for list of appendices
\newcommand\ext@appendix{loapp}


% +++++++++++++++++++++
% Externalized string  - Caption labels
% +++++++++++++++++++++
% -- English
\newcommand{\tablename@en}    {Table}
\newcommand{\figurename@en}   {Figure}
\newcommand{\algorithmname@en}{Algorithm}
% -- Malay
\newcommand{\tablename@ms}    {Jadual}
\newcommand{\figurename@ms}   {Rajah}
\newcommand{\algorithmname@ms}{Algoritma}
% --
\renewcommand{\tablename}     {\getstring{tablename}}
\renewcommand{\figurename}    {\getstring{figurename}}
\floatname{algorithm}		  {\getstring{algorithmname}}


% +++++++++++++++++++++
% Externalized string  - Heading labels
% +++++++++++++++++++++
% -- English
\newcommand{\partname@en}     {PART}
\newcommand{\chaptername@en}  {CHAPTER}
\newcommand{\appendixname@en} {Appendix}
% -- Malay
\newcommand{\partname@ms}     {BAHAGIAN}
\newcommand{\chaptername@ms}  {BAB}
\newcommand{\appendixname@ms} {Lampiran}
% --
\renewcommand{\partname}      {\getstring{partname}}
\renewcommand{\chaptername}   {\getstring{chaptername}}
\renewcommand{\appendixname}  {\getstring{appendixname}}

% +++++++++++++++++++++
% Externalized string  - Page titles (frontmatter)
% +++++++++++++++++++++
% -- English
\newcommand{\declarationame@en}     {DECLARATION}
\newcommand{\dedicationname@en}     {DEDICATION}
\newcommand{\acknowledgementname@en}{ACKNOWLEDGEMENT}
\newcommand{\abstractname@en}       {ABSTRACT}
\newcommand{\abstractlocalname@en}  {ABSTRAK}
\newcommand{\contentsname@en}       {TABLE OF CONTENTS}
\newcommand{\listtablename@en}      {LIST OF TABLES}
\newcommand{\listfigurename@en}     {LIST OF FIGURES}
\newcommand{\listabbrename@en}      {LIST OF ABBREVIATIONS}
\newcommand{\listsymbolname@en}     {LIST OF SYMBOLS}
\newcommand{\listappendixname@en}   {LIST OF APPENDICES}
\newcommand{\listalgorithmname@en}  {LIST OF ALGORITHMS}
% -- Malay
\newcommand{\declarationame@ms}     {PENGAKUAN}
\newcommand{\dedicationname@ms}     {DEDIKASI}
\newcommand{\acknowledgementname@ms}{PENGHARGAAN}
\newcommand{\abstractname@ms}       {ABSTRACT}
\newcommand{\abstractlocalname@ms}  {ABSTRAK}
\newcommand{\contentsname@ms}       {KANDUNGAN}
\newcommand{\listtablename@ms}      {SENARAI JADUAL}
\newcommand{\listfigurename@ms}     {SENARAI RAJAH}
\newcommand{\listabbrename@ms}      {SENARAI SINGKATAN}
\newcommand{\listsymbolname@ms}     {SENARAI SIMBOL}
\newcommand{\listappendixname@ms}   {SENARAI LAMPIRAN}
\newcommand{\listalgorithmname@ms}  {SENARAI ALGORITHMA}
% --
\newcommand{\declarationname}       {\getstring{declarationame}}
\newcommand{\dedicationname}        {\getstring{dedicationname}}
\newcommand{\acknowledgementname}   {\getstring{acknowledgementname}}
\newcommand{\abstractname}          {\getstring{abstractname}}
\newcommand{\abstractlocalname}     {\getstring{abstractlocalname}}
\renewcommand{\contentsname}        {\getstring{contentsname}}
\renewcommand{\listtablename}       {\getstring{listtablename}}
\renewcommand{\listfigurename}      {\getstring{listfigurename}}
\newcommand{\listabbrename}         {\getstring{listabbrename}}
\newcommand{\listsymbolname}        {\getstring{listsymbolname}}
\newcommand{\listappendixname}      {\getstring{listappendixname}}
\renewcommand{\listalgorithmname}   {\getstring{listalgorithmname}}


% +++++++++++++++++++++
% Externalized string  - Page titles (mainmatter)
% +++++++++++++++++++++
% -- English
\newcommand{\bibname@en}        {REFERENCES}
\newcommand{\appendicesname@en} {Appendices}
% -- Malay
\newcommand{\bibname@ms}        {RUJUKAN}
\newcommand{\appendicesname@ms} {Lampiran}
% --
\renewcommand{\bibname}         {\getstring{bibname}}
\newcommand{\appendicesname}    {\getstring{appendicesname}}%  used once in TOC

% Preamble variables:
%
% Set these variables in preamble
%
% Existing commands:
% ==============---------------------------------------------------============
%   \title     - The thesis title
%   \author    - The author fullname
%   \date      - The signature date of supervisor/author declaration
%                (default value is \today)
% ==============---------------------------------------------------============
%
% New commands:
% ==============---------------------------------------------------============
%   \degree     - The degree name  (e.g. Master of Science)
%   \faculty    - The faculty name (e.g. Faculty of Science)
%   \titledate  - The published date to be appeared on cover page (e.g. 2008)
%   \award      - Award statement option (1-7):
%                   1. Bachelor Degree Project Report
%                   2. Master's Project Report (By course work)
%                   3. Master's Dissertation (By course work and research)
%                   4. Master's Thesis (By research)
%                   5. Doctor of Philosophy Thesis
%                   6. Other PhD Thesis
%                   7. Generic PhD Thesis
%                   8. Thesis Proposal
%   \superone    - The supervisor fullname
%   \supertwo    - 2nd supervisor fullname (if any)
%   \superthree  - 3rd supervisor fullname (if any)
%   \superfour   - 4th supervisor fullname (if any)
%   \superfive   - 5th supervisor fullname (if any)
% ==============---------------------------------------------------============
%
\newcommand{\titletwo}[1]{\def\@titletwo{#1}}
\newcommand{\titlethree}[1]{\def\@titlethree{#1}}
\newcommand{\degree}[1]{\def\@degree{#1}}
\newcommand{\specialization}[1]{\def\@specialization{#1}}
\newcommand{\intakeyear}[1]{\def\@intakeyear{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\titledate}[1]{\def\@titledate{#1}}
\newcommand{\award}[1]{\def\@award{#1}}
\newcommand{\superone}[1]{\def\@supervisorone{#1}}
\newcommand{\supertwo}[1]{\def\@supervisortwo{#1}}
\newcommand{\superthree}[1]{\def\@supervisorthree{#1}}
\newcommand{\superfour}[1]{\def\@supervisorfour{#1}}
\newcommand{\superfive}[1]{\def\@supervisorfive{#1}}
%
% Empty initialization
\title{}
\titletwo{}
\titlethree{}
\author{}
\degree{}
\specialization{}
\intakeyear{}
\faculty{}
\titledate{}
\award{}
\superone{}
\supertwo{}
\superthree{}
\superfour{}
\superfive{}
%
% Warn if user does not set the required variables in preamble
\newcommand\checkpreamble{
  \ifx\@title\@empty
    \@latex@warning{\@classname: \@backslashchar title not defined in preamble}
    \def\@title{Your Thesis Title}
  \fi

  \ifx\@author\@empty
    \@latex@warning{\@classname: \@backslashchar author not defined in preamble}
    \def\@author{Your Fullname}
  \fi

  \ifx\@degree\@empty
    \@latex@warning{\@classname: \@backslashchar degree not defined in preamble}
    \def\@degree{Your Degree}
  \fi
  
  \ifx\@specialization\@empty
    \@latex@warning{\@classname: \@backslashchar specialization not defined in preamble}
    \def\@specialization{Your Specialization}
  \fi

  \ifx\@intakeyear\@empty
    \@latex@warning{\@classname: \@backslashchar specialization not defined in preamble}
    \def\@intakeyear{\year}
  \fi
    
  \ifx\@award\@empty
    \@latex@warning{\@classname: \@backslashchar award not defined in preamble}
    \def\@award{4}% default to Master's Research
  \else
    \ifnum \@award <1
      \@latex@warning{\@classname: \@backslashchar award valid value is 1-8}
      \def\@award{5}% default to PhD
    \fi
    \ifnum \@award >7
      \@latex@warning{\@classname: \@backslashchar award valid valid is 1-8}
      \def\@award{5}% default to PhD
    \fi
  \fi

  \ifx\@faculty\@empty
    \@latex@warning{%
      \@classname: \@backslashchar faculty not defined in preamble}
    \def\@faculty{Your Faculty}
  \fi

  \ifx\@titledate\@empty
    \@latex@warning{%
      \@classname: \@backslashchar titledate not defined in preamble}
    \def\@titledate{Month Year}
  \fi

  \ifx\@supervisorone\@empty
    \@latex@warning{%
      \@classname: \@backslashchar superone not defined in preamble}
    \def\@supervisorone{Your Supervisor Fullname}
  \fi
}
% Check preamble variables right after \begin{document}
\AtBeginDocument{
  \checkpreamble
}


% ==========================
%  Line Spacing Formatting
% --------------------------

% Define 2 parameters: one-line, two-line spacing (single-spacing line)
\newlength{\@onelinespacing}
\setlength{\@onelinespacing}{0.8\baselineskip}%  remove the 20% extra spacing
                                              %  added by LaTeX, hence 0.8
\newlength{\@twolinespacing}
\setlength{\@twolinespacing}{2\@onelinespacing}


% [D7] 2-line spacing between text paragraphs
% -------------------------------------------
%
% Copied from parskip.sty:
%   \parskip  - defines spacing between paragraphs
%   \parsep   - more specifically: \@listI, \@listii, \@listiii
%               \parsep defines spacing between items in list environment

% modify \parskip to use \@twolinespacing
\parskip=\@twolinespacing \advance\parskip by 0pt plus 2pt

% modify \parsep to .5\@onelinespacing
\def\@listI{\leftmargin\leftmargini
   \topsep\z@ \parsep .5\@onelinespacing \itemsep\z@}
\let\@listi\@listI
\@listi

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep\z@ \parsep .5\@onelinespacing \itemsep\z@}

\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep\z@ \parsep .5\@onelinespacing \itemsep\z@}


% [D12] The 1st line in paragraph left-indent 0.5 inch (1.27cm)
% -------------------------------------------------------------
%
% By default, the 1st line of 1st paragraph after heading is not indented.
% To meet [D12], we remove this rule.
%
% Copied from 'indentfirst' package, two-line code:
\let\@afterindentfalse\@afterindenttrue
\@afterindenttrue
%
% Then set the indentation length
\setlength{\parindent}{0.5in}


% [D1] 1.5 line spacing
% ---------------------
\setstretch{1.435}


% [D13] Don't start a new text paragraph on the last line of the page
%       (no club-line)
% -----------------------------------------------------------------------------
% don't use 10000, otherwise, you're not giving latex any chance
\clubpenalty=9999 %10000    % avoid club line at bottom of page
\widowpenalty=9999 %10000   % avoid widow line at the top of page
\brokenpenalty=9999 %10000  % avoid page break after a hyphenated line

% Note: By default, book.cls allows club/widow/broken line.
% To restore the default behavior, comment the 3 lines above.


% =======================
%  Minimize Hyphenation
% -----------------------

% Note: The default book.cls renders a lot hyphenated words.
%       Without \sloppy, text may overflow out the required textwidth.
\hyphenpenalty=8000\sloppy


% ========================
%  Page Style Formatting
% ------------------------

% [A7] Page number in 1st page of preliminary pages is counted, but not printed
% [A8] Page number in 1st page of each chapter is counted, but not printed
% ----------------------------------------------------------------------------

% LaTeX page style options:
%  myheadings - header shows page number, empty footer, @mkboth do nothing
%  empty      - both header & foorter are empty

% Apply 'myheadings' to all pages
\pagestyle{myheadings}

% By default, \chapter will switch the current page style to 'empty'.
% To restore the page number, call \@showpagenumber after \chapter.
\newcommand{\@showpagenumber}{\thispagestyle{myheadings}}

% To hide page number in the current page, call \@hidepagenumber.
\newcommand{\@hidepagenumber}{\thispagestyle{empty}}


% =================
%  TOC Formatting
% -----------------

\def\toclevel@nonmainmatterchapter{0}
\def\toclevel@appendixchapter{1}

% Set the highest heading level to appear in TOC.
\setcounter{tocdepth}{3}

% Hide the dots between line number and heading title.
\renewcommand\@dotsep{10000}% set the separation between dots really big
\renewcommand{\@tocrmarg}{4em}
\renewcommand{\@pnumwidth}{4em}

% Position different heading titles in TOC:
%
% To make position modification easier, we define 2 types of parameters:
%   \toc@tab@n  - the tab position measured from left-margin
%   \toc@sep@n  - the separation size between each tab

\newlength{\toc@tab@a}
\newlength{\toc@tab@b}
\newlength{\toc@tab@c}
\newlength{\toc@tab@jumps}

\newlength{\toc@sep@part}
\newlength{\toc@sep@chap}
\newlength{\toc@sep@figs}
\newlength{\toc@sep@figstitle}
\newlength{\toc@sep@a}
\newlength{\toc@sep@b}
\newlength{\toc@sep@c}
\newlength{\toc@sep@d}

% Their usage is visualized in the picture below:
%
%            |tab@a  |tab@b   |tab@c
% | 6em      | 3em   | 4em    | 4em    |
% | sep@a    | sep@b | sep@c  | sep@d  |
% +----------+-------+--------+--------+
% |   | sep@chap
% +---+
% 1          CHAPTER HEADING
%            1.1     Section Heading
%                    1.1.1    Subsection Heading
%                             1.1.1.1  Subsubsection Heading
%
% | 8em         |
% | sep@part    |
% +-------------+-------
% PART I        PART TITLE
%
% To modify tab positions, only need to adjust \toc@sep@n values:
\setlength{\toc@sep@part}{8em}
\setlength{\toc@sep@chap}{2em}
\setlength{\toc@sep@figs}{0cm}
\setlength{\toc@sep@figstitle}{2.5cm}
\setlength{\toc@sep@a}{6em}
\setlength{\toc@sep@b}{4em}% nadzir changed this from 3em
\setlength{\toc@sep@c}{4em}
\setlength{\toc@sep@d}{4em}

% Table jumps for centering the "TITLE" in all ToCs
\setlength{\toc@tab@jumps}{3.5em}

% \toc@sep@n values will be used in the rest of TOC formatting:

% Set tab positions
\setlength{\toc@tab@a}{\toc@sep@a}
\setlength{\toc@tab@b}{\toc@tab@a} \addtolength{\toc@tab@b}{\toc@sep@b}
\setlength{\toc@tab@c}{\toc@tab@b} \addtolength{\toc@tab@c}{\toc@sep@c}

% LaTeX internal command to arrange TOC entry:
%   \@dottedtocline {heading level}{left indent}{numbering label's width}
%

% Format section, subsection and subsubsection in TOC
\renewcommand*\l@section{\@dottedtocline{1}{\toc@tab@a}{\toc@sep@b}}
\renewcommand*\l@subsection{\@dottedtocline{2}{\toc@tab@b}{\toc@sep@c}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{\toc@tab@c}{\toc@sep@d}}

% Format entries in \listoffigures, \listoftables and \listofappendices
\renewcommand*\l@figure{\@dottedtocline{1}{\toc@sep@figs}{\toc@sep@figstitle}} %Vishnu changed these to custom lengths (0cm and 2.5cm)
\let\l@table\l@figure
\let\l@appendix\l@figure
\let\l@algorithm\l@figure

% Format appendix chapter in TOC
%nadzir - not really needed anymore
\newcommand*\l@appendixchapter{\@dottedtocline{1}{0em}{\toc@sep@a}}

% Format non-mainmatter chapter in TOC
% (i.e. headings in frontmatter, and 'References', 'Appendices' headings)
%
% Modified based on \l@chapter
%
\newcommand*\l@nonmainmatterchapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \setlength\@tempdima{\toc@sep@a}% set \numberline{} width
    \begingroup
      \parindent \toc@sep@chap %\z@ Nadzir centered the chapter number instead of 0em
      \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hspace{\@tempdima}% since no \numberline{}, put a blank space here
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss \MakeUppercase{#2}}\par
    \endgroup
  \fi}

% Copied from book.cls:
%   \l@chapter  - format chapter in TOC
%   \@chapter   - called when there is a numbered chapter
%
% Main ToC formating
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \setlength\@tempdima{4em}% nadzir set \numberline{} width
    \begingroup
      \parindent -4em %\z@ %Nadzir centered the chapter number instead of 0em
      \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip %\@tempdima
      \toc@sep@a
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth {\normalfont \hss #2}\par
      \penalty9999% to discourage chapter to appear at last line of page
    \endgroup
  \fi}

% After ToC (List of Figures, Tables, etc)
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
     \if@mainmatter
       \refstepcounter{chapter}%
       \typeout{\@chapapp\space\thechapter.}%
       \if@appendix
         \addcontentsline{\ext@appendix}{appendix}%
                         {\protect\numberline{\thechapter}{\ignorespaces#1}} % Fixed by Vishnu, should not be upper case
         %dummy label to make Lampiran in toc possible
         \label{applastpage}
       \else
         \addtocontents{toc}{\protect\addvspace{\@twolinespacing}}%
         \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}\MakeUppercase{#1}}%
         % for each new chapter,
         % add some spacing in .lof & .lot
         % removed by nadzir
         % \ifnum \thechapter >1%  if chapter 1, don't add spacing
         %    \addtocontents{lof}{\protect\addvspace{15\p@}}
         %    \addtocontents{lot}{\protect\addvspace{15\p@}}
         % \fi
       \fi
     \else
       \addcontentsline{toc}{nonmainmatterchapter}{\MakeUppercase{#1}}%
     \fi
  \else
    \addcontentsline{toc}{chapter}{\MakeUppercase{#1}}%
  \fi
  \chaptermark{#1}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{\MakeUppercase{#2}}]%
  \else
    \@makechapterhead{\MakeUppercase{#2}}%
    \@afterheading
  \fi}


% =====================
%  Heading Formatting
% ---------------------

% [B1] Heading level, not more than 4 levels
%      (chapter, section, subsection, subsubsection)
% --------------------------------------------------------------------

% secnumdepth - the highest heading level to have numbering label.

% Must be executed as late as possible (right before \begin{document})
% to avoid conflict with 'arabtex' package.
%
% Conflict symptoms (with 'arabtex' package):
%   \subsubsection{} does not show its numbering label.
%
\AtBeginDocument {
  \setcounter{secnumdepth}{3}
}

% [A9] The part separation sheets between parts is not be counted nor numbered.
% -----------------------------------------------------------------------------

% Copied from book.cls:
%   \part  -  start a new part in document
%   \@endpart - called at the end of the \part command
%
\renewcommand\part{%
  \if@openright\cleardoublepage\@hidepagenumber\else\clearpage\@hidepagenumber\fi
  \@hidepagenumber%  this page does not have page number
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\newcounter{utmthesis@temp@page}% A temporary counter to store page counter

\def\@endpart{%
  \setcounter{utmthesis@temp@page}{\value{page}}% Store current page counter
  \pagenumbering{Roman}% Change number style (implicitly reset page counter)
  \setcounter{page}{\value{part}}% Set page counter to part counter
  \vfil\newpage
  \pagenumbering{arabic}% Restore number style (implicitly reset page counter)
  \setcounter{page}{\value{utmthesis@temp@page}}% Restore page counter
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}%
      \newpage
    \fi
  \fi
  \if@tempswa
    \twocolumn
  \fi}

% [B4] The part separation sheet should be printed with capital letters,
%      e.g. PART 1, PART 2, PART 3
% ----------------------------------------------------------------------------

% Similar to \contentsline, but does not accept nor display page number
\newcommand*\nonumcontentsline[1]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    % set \numberline{} width
    % -- if long partname (e.g BAHAGIAN I ), use \toc@sep@part
    \settowidth{\@tempdima}{\partname~N }
    \ifdim \@tempdima <\toc@sep@a
      \setlength\@tempdima{\toc@sep@a}
    \else
      \setlength\@tempdima{\toc@sep@part}
    \fi
    \begingroup
      \parindent \z@
      {\leavevmode
       \bfseries #1}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}

% Copied from book.cls:
%   \@part - format the part title
%
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      %  add to TOC, but without page number (since this page is not counted)
       \addtocontents{toc}{\protect
          \nonumcontentsline{\numberline{\partname\space\thepart}\MakeUppercase{#1}}}
    \else
      %  add to TOC, but without page number
      \addtocontents{toc}{\protect\nonumcontentsline{\MakeUppercase{#1}}}
    \fi
    \markboth{}{}%
    {\centering
    \vfill
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       % part number - UPPERCASE, and make it slightly larger
       \large \bfseries \MakeUppercase{\partname\nobreakspace\thepart}
       \par
       \vskip 20\p@
     \fi
     % part title - make it slightly larger
     \large \bfseries \MakeUppercase{#2}\par}%
     \vfill
    \@endpart}


% [C4] Chapter title (centered, bold)
% [D2] 2.5cm spacing between margin-top & chapter label
% [D3] 4-line spacing between chapter label & chapter title
% [D4] 4-line spacing between chapter title & first line of text paragraph
% -------------------------------------------------------------------

% Copied from book.cls:
%   \@makechapterhead  - defines \chapter{} formatting
%   \@makeschapterhead - defines \chapter*{} formatting
%
\renewcommand\@makechapterhead[1]{%
  \vspace*{-\topskip}
  \if@appendix
    %\vspace{-1.5\@twolinespacing}% move appendix title a bit higher
    %remove by nadzir. Don't be confused with the manual 2007. Those appendices titles are put very high due to constraints writing appendice.
    \vspace{2.5cm}% before chapter no.
  \else
    \vspace{2.5cm}% before chapter no.
  \fi
  \vspace{-\parskip}
  \nointerlineskip
  { \parindent \z@ \centering \normalfont \bfseries
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \@chapapp\space \thechapter% show chapter no.
        \if@appendix
          \\*[2\@twolinespacing]% after chapter no.
        \else
          \\*[2\@twolinespacing]% after chapter no.
        \fi
      \fi
    \fi
    \interlinepenalty\@M
    #1% show chapter title
    \if@appendix
      \\*[2\@twolinespacing]% after chapter title
      \@hidepagenumber
    \else
      \\*[2\@twolinespacing]% after chapter title
      \@hidepagenumber
    \fi
  }
  \setstretch{1.435}
}

\renewcommand\@makeschapterhead[1]{%
  \@hidepagenumber
  \vspace*{-\topskip}
  \vspace{2.5cm}% before chapter title
  \vspace{-\parskip}
  \nointerlineskip
  {\parindent \z@ \centering \normalfont \bfseries
    \interlinepenalty\@M
    #1 % show chapter title
    \\*[2\@twolinespacing]% after chapter title
  }
  \setstretch{1.435}  
}

% [C5] Title of (sub)section (bold)
% [D5] 4-line spacing between last line of text & (sub)section heading
% [D6] 2-line spacing between (sub)section heading & first line of text
% [D11] Section heading aligned with margin-left
% -----------------------------------------

% Prepare a tiny skip approx. to 0pt, will be used in {afterskip} below
\newlength{\@tinyskip}
\setlength{\@tinyskip}{0.001mm}



% LaTeX generic command to format section headings:
% \@startsection {name}{level}{left-indent}
%                {beforeskip}
%                {afterskip} % must be positive to prevent run-in heading
%                {styles}
%
\renewcommand\section{\@startsection {section}{1}{0pt}%
                                     {\@twolinespacing}%
                                     {\@tinyskip}%
                                     {\normalfont\normalsize\bfseries}}
\renewcommand\subsection{\@startsection {subsection}{2}{0pt}%
                                     {\@twolinespacing}%
                                     {\@tinyskip}%
                                     {\normalfont\normalsize\bfseries}}

\renewcommand\subsubsection{\@startsection {subsubsection}{3}{0pt}%
                                     {\@twolinespacing}%
                                     {\@tinyskip}%
                                     {\normalfont\normalsize\bfseries}}

% =====================
%  Caption Formatting
% ---------------------
% [C8] Caption label (bold)
% --------------------------
% Copied from book.cls:
%   \@makecaption  - defines table/figure caption formatting
%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\bfseries #1: \normalfont #2}%  change caption label to bold, period.
  \ifdim \wd\@tempboxa >\hsize
    \textbf{#1}: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% Copied from book.cls:
%   envrionments: table, table*, figure and figure*

% Add spacing before/after caption for table/figure environments:
%
%   \abovecaptionskip  - defines spacing before caption
%   \belowcaptionskip  - defines spacing after caption
%
\renewenvironment{table}
  {\setlength{\abovecaptionskip}{0pt}
   \setlength{\belowcaptionskip}{5pt}
   \@float{table}}
  {\end@float}

\renewenvironment{table*}
  {\setlength{\abovecaptionskip}{0pt}
   \setlength{\belowcaptionskip}{5pt}
   \@dblfloat{table}}
  {\end@dblfloat}

\renewenvironment{figure}
  {\setlength{\belowcaptionskip}{0pt}
   \setlength{\abovecaptionskip}{1ex}%originally 0pt
   \@float{figure}}
  {\end@float}

\renewenvironment{figure*}
  {\setlength{\belowcaptionskip}{0pt}
   \setlength{\abovecaptionskip}{1ex}%originally 0pt
   \@dblfloat{figure}}
  {\end@dblfloat}


% [D8] 2-line spacing between last-line of text & table/figure/illustration
% --------------------------------------------------------------------
% From documentation in epslatex (by Keith Reckdahl):
%   \floatsep     - spacing between floats at top/bottom of page
%   \textfloatsep - spacing between text and the float at top/bottom of page
%   \intextsep    - spacing above & below the float in the middle of page

% The removed 20% extra spacing is added back, thus 1 / 0.8 = 1.25
%
\setlength{\floatsep}{1.25\@twolinespacing}
\setlength{\textfloatsep}{1.25\@twolinespacing plus 5pt}
\setlength{\intextsep}{1.25\@twolinespacing}

% ========================================
%             [P5] Title Page
% ----------------------------------------
% +++++++++++++++++++++
% Externalized string  - Title Page
% +++++++++++++++++++++
% -- English
\newcommand{\awardphrase@degree@en}               {A final year project report submitted in partial fulfilment of the}
\newcommand{\awardphrase@mastercourse@en}         {A project report submitted in partial fulfilment of the}
\newcommand{\awardphrase@mastercourseresearch@en} {A dissertation submitted in partial fulfilment of the}
\newcommand{\awardphrase@masterresearch@en}       {A thesis submitted in fulfilment of the}
\newcommand{\awardphrase@phd@en}                  {A thesis submitted in fulfilment of the}
\newcommand{\awardphrase@otherphd@en}             {A dissertation submitted in partial fulfilment of the}
\newcommand{\awardphrase@genericphd@en}           {A thesis submitted in fulfilment of the}
\newcommand{\awardphrase@proposal@en}             {A proposal submitted in fulfilment of the}
\newcommand{\@awardphrasetwo@en}                  {requirements for the award of the degree of}
\newcommand{\@awardphrasetwodegree@en}            {requirements for the award of the degree of}
\newcommand{\@awardphrasethree@en}                {requirements for the First Stage Examination of the degree of}
% -- Malay
\newcommand{\awardphrase@degree@ms}               {Laporan projek tahun akhir ini dikemukakan sebagai memenuhi}
\newcommand{\awardphrase@mastercourse@ms}         {Laporan projek ini dikemukakan sebagai memenuhi sebahagian daripada}
\newcommand{\awardphrase@mastercourseresearch@ms} {Disertasi ini dikemukakan sebagai memenuhi sebahagian daripada}
\newcommand{\awardphrase@masterresearch@ms}       {Tesis ini dikemukakan sebagai memenuhi}
\newcommand{\awardphrase@phd@ms}                  {Tesis ini dikemukakan sebagai memenuhi}
\newcommand{\awardphrase@otherphd@ms}             {Disertasi ini dikemukakan sebagai memenuhi sebahagian daripada}
\newcommand{\awardphrase@genericphd@ms}           {Tesis ini dikemukakan sebagai memenuhi}
\newcommand{\awardphrase@proposal@ms}             {Cadangan ini dikemukakan sebagai memenuhi}
\newcommand{\@awardphrasetwo@ms}                  {syarat penganugerahan ijazah}
\newcommand{\@awardphrasetwodegree@ms}            {sebahagian daripada syarat penganugerahan ijazah}
\newcommand{\@awardphrasethree@ms}                {syarat Peperiksaan Tahap Pertama penganugerahan ijazah}
% --
\newcommand{\awardphrase@degree}              {\getstring{awardphrase@degree}}
\newcommand{\awardphrase@mastercourse}        {\getstring{awardphrase@mastercourse}}
\newcommand{\awardphrase@mastercourseresearch}{\getstring{awardphrase@mastercourseresearch}}
\newcommand{\awardphrase@masterresearch}      {\getstring{awardphrase@masterresearch}}
\newcommand{\awardphrase@phd}                 {\getstring{awardphrase@phd}}
\newcommand{\awardphrase@otherphd}            {\getstring{awardphrase@otherphd}}
\newcommand{\awardphrase@genericphd}          {\getstring{awardphrase@genericphd}}
\newcommand{\awardphrase@proposal}            {\getstring{awardphrase@proposal}}
\newcommand{\@awardphrasetwo}                 {\getstring{@awardphrasetwo}}
\newcommand{\@awardphrasethree}               {\getstring{@awardphrasethree}}
\newcommand{\@awardphrasetwodegree}           {\getstring{@awardphrasetwodegree}}

% -- English
\newcommand{\degreetype@degree@en}               {final year project report}
\newcommand{\degreetype@mastercourse@en}         {project report}
\newcommand{\degreetype@mastercourseresearch@en} {dissertation}
\newcommand{\degreetype@masterresearch@en}       {thesis}
\newcommand{\degreetype@phd@en}                  {thesis}
\newcommand{\degreetype@otherphd@en}             {dissertation}
\newcommand{\degreetype@genericphd@en}           {thesis}
\newcommand{\degreetype@proposal@en}             {proposal}
% -- Malay
\newcommand{\degreetype@degree@ms}               {laporan projek tahun akhir}
\newcommand{\degreetype@mastercourse@ms}         {laporan projek}
\newcommand{\degreetype@mastercourseresearch@ms} {disertasi}
\newcommand{\degreetype@masterresearch@ms}       {tesis}
\newcommand{\degreetype@phd@ms}                  {tesis}
\newcommand{\degreetype@otherphd@ms}             {disertasi}
\newcommand{\degreetype@genericphd@ms}           {tesis}
\newcommand{\degreetype@proposal@ms}             {cadangan}
% --
\newcommand{\degreetype@degree}              {\getstring{degreetype@degree}}
\newcommand{\degreetype@mastercourse}        {\getstring{degreetype@mastercourse}}
\newcommand{\degreetype@mastercourseresearch}{\getstring{degreetype@mastercourseresearch}}
\newcommand{\degreetype@masterresearch}      {\getstring{degreetype@masterresearch}}
\newcommand{\degreetype@phd}                 {\getstring{degreetype@phd}}
\newcommand{\degreetype@otherphd}            {\getstring{degreetype@otherphd}}
\newcommand{\degreetype@genericphd}          {\getstring{degreetype@genericphd}}
\newcommand{\degreetype@proposal}            {\getstring{degreetype@proposal}}

\renewcommand{\maketitle}{
  \ifnum \@award=1
    \def\@awardphrase{\awardphrase@degree}
    \def\@degreetype{\degreetype@degree}
  \fi
  \ifnum \@award=2
    \def\@awardphrase{\awardphrase@mastercourse}
    \def\@degreetype{\degreetype@mastercourse}
  \fi
  \ifnum \@award=3
    \def\@awardphrase{\awardphrase@mastercourseresearch}
    \def\@degreetype{\degreetype@mastercourseresearch}
  \fi
  \ifnum \@award=4
    \def\@awardphrase{\awardphrase@masterresearch}
    \def\@degreetype{\degreetype@masterresearch}
  \fi
  \ifnum \@award=5
    \def\@awardphrase{\awardphrase@phd}
    \def\@degreetype{\degreetype@phd}
  \fi
  \ifnum \@award=6
    \def\@awardphrase{\awardphrase@otherphd}
    \def\@degreetype{\degreetype@otherphd}
  \fi
  \ifnum \@award=7
    \def\@awardphrase{\awardphrase@genericphd}
    \def\@degreetype{\degreetype@genericphd}
  \fi
  \ifnum \@award=8
    \def\@awardphrase{\awardphrase@proposal}
    \def\@degreetype{\degreetype@proposal}
  \fi
  
% start drawing title page  
  \if@openright\cleardoublepage\else\clearpage\fi
  \phantomsection% anchor mark for hyperref to navigate to
  \label{pre:titlepage}
  \begin{center}
    \null\vspace{0.4in}
	\ifx\@titlethree\@empty
        \ifx\@titletwo\@empty
            \MakeUppercase{\@title} \par
        \else
            \MakeUppercase{\@title} \\
            \MakeUppercase{\@titletwo} \par
        \fi
    \else
		\MakeUppercase{\@title} \\
        \MakeUppercase{\@titletwo} \\
        \MakeUppercase{\@titlethree} \par
    \fi
    \vspace{\stretch{2}}
    \MakeUppercase{\@author}\\
    \vspace{\stretch{2}}
    \@awardphrase\\
   	\ifnum \@award=1
    		\@awardphrasetwodegree\\
    \else 
    	    \ifnum \@award=8
 		   \@awardphrasethree\\ 
 		\else 	
           \@awardphrasetwo\\
    		\fi
    \fi
    
    \ifnum \@award=1
    		\@degree\space(\@specialization)\\
    	\else 
    		\ifnum \@award=2
    			\@degree\space(\@specialization)\\
    		\else 
    			\ifnum \@award=7
    				\@degree\\
    			\else 
    				\ifnum \@award=8
    					\@degree\space(\@specialization)\\
    				\else 
    					\ifnum \@intakeyear<2015
    						\@degree\space(\@specialization)\\
    					\else
    						\@degree\\
    					\fi
    				\fi
    			\fi
    		\fi
    	\fi
    
    \vspace{\stretch{1}}
    \ifnum \@award=7
    		School of Graduate Studies\\
    \else
    		\@faculty\\
    	\fi
    Universiti Teknologi Malaysia\\
    \vspace{\stretch{1}}
    \expandafter\MakeUppercase{\@titledate}\\
    \null\vspace{1.1in}
  \end{center}
  \@hidepagenumber
}

% -----------------
% Preliminary Pages
% -----------------
% Define an empty, do-nothing \phantomsection.
% It will be over-written by 'hyperref' package.
% \def\phantomsection{\relax} %yap% [v4.1] commented out

% +++++++++++++++++++++
% Externalized string  - Supervisor & Author Declaration
% +++++++++++++++++++++
% -- English
\newcommand{\signature@label@en}{Signature}
\newcommand{\name@label@en}{Name}
\newcommand{\date@label@en}{Date}
% -- Malay
\newcommand{\signature@label@ms}{Tandatangan}
\newcommand{\name@label@ms}{Nama}
\newcommand{\date@label@ms}{Tarikh}
% --
\newcommand{\signature@label}{\getstring{signature@label}}
\newcommand{\name@label}{\getstring{name@label}}
\newcommand{\date@label}{\getstring{date@label}}


% ========================================
%            Watermark Page
% ----------------------------------------
\newcommand{\watermarkpage}{%
  \pagenumbering{alph}% avoid pagenumber conflict, required in hyperref
	\begingroup
		\null\par
  		\label{pre:watermark}
  		\begin{center} 
  			\singlespacing
  			\vfill \par
	  		\large{This document was prepared in \LaTeX\ using \texttt{utmthesis.cls} to conform with the UTM Thesis Manual 2015.}\\[0.5in]
  		
  			\normalsize
			\begin{tabular}{l p{3in}}
				 \textbf{Author}: & \@author\\
				 \textbf{Supervisor (Main)}: & \@supervisorone \\
				 \textbf{Title}:	& \@title \space \@titletwo \space \@titlethree\\
				 \textbf{Degree}: & \@degree\\
				 \textbf{Specialization}: & \@specialization\\
				 \textbf{Source}: & {\jobname}.tex \\ 
	  			 \textbf{UTMThesis version}: & \@classversion\\ %yap% [v4.1] changed from "v4.0" to \@classversion
  				 \textbf{Date}: & \today 
			\end{tabular}		  		
		
			\par Please \textbf{DO NOT} bind this page.\\
			Comment \texttt{$\backslash$watermarkpage} to remove this page.
  			\@hidepagenumber
  			\vfill \par
  			\BgThispage
  		\end{center} 
	\endgroup
}

% ========================================
%            [P0] Cover Page
% ----------------------------------------
\newcommand{\coverpage}{%
  \pagenumbering{alph}% avoid pagenumber conflict, required in hyperref
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \begingroup
	\@hidepagenumber	
	\@hidepagenumber
	\null\vspace{0.4in}
	\label{pre:coverpage}
    \begin{center}
    \ifx\@titlethree\@empty
        \ifx\@titletwo\@empty
            \MakeUppercase{\@title} \par
        \else
            \MakeUppercase{\@title} \\
            \MakeUppercase{\@titletwo} \par
        \fi
    \else
		\MakeUppercase{\@title} \\
        \MakeUppercase{\@titletwo} \\
        \MakeUppercase{\@titlethree} \par
    \fi
    \vfill
    \MakeUppercase{\@author}
    \vfill
    UNIVERSITI TEKNOLOGI MALAYSIA
    \end{center}
    \null
    \vspace{0.75in}
  \endgroup
    
  % This is a new page which tells the student to insert form PSZ 19:16
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks  
  \@hidepagenumber
  \null
  \par\vfill 
  \begin{large}\noindent\textit{Replace this page with form PSZ 19:16 (Pind. 1/07), which can be obtained from SPS or your faculty.}\end{large}
  %\includepdf{thesisdeclarationform_2013_latest.pdf}  
  \par\vfill
}

% ========================================
%      [P3] Supervisor Declaration
% ----------------------------------------

% +++++++++++++++++++++
% Externalized string  - Supervisor Declaration
% +++++++++++++++++++++
% -- English
\newcommand{\pronouns@me@subject@en}          {I}
\newcommand{\pronouns@me@possessive@en}       {my}
\newcommand{\pronouns@we@subject@firstword@en}{We}
\newcommand{\pronouns@we@subject@en}          {we}
\newcommand{\pronouns@we@possessive@en}       {our}
\newcommand{\super@statement@en}              {%
  \ifnum \@award=1
    \def\@degreetype{\degreetype@degree}
  \fi
  \ifnum \@award=2
    \def\@degreetype{\degreetype@mastercourse}
  \fi
  \ifnum \@award=3
    \def\@degreetype{\degreetype@mastercourseresearch}
  \fi
  \ifnum \@award=4
    \def\@degreetype{\degreetype@masterresearch}
  \fi
  \ifnum \@award=5
    \def\@degreetype{\degreetype@phd}
  \fi
  \ifnum \@award=6
    \def\@degreetype{\degreetype@otherphd}
  \fi
  \ifnum \@award=7
    \def\@degreetype{\degreetype@genericphd}
  \fi
  \ifnum \@award=8
    \def\@degreetype{\degreetype@proposal}
  \fi
  
    \ifnum \@award=1   
	 \begingroup
       ```\@addressone\space hereby declare that \@addresstwo\space have read this \@degreetype\space and in \@addressthree\space \\ opinion this \@degreetype\space is sufficient in terms of scope and quality for the \\
  award of the degree of \@degree \space (\@specialization)''
     \endgroup
  \else
    \ifnum \@award=2   
	 \begingroup
       ```\@addressone\space hereby declare that \@addresstwo\space have read this \@degreetype\space and in \@addressthree\space \\ opinion this \@degreetype\space is sufficient in terms of scope and quality for the \\
  award of the degree of \@degree\space (\@specialization)''
     \endgroup
  \else
    \ifnum \@award=7   
	 \begingroup
       ```\@addressone\space hereby declare that \@addresstwo\space have read this \@degreetype\space and in \@addressthree\space \\ opinion this \@degreetype\space is sufficient in terms of scope and quality for the \\
  award of the degree of \@degree''
     \endgroup
  \else
    \ifnum \@award=8   
	 \begingroup
       ``\@addressone\space hereby declare that \@addresstwo\space have read this \@degreetype\space and in \@addressthree\space \\ opinion this \@degreetype\space is sufficient in terms of scope and quality for the \\
  First Stage Examination of \@degree \space (\@specialization)''
     \endgroup
  \else
  	 \begingroup
       ``\@addressone\space hereby declare that \@addresstwo\space have read this \@degreetype\space and in \@addressthree\space \\ opinion this \@degreetype\space is sufficient in terms of scope and quality for the \\
  award of the degree of \@degree 
    		\ifnum \@intakeyear<2015
    			\space(\@specialization)    		
    		\else 
  			\space in \@specialization''
  		\fi
     \endgroup
  \fi
  \fi
  \fi
  \fi
  }
% -- Malay
\newcommand{\pronouns@me@subject@ms}          {Saya}
\newcommand{\pronouns@me@possessive@ms}       {saya}
\newcommand{\pronouns@we@subject@firstword@ms}{Kami}
\newcommand{\pronouns@we@subject@ms}          {kami}
\newcommand{\pronouns@we@possessive@ms}       {kami}
\newcommand{\super@statement@ms}              {%
  \ifnum \@award=1
    \def\@degreetype{\degreetype@degree}
  \fi
  \ifnum \@award=2
    \def\@degreetype{\degreetype@mastercourse}
  \fi
  \ifnum \@award=3
    \def\@degreetype{\degreetype@mastercourseresearch}
  \fi
  \ifnum \@award=4
    \def\@degreetype{\degreetype@masterresearch}
  \fi
  \ifnum \@award=5
    \def\@degreetype{\degreetype@phd}
  \fi
  \ifnum \@award=6
    \def\@degreetype{\degreetype@otherphd}
  \fi
  \ifnum \@award=7
    \def\@degreetype{\degreetype@genericphd}
  \fi
  \ifnum \@award=8
    \def\@degreetype{\degreetype@proposal}
  \fi
  
  \ifnum \@award=1
    	\begingroup
  	``\@addressone\space akui bahawa \MakeLowercase{\@addresstwo}\space telah membaca \@degreetype\space ini dan 	pada \\pandangan \@addressthree\space \@degreetype\space ini adalah memadai \\dari segi skop dan kualiti untuk tujuan penganugerahan \\ijazah \@degree''
    \endgroup
  \else 
  \ifnum \@award=2
    	\begingroup
  	``\@addressone\space akui bahawa \MakeLowercase{\@addresstwo}\space telah membaca \@degreetype\space ini dan 	pada \\pandangan \@addressthree\space \@degreetype\space ini adalah memadai \\dari segi skop dan kualiti untuk tujuan penganugerahan \\ijazah \@degree\space (\@specialization)''
    \endgroup
  \else
  	 \ifnum \@award=7   
	 \begingroup
       ``\@addressone\space akui bahawa \MakeLowercase{\@addresstwo}\space telah membaca \@degreetype\space ini dan 	pada \\ pandangan \@addressthree\space \@degreetype\space ini adalah memadai \\dari segi skop dan kualiti untuk tujuan penganugerahan \\ijazah \@degree''
    \endgroup
  \else 
  \ifnum \@award=8
    	\begingroup
  	``\@addressone\space akui bahawa \MakeLowercase{\@addresstwo}\space telah membaca \@degreetype\space ini dan 	pada \\pandangan \@addressthree\space \@degreetype\space ini adalah memadai \\dari segi skop dan kualiti untuk tujuan\\ Peperiksaan Peringkat Pertama bagi ijazah \@degree \space(\@specialization)''
    \endgroup
  \else 	
  	\begingroup
  	``\@addressone\space akui bahawa \MakeLowercase{\@addresstwo}\space telah membaca \@degreetype\space ini dan 	pada \\pandangan \@addressthree\space \@degreetype\space ini adalah memadai \\dari segi skop dan kualiti untuk tujuan penganugerahan \\ijazah \@degree\space dalam \@specialization''
    \endgroup
  \fi
  \fi
  \fi
  \fi
  }
  
% --
\newcommand{\pronouns@me@subject}           {\getstring{pronouns@me@subject}}
\newcommand{\pronouns@me@possessive}        {\getstring{pronouns@me@possessive}}
\newcommand{\pronouns@we@subject@firstword} {\getstring{pronouns@we@subject@firstword}}
\newcommand{\pronouns@we@subject}           {\getstring{pronouns@we@subject}}
\newcommand{\pronouns@we@possessive}        {\getstring{pronouns@we@possessive}}
\newcommand{\super@statement}               {\getstring{super@statement}}


\newcommand{\superpage}{
    \ifx\@supervisorthree\@empty
        \ifx\@supervisortwo\@empty
            \def\@addressone{\pronouns@me@subject}
            \def\@addresstwo{\pronouns@me@subject}
            \def\@addressthree{\pronouns@me@possessive}
        \else
            \def\@addressone{\pronouns@we@subject@firstword}
            \def\@addresstwo{\pronouns@we@subject}
            \def\@addressthree{\pronouns@we@possessive}
        \fi
    \else
            \def\@addressone{\pronouns@we@subject@firstword}
            \def\@addresstwo{\pronouns@we@subject}
            \def\@addressthree{\pronouns@we@possessive}
    \fi

    \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
    \phantomsection %yap% [v4.1] added for hyperref bookmarks
    \@hidepagenumber
    \vspace*{0cm}
    \vfill
        \begin{center}
    \super@statement
        \end{center}
        \par\noindent
        \vspace*{0cm}
	\ifx\@supervisorfive\@empty    
   		\ifx\@supervisorfour\@empty
   			\ifx\@supervisorthree\@empty
       			\ifx\@supervisortwo\@empty
           			\begin{center}
            				\begin{tabular}{l p{0.4in} @{:} p{0.3in} c}
                				\signature@label & & & \\ \cline{4-4}
                				\name@label & & & \@supervisorone \\ \cline{4-4}
                				\date@label & & & \@date \\ \cline{4-4}
           				\end{tabular}
            			\end{center}
        			\else
            			\begin{center}
            				\begin{tabular}{l p{0.4in} @{:} p{0.3in} c}
                				\signature@label & & & \\ \cline{4-4}
                				\name@label & & & \@supervisorone \\ \cline{4-4}
                				\date@label & & & \@date \\ \cline{4-4}
                				\\
                				\signature@label & & & \\ \cline{4-4}
                				\name@label & & & \@supervisortwo \\ \cline{4-4}
                				\date@label & & & \@date \\ \cline{4-4}
            				\end{tabular}
            			\end{center}
        			\fi
    			\else
   				\begin{center}
    					\begin{tabular}{l p{0.4in} @{:} p{0.3in} c}
    						\signature@label & & & \\ \cline{4-4}
    						\name@label & & & \@supervisorone \\ \cline{4-4}
    						\date@label & & & \@date \\ \cline{4-4}
    						\\
    						\signature@label & & & \\ \cline{4-4}
    						\name@label & & & \@supervisortwo \\ \cline{4-4}
    						\date@label & & & \@date \\ \cline{4-4}
    						\\
    						\signature@label & & & \\ \cline{4-4}
    						\name@label & & & \@supervisorthree \\ \cline{4-4}
    						\date@label & & & \@date \\ \cline{4-4}
    					\end{tabular}
    				\end{center}
    			\fi
    		\else
    			\begin{center}
    				\begin{tabular}{l p{0.4in} @{:} p{0.3in} c}
    					\signature@label & & & \\ \cline{4-4}
    					\name@label & & & \@supervisorone \\ \cline{4-4}
    					\date@label & & & \@date \\ \cline{4-4}
    					\\
    					\signature@label & & & \\ \cline{4-4}
    					\name@label & & & \@supervisortwo \\ \cline{4-4}
    					\date@label & & & \@date \\ \cline{4-4}
    					\\
    					\signature@label & & & \\ \cline{4-4}
    					\name@label & & & \@supervisorthree \\ \cline{4-4}
    					\date@label & & & \@date \\ \cline{4-4}
    					    					\\
    					\signature@label & & & \\ \cline{4-4}
    					\name@label & & & \@supervisorfour \\ \cline{4-4}
    					\date@label & & & \@date \\ \cline{4-4}
    				\end{tabular}
    			\end{center}
    		\fi
    	\else
    		\begin{center}
    			\begin{tabular}{l p{0.4in} @{:} p{0.3in} c}
    				\signature@label & & & \\ \cline{4-4}
    				\name@label & & & \@supervisorone \\ \cline{4-4}
    				\date@label & & & \@date \\ \cline{4-4}
    				\\
    				\signature@label & & & \\ \cline{4-4}
    				\name@label & & & \@supervisortwo \\ \cline{4-4}
    				\date@label & & & \@date \\ \cline{4-4}
    				\\
    				\signature@label & & & \\ \cline{4-4}
    				\name@label & & & \@supervisorthree \\ \cline{4-4}
    				\date@label & & & \@date \\ \cline{4-4}
    				\\
    				\signature@label & & & \\ \cline{4-4}
    				\name@label & & & \@supervisorfour \\ \cline{4-4}
    				\date@label & & & \@date \\ \cline{4-4}
    				\\
    				\signature@label & & & \\ \cline{4-4}
    				\name@label & & & \@supervisorfive \\ \cline{4-4}
    				\date@label & & & \@date \\ \cline{4-4}
    			\end{tabular}
    		\end{center}
    	\fi	
    	\vfill   
}

% ========================================
%      [P4] Cooperation Declaration
% ----------------------------------------
\newcommand{\certification}{
\if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
\phantomsection %yap% [v4.1] added for hyperref bookmarks
\@hidepagenumber
% For now, just notify the student to attach the Cooperation Declaration here.
\noindent \vspace{10cm}\\ \begin{large}\textit{Replace this page with the Cooperation Declaration form,
which can be obtained from SPS or your faculty. This page is \textbf{OPTIONAL} when your research is done in collaboration with other institutions that requires their consent to publish the finding in this document.] }\end{large}

% The following have been commented because it does not confirm to the UTM format.

%\noindent\textbf{BAHAGIAN A - Pengesahan Kerjasama*}
%
%\noindent Adalah disahkan bahawa projek penyelidikan tesis ini telah dilaksanakan melalui
%kerjasama antara
%\setlength{\unitlength}{4cm}
%\begin{picture}(1,0)
%\put(0,0){\line(1,0){1}}
%\end{picture}
%dengan
%\setlength{\unitlength}{4cm}
%\begin{picture}(1,0)
%\put(0,0){\line(1,0){1}}
%\end{picture}
%
%\noindent\hspace{-1.5ex}
%\begin{tabular}{l l p{35ex} c r}
%Disahkan oleh: & & & &\\
%Tandatangan &:
%  & \ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots
%  & Tarikh : & \ldots\ldots\ldots\ldots \\
%Nama        &:
%  & \ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots \\
%Jawatan     &:
%  & \ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots \\
%(Cop Rasmi) &
%\end{tabular}
%
%\noindent*\emph{Jika penyediaan tesis/projek melibatkan kerjasama.}\\
%\noindent\setlength{\unitlength}{2mm}
%\begin{picture}(1,1)
%\multiput(0,0)(0,1){2}{\line(1,0){72}}
%\end{picture}
%
%\noindent\textbf{BAHAGIAN B - Untuk Kegunaan Pejabat Sekolah Pengajian Siswazah}
%
%\noindent Tesis ini telah diperiksa dan diakui oleh:
%
%\noindent\begin{tabular}{l p{6cm}}
%Nama dan Alamat Pemeriksa Luar : & \\\cline{2-2}
%& \\\cline{2-2}
%& \\\cline{2-2}
%\\
%Nama dan Alamat Pemeriksa Dalam : & \\\cline{2-2}
%& \\\cline{2-2}
%& \\\cline{2-2}
%\\
%Nama Penyelia Lain (jika ada) : & \\\cline{2-2}
%& \\\cline{2-2}
%& \\\cline{2-2}
%\end{tabular}
%
%\noindent Disahkan oleh Timbalan Dekan (Pengajian Siswazah \& Penyelidikan)/Ketua Jabatan Program Pengajian Siswazah:
%
%\noindent\hspace{-1.5ex}\vspace{-1.5ex}
%\begin{tabular}{l @{:} p{2ex} p{35ex} c r}
%Tandatangan & & \ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots
%  & Tarikh : & \ldots\ldots\ldots\ldots \\
%Nama        & & \ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots\ldots \\
%\end{tabular}
}



% ========================================
%         [P6] Author Declaration
% ----------------------------------------

% +++++++++++++++++++++
% Externalized string  - Author Declaration
% +++++++++++++++++++++
% -- English
\newcommand{\declaration@statement@en}{%
	I declare that this \@degreetype\space entitled   	
	\ifx\@titlethree\@empty
		\ifx\@titletwo\@empty
    		\emph{``\@title''}\space 		
		\else
			\emph{``\@title}\space\emph{\@titletwo''}\space  
    	\fi
	\else
		\emph{``\@title}\space\emph{\@titletwo}\space\emph{\@titlethree''}\space 
	\fi
	is the result of my own research except as cited in the references. The \@degreetype\space has not been accepted for any degree and is not concurrently submitted in candidature of any other degree.}

% -- Malay
\newcommand{\declaration@statement@ms}{%
	Saya akui \@degreetype\space ini bertajuk 
	\ifx\@titlethree\@empty
		\ifx\@titletwo\@empty
    		\emph{``\@title''}\space 		
		\else
			\emph{``\@title}\space\emph{\@titletwo''}\space  
    	\fi
	\else
		\emph{``\@title}\space\emph{\@titletwo}\space\emph{\@titlethree''}\space 
	\fi
	adalah hasil kerja saya sendiri kecuali nukilan dan ringkasan yang tiap-tiap satunya telah saya jelaskan sumbernya.}
% --

\newcommand{\declaration@statement}{\getstring{declaration@statement}}


\newcommand{\declaration}{%
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \label{pre:declaration}
  %\addcontentsline{toc}{nonmainmatterchapter}{\normalfont\declarationname}
  %added
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\declarationname}{\normalfont}}
  \vspace*{\fill}
  \noindent\declaration@statement
  \par\noindent
  \vspace*{0cm}
  \begin{center}
    \begin{tabular}{l p{0.4in} @{:} p{0.3in} c}
      \signature@label & & & \\ \cline{4-4}
      \name@label & & & \@author \\ \cline{4-4}
      \date@label & & & \@date \\ \cline{4-4}
    \end{tabular}
  \end{center}
  \vspace{\fill}
}

% ========================================
%            [P7] Dedication
% ----------------------------------------
\newenvironment{dedication}{%
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \label{pre:dedication}
  %\addcontentsline{toc}{nonmainmatterchapter}{\normalfont\dedicationname}
  %added
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\dedicationname}{\normalfont}}
  \vspace*{\fill}
  \begin{center}
}{%
  \end{center}
  \vspace{\fill}
}

% ========================================
%         [P8] Acknowledgements
% ----------------------------------------
\newenvironment{acknowledgement}{%
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\acknowledgementname}
  \label{pre:acknowledgement}
  \@showpagenumber
  %added
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\acknowledgementname} \normalfont}
}

% ========================================
%            [P9] Abstract
% ----------------------------------------
\newenvironment{abstract}{%
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\abstractname}
  \label{pre:abstract}
  \@showpagenumber
  %added
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\abstractname}{\normalfont}}
}

% ========================================
%       [P10] Abstrak (Translated)
% ----------------------------------------
\newenvironment{abstrak}{%
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\abstractlocalname}
  \label{pre:abstrak}
  \@showpagenumber
  %added
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\abstractlocalname}{\normalfont}}
}

% +++++++++++++++++++++
% Externalized string  - TOC, List of Tables/Figures/Appendices
% +++++++++++++++++++++
% -- English
\newcommand{\chapter@colname@en}    {Chapter}
\newcommand{\tablenum@colname@en}   {Table No.}
\newcommand{\figurenum@colname@en}  {Figure No.}
\newcommand{\appendixnum@colname@en}{Appendix}
\newcommand{\algorithmnum@colname@en}{Algo. No.}
\newcommand{\toctitle@colname@en}   {Title}
\newcommand{\title@colname@en}      {Title}
\newcommand{\page@colname@en}       {Page}
% -- Malay
\newcommand{\chapter@colname@ms}    {Bab}
\newcommand{\tablenum@colname@ms}   {No. Jadual}
\newcommand{\figurenum@colname@ms}  {No. Rajah}
\newcommand{\appendixnum@colname@ms}{Lampiran}
\newcommand{\algorithmnum@colname@ms}{No. Algo.}
\newcommand{\toctitle@colname@ms}   {Perkara}
\newcommand{\title@colname@ms}      {Tajuk}
\newcommand{\page@colname@ms}       {Halaman}
% --
\newcommand{\chapter@colname}     {\getstring{chapter@colname}}
\newcommand{\tablenum@colname}    {\getstring{tablenum@colname}}
\newcommand{\figurenum@colname}   {\getstring{figurenum@colname}}
\newcommand{\appendixnum@colname} {\getstring{appendixnum@colname}}
\newcommand{\algorithmnum@colname} {\getstring{algorithmnum@colname}}
\newcommand{\title@colname}       {\getstring{title@colname}}
\newcommand{\toctitle@colname}    {\getstring{toctitle@colname}}
\newcommand{\page@colname}        {\getstring{page@colname}}

% ========================================
%       [P11] Table of Contents
% ----------------------------------------

% Copied from book.cls:
%   \tableofcontents  - to generate 'Table of Contents' page
%
\renewcommand{\tableofcontents}{%
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\contentsname}
  \label{pre:tableofcontents}

  %Add Page Number
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\contentsname}{\normalfont}}  
  \@showpagenumber
  
  \begingroup
    \setlength{\parindent}{0pt}
    	\begin{flushleft}	%Added by Vishnu for proper flushleft and realign
		\bfseries\MakeUppercase{\chapter@colname}\vspace*{-\toc@tab@jumps}
    \end{flushleft}
    \begin{center}		%Added by Vishnu for proper centering and realign
		\bfseries\MakeUppercase{\toctitle@colname}\vspace*{-\toc@tab@jumps}
    \end{center}
    \begin{flushright}	%Added by Vishnu for proper flushright  and realign
		\bfseries\MakeUppercase{\page@colname}
		\linebreak
    \end{flushright}
  \endgroup
  %\setstretch{1.435}
  \setstretch{1.435}
  \@starttoc{toc}
}

% ========================================
%       [P12] List of Tables
% ----------------------------------------

% Copied from book.cls:
%   \listoftables  - to generate 'List of Tables' page
%
\renewcommand{\listoftables}{
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\listtablename}
  \label{pre:listoftables}
  
  %Add Page Number
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\listtablename}{\normalfont}}
  \@showpagenumber
  
  \begingroup
    \setlength{\parindent}{0pt}
	\begin{flushleft}	%Added by Vishnu for proper flushleft and realign
		\bfseries\MakeUppercase{\tablenum@colname}\vspace*{-\toc@tab@jumps}
    \end{flushleft}
    \begin{center}		%Added by Vishnu for proper centering and realign
		\bfseries\MakeUppercase{\title@colname}\vspace*{-\toc@tab@jumps}
    \end{center}
    \begin{flushright}	%Added by Vishnu for proper flushright  and realign
		\bfseries\MakeUppercase{\page@colname}
		\linebreak
    \end{flushright}
  \endgroup
  %\setstretch{1.435}
  \setstretch{1.435}
  \@starttoc{lot}
}

% ========================================
%         [P13] List of Figures
% ----------------------------------------

% Copied from book.cls:
%   \listoffigures  - to generate 'List of Figures' page
%
\renewcommand{\listoffigures}{
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\listfigurename}
  \label{pre:listoffigures}
  
  %Add Page Number
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\listfigurename}{\normalfont}}
  \@showpagenumber
  
  \begingroup
    \setlength{\parindent}{0pt}
    	\begin{flushleft}	%Added by Vishnu for proper flushleft and realign
		\bfseries\MakeUppercase{\figurenum@colname}\vspace*{-\toc@tab@jumps}
    \end{flushleft}
    \begin{center}		%Added by Vishnu for proper centering and realign
		\bfseries\MakeUppercase{\title@colname}\vspace*{-\toc@tab@jumps}
    \end{center}
    \begin{flushright}	%Added by Vishnu for proper flushright and realign
		\bfseries\MakeUppercase{\page@colname}
		\linebreak
    \end{flushright}
  \endgroup
  %\setstretch{1.435}
  \setstretch{1.435}
  \@starttoc{lof}
}

% Optional support for 'acronym' package to generate
% List of Symbols, and List of Abbreviation.
%
% User may choose to use the existing \addabbre and \addsymbol
% commands to generate the list, or, may switch to 'acronym'
% package by adding \usepackage{acronym} in preamble.
%
\AtBeginDocument{
  \@ifpackageloaded{acronym}{
    \newlength{\minlabelwidth}%
    % Customize label format
    \def\bflabel#1{\textrm{#1}\hfill --}
    % Set minimal label width
    \setlength{\minlabelwidth}{.2\textwidth}%
    % Set fixed blank width after label
    \setlength{\labelsep}{2em}%

    % Copied from acronym.sty
    %
    \renewenvironment{AC@deflist}[1]%
    {\ifAC@nolist%
       \else%
         \raggedright\begin{list}{}%
           {\settowidth{\labelwidth}{\textrm{#1} --}% based on \bflabel
            \ifdim \labelwidth <\minlabelwidth% enforce min label width
              \setlength{\labelwidth}{\minlabelwidth}%
            \fi
            \setlength{\leftmargin}{\labelwidth}%
            \addtolength{\leftmargin}{\labelsep}%
            \renewcommand{\makelabel}{\bflabel}}%
       \fi}%
    {\ifAC@nolist%
     \else%
       \end{list}%
     \fi}
  }{}
}

% ========================================
%       [P13] List of Symbols
% ----------------------------------------
%  Adapted from losymbol.sty by Gerry Van Dooren
%
\newcommand\listofsymbols{
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\listsymbolname}
  \label{pre:listofsymbols}

  %Add Page Number
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\listsymbolname}{\normalfont}}  
  \@showpagenumber
  
  
  %\vspace{\@twolinespacing} %Removed by Vishnu, not neccesary.
  \setstretch{1.435}
  \@starttoc{los}
}

% New user command:
% ==============---------------------------------------------------============
%   \addsymbol - add an entry to \listofsymbols
%                e.g. \addsymbol{Symbol}{description}
% ==============---------------------------------------------------============
\newcommand{\addsymbol}[2]{%
\addtocontents{los}{\protect\makesymboltable{#1}{#2}}%
}

\newdimen\@lmsymbol %width of left margin column
\@lmsymbol=0.6em

\newdimen\@lcsymbol %width of left column
\@lcsymbol=8em

\newdimen\@rcsymbol %width of right column
\@rcsymbol=\textwidth

\newdimen\@scsymbol %width of space column
\@scsymbol=3em

\newdimen\@pcsymbol %width of page number column
\@pcsymbol=0em

\advance\@rcsymbol by -\@lmsymbol %subtract lmsymbol
\advance\@rcsymbol by -\@lcsymbol %subtract lcsymbol
\advance\@rcsymbol by -\@scsymbol %subtract space
\advance\@rcsymbol by -\@pcsymbol %subtract page number

\def\makesymboltable#1#2{%
\noindent\vspace{-0.3\baselineskip}\begin{minipage}[t]{\@lcsymbol}
\hspace{\@lmsymbol}#1
\end{minipage}
\begin{minipage}[t]{\@pcsymbol}-\end{minipage}
$\hspace{\@scsymbol}$
\begin{minipage}[t]{\@rcsymbol}#2\end{minipage}
}

% ========================================
%       [P14] List of Abbreviations
% ----------------------------------------
%  Adapted from losymbol.sty by Gerry Van Dooren
%
\newcommand\listofabbre{
  \if@openright\cleardoublepage\else\clearpage\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks
  \chapter*{\listabbrename}
  \label{pre:listofabbre}
  
  %Add Page Number
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\listabbrename}{\normalfont}}
  \@showpagenumber
  
  %\vspace{\@twolinespacing} %Removed by Vishnu, not neccesary.
  \setstretch{1.435}
  \@starttoc{loabbre}
}

% New user command:
% ==============---------------------------------------------------============
%   \addabbre - add an entry to \listofabbre
%                e.g. \addabbre{XML}{Extensible Markup Language}
% ==============---------------------------------------------------============
\newcommand{\addabbre}[2]{
  \addtocontents{loabbre}{\protect \makeabbretable{#1}{#2}}
}

\newdimen\@lmabbre %width of left margin column
\@lmabbre=0.6em

\newdimen\@lcabbre %width of left column
\@lcabbre=8em

\newdimen\@rcabbre %width of right column
\@rcabbre=\textwidth

\newdimen\@scabbre %width of space column
\@scabbre=3em

\newdimen\@pcabbre %width of page number column
\@pcabbre=0em

\advance\@rcabbre by -\@lmabbre %subtract lmabbre
\advance\@rcabbre by -\@lcabbre %subtract lcabbre
\advance\@rcabbre by -\@scabbre %subtract space
\advance\@rcabbre by -\@pcabbre %subtract page number

\def\makeabbretable#1#2{%
\noindent\vspace{-0.3\baselineskip}\begin{minipage}[t]{\@lcabbre}
\hspace{\@lmabbre}#1
\end{minipage}
\begin{minipage}[t]{\@pcabbre}-\end{minipage}
$\hspace{\@scabbre}$
\begin{minipage}[t]{\@rcabbre}#2\end{minipage}
}


% ========================================
%       [P15] List of Appendices
% ----------------------------------------
\newcommand{\listofappendices}{
  \chapter*{\listappendixname}
  \label{pre:listofappendices}
  
  \setstretch{1.435} %List of Symbols and Abbreviations were singlespacing, so reset it here
  
  %Add Page Number
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\listappendixname}{\normalfont}}
  \@showpagenumber
  
  \begingroup
    \setlength{\parindent}{0pt}
	\begin{flushleft}	%Added by Vishnu for proper flushleft and realign
		\bfseries\MakeUppercase{\appendixnum@colname}\vspace*{-\toc@tab@jumps}
    \end{flushleft}
    \begin{center}		%Added by Vishnu for proper centering and realign
		\bfseries\MakeUppercase{\title@colname}\vspace*{-\toc@tab@jumps}
    \end{center}
    \begin{flushright}	%Added by Vishnu for proper flushright and realign
		\bfseries\MakeUppercase{\page@colname}
		\linebreak
    \end{flushright}
  \endgroup
  \setstretch{1.435}
  \@starttoc{loapp}
}

% ========================================
%       [P16] List of Algorithms (optional), added by Nadzir
% ----------------------------------------
\renewcommand{\listofalgorithms}{
  \chapter*{\listalgorithmname}
  \label{pre:listofalgorithm}
  
  %Add Page Number  
  \addcontentsline{toc}{section}{\MakeUppercase{\bf\listalgorithmname}{\normalfont}}
  \@showpagenumber
  
  \begingroup
    \setlength{\parindent}{0pt}
	\begin{flushleft}	%Added by Vishnu for proper flushleft and realign
		\bfseries\MakeUppercase{\algorithmnum@colname}\vspace*{-\toc@tab@jumps}
    \end{flushleft}
    \begin{center}		%Added by Vishnu for proper centering and realign
		\bfseries\MakeUppercase{\title@colname}\vspace*{-\toc@tab@jumps}
    \end{center}
    \begin{flushright}	%Added by Vishnu for proper flushright and realign
		\bfseries\MakeUppercase{\page@colname}
		\linebreak
    \end{flushright}
  \endgroup
  \setstretch{1.435}
  \@starttoc{loa}
}


% ========================================
%           [P17] References
% ----------------------------------------

% Custom heading section for References page
\newcommand\utmthesis@bibheading{
  \if@openright\cleardoublepage\@hidepagenumber\else\clearpage\@hidepagenumber\fi %yap% [v4.1] added for hyperref bookmarks
  \phantomsection %yap% [v4.1] added for hyperref bookmarks

  \chapter*{\bibname}%
  %\@showpagenumber%  restore page number display
  \@hidepagenumber
  \label{pre:references}
  % add to TOC
  \addtocontents{toc}{\protect\addvspace{\@twolinespacing}}
  %added
  %\addcontentsline{toc}{section}{\hspace{-3\toc@sep@chap}\protect\normalsize\bfseries\MakeUppercase{\bibname} \normalfont}% Use this line instead if the reference page number in the ToC should not be bold
  \addcontentsline{toc}{chapter}{\hspace{-\toc@sep@chap}\protect\normalsize\MakeUppercase{\bibname} \normalfont}
}

% Copied from book.cls:
%   thebibliography environment
%
\renewenvironment{thebibliography}[1]
     {\utmthesis@bibheading
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m%
    }
    {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
     \endlist}

\AtBeginDocument{
  % As natbib package redefines \thebibliography environemnt,
  % when it is loaded,we need to inject the custom heading section back into it
  % through natbib's \bibsection.
  %
  \@ifpackageloaded{natbib}{
    \renewcommand\bibsection{\utmthesis@bibheading}
  }{}
}

% For bibliography default (number) scheme, each bibliography item is
% numbered with "#n." where #n is 1, 2, 3 and so on.
\renewcommand\@biblabel[1]{#1.}

% ========================================
%          [P18] Appendices
% ----------------------------------------

% Copied from book.cls:
%   \appendix  - to indicate the start of appendix section
%
\renewcommand{\appendix}{%
  \@appendixtrue
  \settocdepth{chapter}
  \pagebreak%  force a page break, so that TOC will show a correct page number
  \settocdepth{chapter}
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  %\setcounter{tocdepth}{0}
  \gdef\@chapapp{\MakeUppercase{\appendixname}}%
  \gdef\thechapter{\@Alph\c@chapter}
  \phantomsection
  \label{apppg1}
  %  add to TOC
  %\phantomsection
  %\addtocontents{toc}{\protect\addvspace{\@twolinespacing}}
  %\addcontentsline{toc}{nonmainmatterchapter}{\appendicesname}
  %added
  %\addtocontents{toc}{\protect\addvspace{\@twolinespacing}}
  \addtocontents{toc}{\protect\vspace{\@twolinespacing}}
  %\addtocontents{toc}{\protect\noindent\MakeUppercase{\bf\appendicesname}}
  %\addtocontents{toc}{\protect\addvspace{\@twolinespacing}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experimental commands

\newcommand{\mayinclude}[1]{%
  \IfFileExists{#1}{\include{#1}}{%
     \@latex@info{\@classname: Optional file not found: `#1.tex'}}
}
\newcommand{\mustinclude}[1]{%
  \IfFileExists{#1}{\include{#1}}{%
     \@latex@warning{\@classname: Required file not found: `#1.tex'}}
}

\newcommand\preliminary[1][.]{%
  \coverpage
  \superpage
  \certification
  \frontmatter
  \maketitle
  \declaration
  \mayinclude{#1/dedication}
  \mayinclude{#1/acknowledgement}
  \mustinclude{#1/\abstract@filename}
  \mustinclude{#1/\abstract@translated@filename}
  \tableofcontents
  \listoftables
  \listoffigures
  \mayinclude{#1/abbreviations}
  \mayinclude{#1/symbols}
  \mayinclude{#1/listofappendices}
}

\def \endmatter{
	\par\vspace{-2ex}
	\@appendixtoctrue
    \if\thechapter A
        \addtocontents{toc}{\vspace{-0.8cm}\protect\contentsline{chapter}{\hspace {-\toc@sep@chap }\normalfont\appendixname~A} {\normalfont\pageref{apppg1}}{chapter.6}} %edited by HuiRu
    \else
        \addtocontents{toc}{\vspace{-0.8cm}\protect\contentsline{chapter}{\hspace {-\toc@sep@chap }\normalfont\appendicesname~A~--~\thechapter   }{\normalfont\pageref{apppg1}~--~\pageref{applastpage}}{chapter.6}} %edited by HuiRu
    \fi
    \settocdepth{subsection}
}


%making box to align section head left indent
\makeatletter
\def\@seccntformat#1{\protect\makebox[0.5in][l]{\csname
the#1\endcsname\quad}}
\makeatother
\setstretch{1.435}

   

