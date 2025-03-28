%{
#include <stdio.h>
%}

%%

"//"[^\n]*    { printf("Comentario de una l�nea encontrado: %s\n", yytext); }

"/"(.|\n)?"*/"    { printf("Comentario de varias l�neas encontrado: %s\n", yytext); }

\"([^"\\]|\\.)*\"   { printf("Cadena de texto encontrada: %s\n", yytext); }

.|\n        ;

%%

int main(int argc, char **argv) {
    yylex();

    return 0;
}

int yywrap() {
    return 1;  // Indica el fin�de�la�entrada
}