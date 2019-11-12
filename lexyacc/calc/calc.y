%{
#include <stdio.h>
#include <string.h>

void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n",str);
}

int yywrap()
{
	return 1;
}

main()
{
	yyparse();
}

%}

%token <number> INT
%right '^'
%left '+' '-' '*' '/'

%%
E:  
   INT
   |
   E '^' E
   |
   E '*' E
   | 
   E '/' E 
   |
   E '+' E
   |
   E '-' E
   |
   error
   ;
