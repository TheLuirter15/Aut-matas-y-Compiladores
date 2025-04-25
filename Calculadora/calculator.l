/* SECCION DE DECLARACIONES */
%{
	#include <stdio.h>
	#include "calculadora.tab.h"
	extern YYSTYPE yylval;
	int yyerror(char *s);
%}

/* SECCION DE REGLAS */
%%
[0-9]+ { yylval.num = atoi(yytext); return NUMBER; }
"+"    { return PLUS; }
"-"    { return MINUS; }
"*"    { return TIMES; }
"/"    { return DIVIDE; }
\n     { return EOL; }
[ \t\f\v] {}       // Ignora espacios en blanco
.      { return *yytext; }
%%

int yywrap(void) {
	return 1;
}

/* MENSAJE DE ERROR */
int yyerror(char* s){
	fprintf(stderr, "Error de Sintaxis! - %s\n", s);
	return 0;
}
