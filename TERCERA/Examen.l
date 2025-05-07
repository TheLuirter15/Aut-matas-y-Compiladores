%option noyywrap
%{
#include "y.tab.h"
%}

%%
[0-9]+     { yylval = atoi(yytext); return NUM; }
\*         { return MUL; }
[ \t\n]    ;
.          { return yytext[0]; } 
%%