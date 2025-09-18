# Descrição da Linguagem Regular da Linguagem CWS (C Without Semicolons)
- Nesta seção, apresentamos uma tabela contendo os principais tokens utilizados na linguagem de programação CWS.
- Cada token é acompanhado de sua expressão regular, que descreve o padrão aceito, e de um exemplo prático que ilustra como ele pode aparecer no código.
- Essa tabela serve como referência para o desenvolvimento de analisadores léxicos e compiladores.

| Token            | Expressão Regular          | Exemplo       |
|------------------|---------------------------|---------------|
| NUM              | -?[0-9]+                   | 123, 007      |
| FLOAT              | -?[0-9]+.[0-9]+                   | 0.0, 245.2      |
| NAME               | [A-Za-z_][A-Za-z0-9_]*   | x, var1       |
| STRING           | ".*"                     | "texto"       |
| CHAR             | '.'                      | 'a'           |
| MATH_OPERATOR    | +\|-\|*\|/\|^                | +, -          |
| SPECIAL_OPERATOR | ==\|>\|<\|>=\|<=\|&&\|\|\|             | ==, >         |
| SPECIAL_CHAR        | #\|(\|)\|[\|]\|{\|}\|,\|.          | #, (, {       |
| COMENT           | /*.**/                   | /\*comentario\*/  |