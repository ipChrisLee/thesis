%-------------------------------------------------------------------------------
%                标识
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[Thesis document class of ipLee]

%-------------------------------------------------------------------------------
%                宏包
%-------------------------------------------------------------------------------
% thesis类是基于ctexbook文档类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[UTF8,fntef,fancyhdr,b5paper]{ctexbook}% 论文使用B5（JIS）纸，默认小四号字体
\zihao{-4}

% 装载宏包
\RequirePackage[bookmarksnumbered,pdfstartview=XYZ]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{ifthen}
\RequirePackage{geometry}

%-------------------------------------------------------------------------------
%                版面及标题格式
%-------------------------------------------------------------------------------
\geometry{top=2.0cm,bottom=2.5cm,left=2.3cm,right=2.3cm}

% 第一层次（章）题序和标题用小二号黑体字，题序和标题之间空两个字，不加标点，下同；
\CTEXsetup[format={\centering\zihao{-2}\heiti},nameformat={},titleformat={},aftername={\qquad},number=\arabic{chapter}]{chapter}
\CTEXsetup[beforeskip={-20pt},afterskip={20pt plus 2pt minus 2pt}]{chapter}
% 第二层次（节）题序和标题用小三号黑体字；
\CTEXsetup[format={\raggedright\zihao{-3}\heiti},aftername={\qquad}]{section}
% 第三层次（条）题序和标题用四号黑体字；
\CTEXsetup[format={\raggedright\zihao{4}\heiti},aftername={\qquad}]{subsection}
% 第四及以下层次（款）题序和标题用小四号黑体字；
\CTEXsetup[format={\raggedright\zihao{-4}\heiti},indent={2em},aftername={\qquad}]{subsubsection}

%-------------------------------------------------------------------------------
%                论文信息（题目、作者、导师等）
%-------------------------------------------------------------------------------
\newcommand{\ctitle}[1]{\def\@ctitle{#1}}
\newcommand{\etitle}[1]{\def\@etitle{#1}}
\newcommand{\studentid}[1]{\def\@studentid{#1}}
\newcommand{\school}[2]{
	\def\@school{#1}
	\def\@schoolshort{#2}
}
\newcommand{\major}[2]{
	\def\@major{#1}
	\def\@majorshort{#2}
}
\newcommand{\mentor}[1]{\def\@mentor{#1}}
\newcommand{\coverdate}[3]{\def\@coverdate{\dateprint{#1}{#2}{#3}}}


%-------------------------------------------------------------------------------
%                页眉设计
%-------------------------------------------------------------------------------
% 文武线
\renewcommand{\headrule}{
	\hrule width\headwidth height1.6pt \vspace{1.2pt}
	\hrule width\headwidth height0.4pt
}

% 自定义页眉和页脚
\newcommand{\thesispagestyle}[3]{
	\pagestyle{fancy}
	\fancyhf{}
	% \fancyhead[OL,ER]{\zihao{#1}\songti #2}
	% \fancyhead[OR,EL]{\zihao{#1}\songti #3}
	\fancyhead[L]{\zihao{#1}\songti #2}
	\fancyhead[R]{\zihao{#1}\songti #3}
	\fancyfoot[C]{\zihao{#1}\songti \thepage}
	\fancypagestyle{plain}{\pagestyle{fancy}}
}

%-------------------------------------------------------------------------------
%                封面设计
%-------------------------------------------------------------------------------
\newcommand{\clearpagebyprint}{\if@twoside\cleardoublepage\else\clearpage\fi}
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
\newcommand{\makecover}{
    \pagestyle{empty}
	\begin{titlepage}
		\begin{center}
			{
				\zihao{-0}
				% \includegraphics{figures/bjtu}\\[15pt]
				{\heiti\cover@thesis}
			}
			\vfill
			{
				\zihao{4}
				\linespread{2}\selectfont
				{\songti\cover@ctitle}
				\makebox[0pt][t]{
					\begin{minipage}[t]{18em}
						\centering\songti\@ctitle
					\end{minipage}
				}
				\parbox[t]{18em}{\fillinblank{18em}{} \\ \fillinblank{18em}{}}
				\\[2em]
                {\songti\cover@etitle}
				\makebox[0pt][t]{
					\begin{minipage}[t]{18em}
						\centering\songti\@etitle
					\end{minipage}
				}
				\parbox[t]{18em}{\fillinblank{18em}{} \\ \fillinblank{18em}{}}
			}
			\vfill
			{
				\zihao{4}
                \linespread{1.75}\selectfont
				\begin{tabular}{l@{\extracolsep{0.2em}}c}
					{\songti\cover@school}    & \fillinblank{10em}{\@school}
						\\
					{\songti\cover@major}     & \fillinblank{10em}{\@major}
						\\
					{\songti\cover@author}    & \fillinblank{10em}{\@author}
						\\
					{\songti\cover@studentid} & \fillinblank{10em}{\@studentid}
						\\
					{\songti\cover@mentor}    & \fillinblank{10em}{\@mentor}
				\end{tabular}
			}
			\vfill
			{
				\zihao{4}
				{\songti\@coverdate}
			}
		\end{center}
	\end{titlepage}
}

%-------------------------------------------------------------------------------
%                摘要
%-------------------------------------------------------------------------------
\newcommand{\baseabstract}[4]{
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}
    #3
    % \vfill
	\leftline{}
    \leftline{\zihao{-4}{#2:}#4}
}

% 中文摘要
\newcommand{\cabstract}[2]{
    \baseabstract{\other@cabstract}{\heiti\other@keywords}{#1}{#2}
}

% 英文摘要
\newcommand{\eabstract}[2]{
    \baseabstract{\bf Abstract}{\bf Key words}{#1}{#2}
}


%-------------------------------------------------------------------------------
%                加载配置文件
%-------------------------------------------------------------------------------
\AtEndOfClass{\input{thesis.cfg}}

\endinput

