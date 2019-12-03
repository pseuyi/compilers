%{
#include <stdio.h>
%}

%%
\[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\      printf("email\n");
test                                           printf("test command received\n");
\cZ                                            printf("ctrl z\n");
%%
