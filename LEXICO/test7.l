%{
#include <stdio.h>
#include <ctype.h>  // Para usar la función tolower()
%}

%%

[a-zA-Z]   { putchar(tolower(yytext[0])); }  // Convierte cualquier letra a minúscula
.          { putchar(yytext[0]); }           // Mantiene otros caracteres (espacios, números, etc.)

%%

int main(int argc, char **argv) {
    yylex();

    return 0;
}

int yywrap() {
    return 1;  // Indica el fin de la entrada
}