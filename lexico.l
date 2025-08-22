%option noyywrap
%{
#include <stdio.h>
void print(char*);
%}

NUM [0-9]+
ID [A-z][A-z0-9 _]+
STRING \".\"
CHAR \'.\'
OPERATOR \=|\+|-|\*|\/|\^

%%
{NUM} {print("INT");}
{NUM}\.{NUM} {print("FLOAT");}
{STRING} {print("STRING");}
{CHAR} {print("CHAR");}
{OPERATOR} {print("MATH_OPERATOR")}

[ ]+ {}
. {print("ERROR");}
%%

void print(char* token) {
    printf("%s\t=>\t%s\n", token, yytext);
}

int main(void) {
    printf("Pressione CTRL+C para encerrar\n" );
    yylex();
}