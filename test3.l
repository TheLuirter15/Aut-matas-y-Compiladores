%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]*  { printf("Identificador reconocido: %s\n", yytext); }
.       { /* Ignorar cualquier otro carácter */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}