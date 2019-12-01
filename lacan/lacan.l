%{
#include <stdio.h>
#include "y.tab.h"
%}

%%

S                          return SUBJECT;
\$                         return DIVIDED_SUBJECT;
[aA]                       return OTHER;
imagined|symbolic                  yylval=!strcmp(yytext,"imagined"); return RELATION;
[/\'/]+                    return PRIME;
.                          return (int) yytext[0];
[/*/]+                          return SIGNIFIER
[ \t]+                     /* ignore whitespace */;
%%

