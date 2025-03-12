%{
#include <stdio.h>
%}

%%
[0-9]+  { printf("Número entero reconocido: %s\n", yytext); }
.       { /* Ignorar cualquier otro carácter */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}