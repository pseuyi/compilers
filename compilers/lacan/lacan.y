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

%token SIGNIFIER SUBJECT DIVIDED_SUBJECT OTHER RELATION;
%left  '/' '$' '+';

%%

chains:
      chains chain

chain: 
      RELATION chain
      |
      chain '/' chain
      |
      chain '$' chain
      |
      chain '+' chain
      |
      unconscious
      ;

unconscious:
      SIGNIFIER subject

subject:
      SUBJECT
      |
      DIVIDED_SUBJECT
      |
      OTHER
      ;

