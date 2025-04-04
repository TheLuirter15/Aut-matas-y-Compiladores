%{
#include <stdio.h>
#include <string.h>

// Lista de verbos de la categor�a Aplicaci�n
const char *verbos_aplicacion[] = {
    "aplicar", "usar", "ejecutar", "implementar", "resolver",
    "emplear", "practicar", "demostrar", "calcular", "completar"
};
int total_verbos = 10;  // N�mero total de verbos en la lista
int i;

int es_verbo_aplicacion(const char *palabra) {
    for (i = 0; i < total_verbos; i++) {
        if (strcmp(palabra, verbos_aplicacion[i]) == 0) {
            return 1;  // Es un verbo de aplicaci�n
        }
    }
    return 0;  // No es un verbo de aplicaci�n
}
%}

%%

[a-zA-Z]+   {
                // Convierte la palabra a min�scula para comparaci�n
                char palabra[100];
                strcpy(palabra, yytext);
                for (i = 0; palabra[i]; i++) {
                    palabra[i] = tolower(palabra[i]);
                }

                // Verifica si la palabra es un verbo de aplicaci�n
                if (es_verbo_aplicacion(palabra)) {
                printf("Verbo de aplicaci�n encontrado: %s\n", yytext);
                }
            }

.|\n        ;  // Ignorar otros caracteres y saltos de l�nea

%%

int main(int argc, char **argv) {

    // Llama al analizador l�xico
    yylex();

    return 0;

}

int yywrap() {
    return 1;  // Indica el fin�de�la�entrada
}