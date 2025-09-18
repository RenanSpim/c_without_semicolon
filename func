%option noyywrap yylineno
%{
#include <stdio.h>
%}

ID      [A-Za-z_][A-Za-z0-9_]*
WS      [ \t\r\n]+

%%

{WS}            ;   
"("             { return LPAREN; }
")"             { return RPAREN; }
{ID}            {
                   
                   if (yyinput() == '(') {
                       unput('('); 
                       printf("FUNC(%s)\n", yytext);
                   } else {
                       printf("ID(%s)\n", yytext);
                   }
                }
.               { printf("ERRO: caractere inválido %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
