%option noyywrap
%{
#include <stdio.h>
%}

%%

analizar|diferenciar|discriminar|distinguir|examinar|experimentar|investigar|organizar|comparar|contrastar|detectar|diagnosticar|identificar|integrar|relacionar|separar {
    printf("Verbo de la taxonom�a de Bloom (analizar): %s\n", yytext);
}

bueno|excelente|maravilloso|fant�stico|incre�ble|positivo|agradable|amable|simp�tico|inteligente|creativo|eficiente|eficaz|brillante|genial {
    printf("Adjetivo calificativo positivo: %s\n", yytext);
}

y|o|pero|aunque|porque|si|como|que|cuando|mientras|ni|sino|mas|e|u {
    printf("Conjunci�n: %s\n", yytext);
}

a|ante|bajo|cabe|con|contra|de|desde|en|entre|hacia|hasta|para|por|seg�n|sin|so|sobre|tras|durante|mediante|versus|v�a {
    printf("Preposici�n: %s\n", yytext);
}

yo|t�|�l|ella|ello|nosotros|vosotros|ellos|ellas|m�|ti|s�|nos|os|se|me|te|le|nos|os|les|mi|tu|su|nuestro|vuestro|su|m�o|tuyo|suyo|nuestro|vuestro|suyo {
    printf("Pronombre: %s\n", yytext);
}

[ \t\n]+ ;

. {
    printf("Car�cter no reconocido: %s\n", yytext);
}

%%

int main(int argc, char **argv) {
    yylex();
    return 0;
}