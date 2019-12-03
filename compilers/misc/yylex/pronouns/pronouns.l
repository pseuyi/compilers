%{
#include <stdio.h>
int x = 0;
int y = 0;
int z = 0;
%}

%%
she         {x++;}
he          {y++;}
they        {z++;}

\n          {
             printf("%i of her \n", x); x = 0;
             printf("%i of him \n", y); y = 0;
             printf("%i of them \n", z); z = 0;
            }           
%%
