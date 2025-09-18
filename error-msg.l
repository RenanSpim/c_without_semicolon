%option noyywrap yylineno
%{
#include <stdio.h>
#include <stdlib.h>   // para exit()
%}

DIGIT   [0-9]
ID      [A-Za-z_][A-Za-z0-9_]*
WS      [ \t\r\n]+

%%

{WS}                ;   /* ignora espaços e quebras de linha */
{DIGIT}+            { printf("NUMBER(%s)\n", yytext); }
{ID}                { printf("ID(%s)\n", yytext); }

"+"                 { printf("PLUS\n"); }
"-"                 { printf("MINUS\n"); }
"="                 { printf("ASSIGN\n"); }
";"                 { printf("SEMI\n"); }

                   { 
                        fprintf(stderr, 
                                "Erro léxico: caractere inválido '%s' na linha %d\n", 
                                yytext, yylineno);

                        /* Opção 1: apenas avisar e continuar */
                        /* return ERROR; */

                        /* Opção 2: parar o compilador imediatamente */
                        exit(EXIT_FAILURE);
                    }

%%

int main() {
    yylex();
    return 0;
}
