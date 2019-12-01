%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%%
I           return ONE;
V           return FIVE;
X           return TEN;
%%

