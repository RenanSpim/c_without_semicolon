%option noyywrap yylineno
%{
#include <stdio.h>
#include "bibi.tab.h"
void print(char*);
%}

NUM -?[0-9]+
ID ([A-z]|_)([A-z0-9]|_)*
STRING \".*\"
CHAR \'.\'
COMMENT \/\*.*\*\/
SPECIAL_OPERATOR \=\=|>|<|\>=|\<=|\&\&|\|\||=

%%

"int"      { return KEYWORD_INT; }
"float"    { return KEYWORD_FLOAT; }
"char"     { return KEYWORD_CHAR; }
"string"   { return KEYWORD_STRING; }
"void"     { return KEYWORD_VOID; }
"if"       { return KEYWORD_IF; }
"else"     { return KEYWORD_ELSE; }
"for"      { return KEYWORD_FOR; }
"break"    { return KEYWORD_BREAK; }
"continue" { return KEYWORD_CONTINUE; }
"while"    { return KEYWORD_WHILE; }
"return"   { return KEYWORD_RETURN; }

"+"        { return KEYWORD_PLUS; }
"-"        { return KEYWORD_MINUS; }
"*"        { return KEYWORD_MULT; }
"/"        { return KEYWORD_DIV; }
"**"       { return KEYWORD_SQUARE; }

"("        { return KEYWORD_OPEN_P; }
")"        { return KEYWORD_CLOSE_P; }
"{"        { return KEYWORD_OPEN_CB; }
"}"        { return KEYWORD_CLOSE_CB; }
"["        { return KEYWORD_OPEN_B; }
"]"        { return KEYWORD_CLOSE_B; }

"="        { return KEYWORD_ASSIGN; }
"=="       { return KEYWORD_EQUALS; }
"!="       { return KEYWORD_DIFFERENT; }
">"        { return KEYWORD_GREATER; }
">="       { return KEYWORD_GREATER_EQ; }
"<"        { return KEYWORD_SMALLER; }
"<="       { return KEYWORD_SMALLER_EQ; }

"&&"       { return KEYWORD_AND; }
"||"       { return KEYWORD_OR; }

"#"        { return KEYWORD_HASHTAG; }

{COMMENT} {}
{NUM} { yylval.ival = atoi(yytext); return NUM; }
{NUM}\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; }
{STRING} { yylval.string = strdup(yytext); return STRING; }
{CHAR} { yylval.string = strdup(yytext); return CHAR; }
{ID} { yylval.string = strdup(yytext); return ID; }

[ \t\r\n] {}

[A-z0-9_;\{\}\[\]\(\)\|\&$%@|"|'|!|~|`|?] {printf("Lexical Error: Unexpected character '%s' on line %d\n", yytext, yylineno);}
%%

void print(char* token) {
    printf("(%d) %s\t=>\t%s\n", yylineno, token, yytext);
}
