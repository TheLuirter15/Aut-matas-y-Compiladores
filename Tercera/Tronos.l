%option noyywrap

%{
#include <stdlib.h>


int westeros = 0;
int invernalia = 0;
int desembarco_rey = 0;
int nido_aguilas = 0;
int altojardin = 0;
int aguasdulces = 0;
int rocadragon = 0;
int roca_casterly = 0;
int bastion_tormentas = 0;
int dorne = 0;

int stark = 0;
int arryn = 0;
int tully = 0;
int greyjoy = 0;
int lannister = 0;
int tyrell = 0;
int martell = 0;
int baratheon = 0; 
int targaryen = 0;


int eddard = 0;
int catelyn = 0;
int arya = 0;
int sansa = 0;
int bran = 0;
int robb = 0;

int robert = 0;
int joffrey = 0;
int stannis = 0;

int daenerys = 0;
int aerys = 0;

int tywin = 0;
int jaime = 0;
int tyrion = 0;
int cersei = 0;

void mostrar_resultados();
%}

%option noyywrap

%% 


[Ww]esteros          { westeros++; }
[Ii]nvernalia        { invernalia++; }
[Dd]esembarco[Rr]ey  { desembarco_rey++; }
[Nn]ido[Aa]guilas    { nido_aguilas++; }
[Aa]ltojard[ií]n     { altojardin++; }
[Aa]guasdulces       { aguasdulces++; }
[Rr]ocadrag[oó]n     { rocadragon++; }
[Rr]oca[Cc]asterly   { roca_casterly++; }
[Bb]asti[oó]n[Tt]ormentas { bastion_tormentas++; }
[Dd]orne             { dorne++; }


[Ss]tark             { stark++; }
[Aa]rryn             { arryn++; }
[Tt]ully             { tully++; }
[Gg]reyjoy           { greyjoy++; }
[Ll]annister         { lannister++; }
[Tt]yrell            { tyrell++; }
[Mm]artell           { martell++; }
[Bb]aratheon         { baratheon++; }
[Tt]argaryen         { targaryen++; }



[Ee]ddard            { eddard++; }
[Cc]atelyn           { catelyn++; }
[Aa]rya              { arya++; }
[Ss]ansa             { sansa++; }
[Bb]ran              { bran++; }
[Rr]obb              { robb++; }

[Rr]obert            { robert++; }
[Jj]offrey           { joffrey++; }
[Ss]tannis           { stannis++; }

[Dd]aenerys          { daenerys++; }
[Aa]erys             { aerys++; }

[Tt]ywin             { tywin++; }
[Jj]aime             { jaime++; }
[Tt]yrion            { tyrion++; }
[Cc]ersei            { cersei++; }

.|\n                 ; 

%%

int main(int argc, char **argv) {
    if(argc > 1) {
        FILE *archivo = fopen(argv[1], "r");
        if(!archivo) {
            perror("Error lectura archivo");
            return 1;
        }
        yyin = archivo;
    }
    
    yylex();
    mostrar_resultados();
    
    if(argc > 1)
        fclose(yyin);
    
    return 0;
}

void mostrar_resultados() {
    printf("\n=== ANALISIS JUEGO DE TRONOS ===\n");
    
    printf("\nLUGARES:\n");
    printf("Westeros: %d\n", westeros);
    printf("Invernalia: %d\n", invernalia);
    printf("Desembarco del Rey: %d\n", desembarco_rey);
    printf("Nido de Aguilas: %d\n", nido_aguilas);
    printf("Altojardin: %d\n", altojardin);
    printf("Aguasdulces: %d\n", aguasdulces);
    printf("Rocadragon: %d\n", rocadragon);
    printf("Roca Casterly: %d\n", roca_casterly);
    printf("Bastion de Tormentas: %d\n", bastion_tormentas);
    printf("Dorne: %d\n", dorne);
    
    printf("\nCASAS:\n");
    printf("Stark: %d\n", stark);
    printf("Arryn: %d\n", arryn);
    printf("Tully: %d\n", tully);
    printf("Greyjoy: %d\n", greyjoy);
    printf("Lannister: %d\n", lannister);
    printf("Tyrell: %d\n", tyrell);
    printf("Martell: %d\n", martell);
    printf("Baratheon: %d\n", baratheon);
    printf("Targaryen: %d\n", targaryen);
    
    printf("\nPERSONAJES:\n");
    printf("\nCasa Stark:\n");
    printf("Eddard: %d\n", eddard);
    printf("Catelyn: %d\n", catelyn);
    printf("Arya: %d\n", arya);
    printf("Sansa: %d\n", sansa);
    printf("Bran: %d\n", bran);
    printf("Robb: %d\n", robb);
    
    printf("\nCasa Baratheon:\n");
    printf("Robert: %d\n", robert);
    printf("Joffrey: %d\n", joffrey);
    printf("Stannis: %d\n", stannis);
    
    printf("\nCasa Targaryen:\n");
    printf("Daenerys: %d\n", daenerys);
    printf("Aerys: %d\n", aerys);
    
    printf("\nCasa Lannister:\n");
    printf("Tywin: %d\n", tywin);
    printf("Jaime: %d\n", jaime);
    printf("Tyrion: %d\n", tyrion);
    printf("Cersei: %d\n", cersei);
}
