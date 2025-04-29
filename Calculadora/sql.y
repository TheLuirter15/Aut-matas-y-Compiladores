%{
#include <stdio.h>
#include <string.h>
#include "struct.h"
int yylex();
int yyerror(char *s);
symbtbl *ptr;
%}

%union {
    struct {
        int numerorighe;
        symbtbl *Mystr;
    };
}

%token <numerorighe> NL
%token <Mystr> IDENTIFIER CONST
%token SELECT FROM WHERE AND OR
%token DELETE INSERT INTO VALUES
%token NEQ LEQ GEQ LT GT EQ
%token '*' ',' '(' ')'

%type <Mystr> identifiers cond compare op values

%%

lines:
      line
    | lines line
    | lines error
    ;

line:
      select_stmt NL    { /* manejar SELECT */ }
    | insert_stmt NL    { /* manejar INSERT */ }
    | delete_stmt NL    { /* manejar DELETE */ }
    ;

select_stmt:
      SELECT identifiers FROM identifiers WHERE cond
    ;

insert_stmt:
      INSERT INTO identifiers VALUES '(' values ')'
    ;

delete_stmt:
      DELETE FROM identifiers WHERE cond
    ;

values:
      CONST
    | CONST ',' values
    ;

identifiers:
      '*'
    | IDENTIFIER
    | IDENTIFIER ',' identifiers
    ;

cond:
      IDENTIFIER op compare
    | IDENTIFIER op compare conn cond
    ;

compare:
      IDENTIFIER
    | CONST
    ;

op:
      LT
    | GT
    | EQ
    | NEQ
    | LEQ
    | GEQ
    ;

conn:
      AND
    | OR
    ;

%%

int yyerror(char *s){
    printf(" --ERROR-- %s\n\n", s);
    return 0;
}

int main() {
    FILE* del;
    char filename[] = "results.txt";
    del = fopen(filename,"a");
    remove(filename);
    yyparse();
    return 0;
}
