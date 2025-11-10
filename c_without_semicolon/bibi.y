%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    
    extern int yylex();
    extern FILE *yyin;
    extern int yylineno;
    int syntax_errors = 0;
    void yyerror(const char* s);
%}

%union {
    int ival;
    float fval;
    char* string;
}

%token <ival> NUM
%token <fval> FLOAT
%token <string> ID STRING CHAR

%token KEYWORD_INT KEYWORD_FLOAT KEYWORD_CHAR KEYWORD_STRING KEYWORD_VOID KEYWORD_IF KEYWORD_ELSE KEYWORD_FOR KEYWORD_BREAK KEYWORD_CONTINUE KEYWORD_WHILE KEYWORD_RETURN
%token KEYWORD_PLUS KEYWORD_MINUS KEYWORD_MULT KEYWORD_DIV KEYWORD_SQUARE
%token KEYWORD_OPEN_P KEYWORD_CLOSE_P KEYWORD_OPEN_CB KEYWORD_CLOSE_CB KEYWORD_OPEN_B KEYWORD_CLOSE_B
%token KEYWORD_ASSIGN KEYWORD_EQUALS KEYWORD_DIFFERENT KEYWORD_GREATER KEYWORD_GREATER_EQ KEYWORD_SMALLER KEYWORD_SMALLER_EQ
%token KEYWORD_AND KEYWORD_OR KEYWORD_HASHTAG
%token NEWLINE 
%token KEYWORD_COMMA

%left KEYWORD_EQUALS KEYWORD_DIFFERENT
%left KEYWORD_SMALLER KEYWORD_GREATER KEYWORD_SMALLER_EQ KEYWORD_GREATER_EQ
%left KEYWORD_PLUS KEYWORD_MINUS
%left KEYWORD_MULT KEYWORD_DIV
%right KEYWORD_ASSIGN

%type <string> program stmt_list stmt assignment_stmt expr term factor
%type <string> if_stmt while_stmt for_stmt
%type <string> return_stmt break_stmt continue_stmt
%type <string> block condition
%type <string> function_definition
%type <string> function_call_stmt
%type <string> declaration_or_function
%type <string> declaration_suffix
%type <string> optional_parameter_list
%type <string> parameter_list
%type <string> parameter
%type <string> optional_argument_list
%type <string> argument_list
%%

program:
    stmt_list                 { 
                                /* --- ALTERE AQUI --- */
                                if (syntax_errors == 0) {
                                    printf("\n=== ANÁLISE SINTÁTICA CONCLUÍDA COM SUCESSO ===\n"); 
                                    printf("Programa sintaticamente correto!\n");
                                }
                              }
    ;

stmt_list:
    stmt_list stmt              { }
    | stmt                      { }
    | /* vazio */               { }
    ;

stmt:
    assignment_stmt NEWLINE             { printf("Reconhecido: Atribuição\n"); }
    | if_stmt                   { printf("Reconhecido: Estrutura condicional (if)\n"); }
    | while_stmt                { printf("Reconhecido: Loop while\n"); }
    | for_stmt                  { printf("Reconhecido: Loop for\n"); }
    | return_stmt NEWLINE               { printf("Reconhecido: Comando return\n"); }
    | break_stmt NEWLINE                { printf("Reconhecido: Comando break\n"); }
    | continue_stmt NEWLINE             { printf("Reconhecido: Comando continue\n"); }
    | block                     { printf("Reconhecido: Bloco de comandos\n"); }
    | preprocessor_stmt NEWLINE   { printf("Reconhecido: Diretiva de pré-processador\n"); }
    | function_call_stmt NEWLINE  { printf("Reconhecido: Chamada de Função\n"); }
    | NEWLINE              
    | declaration_or_function    
    ;

block:
    KEYWORD_OPEN_CB stmt_list KEYWORD_CLOSE_CB     { }
    ;

assignment_stmt:
    ID KEYWORD_ASSIGN expr      { printf("  Atribuição: %s := expressão\n", $1); }
    ;

expr:
    expr KEYWORD_PLUS term      { printf("  Operação: +\n"); }
    | expr KEYWORD_MINUS term   { printf("  Operação: -\n"); }
    | term                      { }
    ;

term:
    term KEYWORD_MULT factor    { printf("  Operação: *\n"); }
    | term KEYWORD_DIV factor   { printf("  Operação: /\n"); }
    | factor                    { }
    ;

factor:
    KEYWORD_OPEN_P expr KEYWORD_CLOSE_P          { }
    | KEYWORD_OPEN_P condition KEYWORD_CLOSE_P   { printf("  Condição entre parênteses\n"); }
    | ID                        { printf("  Variável: %s\n", $1); }
    | NUM                       { printf("  Inteiro: %d\n", $1); }
    | FLOAT                     { printf("  Float: %f\n", $1); }
    | STRING                    { printf("  String: %s\n", $1); }
    ;

type_specifier:
    KEYWORD_INT
    | KEYWORD_FLOAT
    | KEYWORD_CHAR
    | KEYWORD_STRING
    | KEYWORD_VOID
    ;

preprocessor_stmt:
    KEYWORD_HASHTAG ID STRING
    ;


condition:
    expr KEYWORD_EQUALS expr    { printf("  Comparação: == (igual)\n"); }
    | expr KEYWORD_DIFFERENT expr { printf("  Comparação: != (diferente)\n"); }
    | expr KEYWORD_SMALLER expr { printf("  Comparação: < (menor)\n"); }
    | expr KEYWORD_GREATER expr { printf("  Comparação: > (maior)\n"); }
    | expr KEYWORD_SMALLER_EQ expr { printf("  Comparação: <= (menor ou igual)\n"); }
    | expr KEYWORD_GREATER_EQ expr { printf("  Comparação: >= (maior ou igual)\n"); }
    | KEYWORD_OPEN_P condition KEYWORD_CLOSE_P { }
    | condition KEYWORD_OR condition   { printf("  Operação Lógica: OU\n"); }
    | condition KEYWORD_AND condition  { printf("  Operação Lógica: E\n"); }
    ;

if_stmt:
    KEYWORD_IF KEYWORD_OPEN_P condition KEYWORD_CLOSE_P block
                                { printf("  Estrutura if simples\n"); }
    | KEYWORD_IF KEYWORD_OPEN_P condition KEYWORD_CLOSE_P block KEYWORD_ELSE block
                                { printf("  Estrutura if-else\n"); }
    ;

while_stmt:
    KEYWORD_WHILE KEYWORD_OPEN_P condition KEYWORD_CLOSE_P block
                                { printf("  Loop while completo\n"); }
    ;

for_stmt:
    KEYWORD_FOR KEYWORD_OPEN_P assignment_stmt condition assignment_stmt KEYWORD_CLOSE_P block
                                { printf("  Loop for completo\n"); }
    ;

return_stmt:
    KEYWORD_RETURN expr         { printf("  Return com expressão\n"); }
    | KEYWORD_RETURN            { printf("  Return vazio\n"); }
    ;

break_stmt:
    KEYWORD_BREAK               { }
    ;

continue_stmt:
    KEYWORD_CONTINUE            { }
    ;
function_call_stmt:
    ID KEYWORD_OPEN_P optional_argument_list KEYWORD_CLOSE_P
    ;

declaration_or_function:
    type_specifier ID declaration_suffix
    ;


declaration_suffix:

    KEYWORD_ASSIGN expr NEWLINE
        { printf("Reconhecido: Declaração (com init)\n"); }
    
    | NEWLINE
        { printf("Reconhecido: Declaração (simples)\n"); }
    
    | KEYWORD_OPEN_P optional_parameter_list KEYWORD_CLOSE_P block
        { printf("Reconhecido: Definição de Função\n"); }
    ;

parameter:
    type_specifier ID
    ;

/* Regra para uma lista de um ou mais parâmetros (ex: 'int a, float b') */
parameter_list:
    parameter
    | parameter_list KEYWORD_COMMA parameter
    ;

/* Regra para a lista DENTRO dos parênteses, que pode ser vazia */
optional_parameter_list:
    /* vazio */
    | parameter_list
    ;
    
argument_list:
    expr
    | argument_list KEYWORD_COMMA expr
    ;

/* Regra para a lista DENTRO dos parênteses, que pode ser vazia */
optional_argument_list:
    /* vazio */
    | argument_list
    ;
%%

void yyerror(const char* s) {
    syntax_errors = 1;
    fprintf(stderr, "ERRO SINTÁTICO na linha %d: %s\n", yylineno, s);
}

int main(int argc, char *argv[]) {
    if(argc < 2) {
        printf("Uso: %s <arquivo de entrada>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if(input_file == NULL) {
        perror("Erro ao abrir o arquivo");
        return 1;
    }

    yyin = input_file;
    
    printf("=== INICIANDO ANÁLISE SINTÁTICA ===\n\n");
    
    int result = yyparse();
    
    fclose(input_file);
    
    if(result == 0) {
        printf("\n=== ANÁLISE FINALIZADA ===\n");
        return 0;
    } else {
        printf("\n=== ANÁLISE FINALIZADA COM ERROS ===\n");
        return 1;
    }
}
