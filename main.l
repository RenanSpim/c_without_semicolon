%option noyywrap yylineno
%{
#include <stdio.h>
void print(char*);
%}

NUM [0-9]+
ID ([A-z]|_)([A-z0-9]|_)*
STRING \".*\"
CHAR \'.\'
MATH_OPERATOR \+|-|\*|\/|\^|\=\=
SPECIAL_OPERATOR \=\=|>|<|\>=|\<=
SPECIAL_C #|\(|\)|\[|\]|\{|\}

%%
{NUM} {print("INT");}
{NUM}\.{NUM} {print("FLOAT");}
{STRING} {print("STRING");}
{CHAR} {print("CHAR");}
{MATH_OPERATOR} {print("MATH_OPERATOR");}
{ID} {print("NAME");}
{SPECIAL_OPERATOR} {print("SPECIAL_OPERATOR");}
{SPECIAL_C} {print("SPECIAL_CHAR");}

[ \t\r\n] {}

[A-z0-9_\-;\{\}\[\]\(\)] {printf("Lexical Error: Unexpected character '%s' on line %d\n", yytext, yylineno);}
%%

void print(char* token) {
    printf("%s\t=>\t%s\n", token, yytext);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            printf("Error opening file\n");
            return 1;
        }
        // Point flex to read from the file instead of stdin
        yyin = file;
    }
    yylex();
    return 0;
}