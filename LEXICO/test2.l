%{
#include <stdio.h>
%}

%%
[0-9]+(\.[0-9]+)?  { printf("N�mero decimal reconocido: %s\n", yytext); }
.       { /* Ignorar cualquier otro car�cter */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}