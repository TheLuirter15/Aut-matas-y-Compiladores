%option noyywrap
%{
#include <stdio.h>
%}

%%

analizar|diferenciar|discriminar|distinguir|examinar|experimentar|investigar|organizar|comparar|contrastar|detectar|diagnosticar|identificar|integrar|relacionar|separar {
    printf("Verbo de la taxonomía de Bloom (analizar): %s\n", yytext);
}

bueno|excelente|maravilloso|fantástico|increíble|positivo|agradable|amable|simpático|inteligente|creativo|eficiente|eficaz|brillante|genial {
    printf("Adjetivo calificativo positivo: %s\n", yytext);
}

y|o|pero|aunque|porque|si|como|que|cuando|mientras|ni|sino|mas|e|u {
    printf("Conjunción: %s\n", yytext);
}

a|ante|bajo|cabe|con|contra|de|desde|en|entre|hacia|hasta|para|por|según|sin|so|sobre|tras|durante|mediante|versus|vía {
    printf("Preposición: %s\n", yytext);
}

yo|tú|él|ella|ello|nosotros|vosotros|ellos|ellas|mí|ti|sí|nos|os|se|me|te|le|nos|os|les|mi|tu|su|nuestro|vuestro|su|mío|tuyo|suyo|nuestro|vuestro|suyo {
    printf("Pronombre: %s\n", yytext);
}

[ \t\n]+ ;

. {
    printf("Carácter no reconocido: %s\n", yytext);
}

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}