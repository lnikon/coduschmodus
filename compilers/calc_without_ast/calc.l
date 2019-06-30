%{
#include "calc.tab.h"
%}

%%
"+" 	{return ADD;}
"-" 	{return SUB;}
"*" 	{return MUL;}
"/" 	{return DIV;}
"|" 	{return ABS;}
"\n" 	{return EOL;}
[ \t] 	{}
[0-9]+ 	{yylval = atoi(yytext); return NUMBER;}
. 	{printf("Unrecognized token\n"); return -1; }
%%




