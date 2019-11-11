%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+                  yylval=atoi(yytext); return INT;
.                       return (int) yytext[0];
[ \t]+                  /* ignore whitespace */;
%%
