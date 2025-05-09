%{
#include <stdio.h>
#include <ctype.h>  // Para usar la funci�n tolower()
%}

%%

[a-zA-Z]   { putchar(tolower(yytext[0])); }  // Convierte cualquier letra a min�scula
.          { putchar(yytext[0]); }           // Mantiene otros caracteres (espacios, n�meros, etc.)

%%

int main(int argc, char **argv) {
    yylex();

    return 0;
}

int yywrap() {
    return 1;  // Indica el fin�de�la�entrada
}