%{
#include <stdio.h>
%}

%%
[A-Z]{4}[0-9]{6}[HM][A-Z]{2}[A-Z]{3}[0-9A-Z]{2}  { printf("CURP reconocido: %s\n", yytext); }
.       { /* Ignorar cualquier otro carácter */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}