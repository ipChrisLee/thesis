# Thesis template of ipLee

ipLee自用的thesis类模板，fork并更改自[https://github.com/chenzewei01/bjtuThesis](https://github.com/chenzewei01/bjtuThesis)。

理论上可以用在BJTU的毕设论文，但是需要简单更改一些内容。

出于部分原因，我不想再维护一个BJTU毕设论文的LaTeX模板仓库，并且我认为这应该是BJTU的任务，不是任何同学的任务。

当然，我不反对任何人基于本仓库维护一个BJTU毕设论文的LaTeX模板或者做任何别的事，敬请自便。



# 模板结构

```
.
├── figures				%*	图片
│   └── bjtu.png
├── main.tex			%*	主tex文档
├── README.md			%	本文件
├── tex_ref				%	引用相关文件
│   ├── chinesebst.bst	%	引用格式
│   └── refs.bib		%*	引用列表
├── tex_src				%	文档源文件
│   ├── abstract_cn.tex	%*	中文摘要
│   ├── abstract_en.tex	%*	英文摘要
│   ├── chap01.tex		%*	第一章
│   ├── fun.tex			%	特殊函数
│   ├── info.tex		%*	信息
│   └── package.tex		%*	引入包
├── thesis.cfg			%	cfg
└── thesis.cls			%	cls
```

其中`*`的内容需要自行更改。



# 常见语法

## 表格

```latex
\begin{table}[htbp]
  \centering
  \caption{MIPS ISA定义的通用寄存器}
  \label{tab:mips_isa_gpr}
  \begin{tabular}{|l|c|l|}
    \headhline
    编号 & 寄存器名称 & 常见用途 \\ 
    \hline
    \$0 & \$zero & 常量0 \\
    \hline
    \$1 & \$at & 汇编程序中的保留寄存器 \\
    \hline
  \end{tabular}
\end{table}
```

其中`\caption`是标题，`\label`是用来cite的label，可以在文章中使用`\ref{}`来引用表格。



## 有序列表

```latex
\begin{enumerate}[]
  \item R型指令
  
  R型指令格式为\verb|op rd, rs, rt|。

  其中op表示操作码，rd表示目标寄存器，rs和rt表示源寄存器。这种指令格式的指令主要用于寄存器之间的操作，如加、减、与、或等。常见的R型指令包括：\verb|add, sub, and, or|。

  \item I型指令
  
  I型指令格式为\verb|op rt, rs, imm|。

  其中op表示操作码，rt表示目标寄存器，rs表示源寄存器，imm表示立即数。这种指令格式主要用于数据传输和算术逻辑运算等操作。常见的I型指令包括：\verb|addi, lw, sw, beq|。

  \item J型指令
  
  J型指令格式为\verb|op addr|。

  其中op表示操作码，addr表示跳转地址。这种指令格式主要用于跳转操作。常见的J型指令包括：\verb|j, jal|。
\end{enumerate}
```



## 无序列表

```latex
\begin{itemize}
  \item IF阶段：从存储中读取指令。
  \item ID阶段：对指令进行解码，确定操作数、操作数的值和操作类型。
  \item EX阶段：根据指令类型执行操作。
  \item WB阶段：根据ID阶段得到的目的寄存器信息、EX阶段得到的操作结果，更新目的寄存器的值。
\end{itemize}
```



## 代码块

```latex
\begin{lstlisting}[]
  beq $t1, $t2, label
  add $t3, $t1, $t2
  addi $t3, $t1, 1
  ...
label: 
  sub $t4, $t1, $t2
\end{lstlisting}

\begin{lstlisting}[language=Verilog]
import "DPI-C" function int abs_c(int a);
module fun_caller(
  input  [31:0] num,
  output [31:0] absNum
);
  assign absNum = abs_c(num);
endmodule
\end{lstlisting}
```



## 图片

png图片（jpg图片等同理）：

```latex
\begin{figure}[ht]\centering\includegraphics[width=\textwidth]{img_res/workflow_sim.drawio.png}\caption{仿真流程}\label{fig:workflow_sim}\end{figure}
```

svg图片：

```latex
\begin{figure}[!ht]\centering\includesvg[inkscapeformat=png,width=\textwidth]{img_res/simple_fsm_wave.svg}\caption{简单FSM对应波形图}\label{fig:wave_simple}\end{figure}
```

同理，`\caption`是标题，`\label`可以用于引用。



# TODO List

1. 将仓库改为GitHub模板仓库。
2. 增加引用文献的类型。


# Bug List

这里记录一些已知但还未修复的BUG：

1. 在引用列表（也就是`refs.bib`）文件中，不能使用`_`符号，必须使用`\_`代替。
