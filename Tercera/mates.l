%option noyywrap

%{
#include <stdio.h>

int lineas = 0;       
int palabras = 0;
int caracteres = 0;
int ni_palabras = 0;
int num_palabras = 0;
int B_to_palabras = 0;
int jo_palabras = 0;
int digitos = 0;
%}

%%
\n          { lineas++; caracteres++; }
[ \t]+      { caracteres += yyleng; }
[0-9]+      { palabras++; digitos++; caracteres += yyleng; }
"ni"[a-zA-Z]*     { palabras++; ni_palabras++; caracteres += yyleng; }
"num"[a-zA-Z]*    { palabras++; num_palabras++; caracteres += yyleng; }
"B"[a-zA-Z]*"to"  { palabras++; B_to_palabras++; caracteres += yyleng; }
[a-zA-Z]*"jo"     { palabras++; jo_palabras++; caracteres += yyleng; }
[a-zA-Z]+         { palabras++; caracteres += yyleng; }
.           { caracteres++; }
%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Error al abrir el archivo");
            return 1;
        }
    }
    
    yylex();
    
    if (argc > 1) fclose(yyin);
    
    printf("Estadísticas:\n");
    printf("Total de líneas: %d\n", lineas);
    printf("Total de palabras: %d\n", palabras);
    printf("Total de caracteres: %d\n", caracteres);
    printf("Palabras que comienzan con 'ni': %d\n", ni_palabras);
    printf("Palabras que comienzan con 'num': %d\n", num_palabras);
    printf("Palabras que comienzan con 'B' y terminan en 'to': %d\n", B_to_palabras);
    printf("Palabras que terminan en 'jo': %d\n", jo_palabras);
    printf("Dígitos contados como palabras: %d\n", digitos);
    
    return 0;
}
