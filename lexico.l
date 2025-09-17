%option noyywrap
%{
#include <stdio.h>
void print(char*);
%}

NUM [0-9]+
ID ([A-z]|_)([A-z0-9]|_)+
STRING \".*\"
CHAR \'.\'
OPERATOR \=|\+|-|\*|\/|\^|\=\=
SPECIAL_C #

%%
{NUM} {print("INT");}
{NUM}\.{NUM} {print("FLOAT");}
{STRING} {print("STRING");}
{CHAR} {print("CHAR");}
{OPERATOR} {print("MATH_OPERATOR");}
{ID} {print("VARIABLE");}
{SPECIAL_C} {print("SPECIAL_CHAR");}

[ \t\n]+ {}

[A-z0-9] {print("ERROR");}
%%

void print(char* token) {
    printf("%s\t=>\t%s\n", token, yytext);
}

int main(void) {
    yylex();
}