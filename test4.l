%{
#include <stdio.h>
%}

%%
[A-Z&Ñ]{3,4}[0-9]{6}[A-Z0-9]{3}  { printf("RFC reconocido: %s\n", yytext); }
.       { /* Ignorar cualquier otro carácter */ }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}