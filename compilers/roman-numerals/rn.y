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

%token ONE FIVE TEN

%%
nums:
   nums num
   |
   error
   ;

num:
   ONE
   |
   FIVE
   |
   TEN
   |
   error
   ;

