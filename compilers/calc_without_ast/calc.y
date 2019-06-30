
%{
#include <stdio.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

// rules
%%
calclist: /* nothing */
	| calclist exp EOL { printf("= %d\n", $2);}
	;
exp	: factor
	| exp ADD factor { $$ = $1 + $3;}
	| exp SUB factor { $$ = $1 - $3;}
	;
factor	: term
	| factor MUL term { $$ = $1 * $3;}
	| factor DIV term { $$ = $1 / $3;}
	;
term	: NUMBER
	| ABS term { $$ = $2 >= 0 ? $2 : -$2;}
	;

// code
%%
void yyerror(char* err)
{
	printf("%s\n", err);
	return;
}
int main()
{
	yyparse();
	
}

