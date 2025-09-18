%{
#include <stdio.h>
#include <string.h>

#define MAX_VARS 100
char *variaveis[MAX_VARS];
int var_count = 0;

void add_var(const char *name) {
    for (int i=0; i<var_count; i++) {
        if (strcmp(variaveis[i], name) == 0) return; 
    }
    variaveis[var_count++] = strdup(name);
}
%}

ID   [A-Za-z_][A-Za-z0-9_]*
WS   [ \t\r\n]+

%%

{WS}    ;   

{ID}    { 
            printf("ID(%s)\n", yytext);
            add_var(yytext);
        }

.       { printf("ERRO: caractere inválido %s\n", yytext); }

%%

int main() {
    yylex();
    printf("\nVariáveis encontradas:\n");
    for (int i=0; i<var_count; i++) {
        printf("- %s\n", variaveis[i]);
    }
    return 0;
}
