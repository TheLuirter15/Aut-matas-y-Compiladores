%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.edu\.mx  { printf("Email institucional reconocido: %s\n", yytext); }
.       { /* Ignorar cualquier otro carácter */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}