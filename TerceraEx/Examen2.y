%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUM
%token MUL

%%
input:
    expr '\n' { printf("Expresi�n v�lida.\n"); return 0; }
  | expr      { printf("Expresi�n v�lida.\n"); return 0; }
  ;

expr:
    NUM MUL NUM
  ;
%%

int main() {
    yyparse();
    return 0;
}

int yyerror(char *s) {
    return 1;
}