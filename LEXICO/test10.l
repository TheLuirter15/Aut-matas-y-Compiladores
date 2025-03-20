%option noyywrap
%{
#include <stdio.h>
%}

%%

auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while {
    printf("Palabra reservada de C: %s\n", yytext);
}

[Ii]nt|[Ff]loat|[Dd]ouble|[Cc]har|[Vv]oid {
    printf("Tipo de dato: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Variable: %s\n", yytext);
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