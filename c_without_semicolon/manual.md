# Manual Oficial da Linguagem CWS (C Without Semicolons)

## 1. Introdução

Bem-vindo ao CWS, uma variante simplificada da linguagem C projetada com uma regra fundamental: a ausência de ponto e vírgula (`;`) como terminador de instrução.

Este manual descreve a sintaxe, os componentes e as ferramentas para a linguagem CWS. O analisador léxico fornecido é a ferramenta oficial para processar e validar os tokens de um programa CWS.

## 2. A Regra Fundamental: Sem Ponto e Vírgula

A característica que define a linguagem CWS é a eliminação do ponto e vírgula. As instruções são separadas por quebras de linha.

**Errado (Gera Erro Léxico):**
```c
int a = 10;
```

```sh
Lexical Error: Unexpected character ';' on line 2
```

Qualquer uso do caractere `;` resultará em um erro léxico, pois ele não é um símbolo reconhecido pela linguagem.

## 3. Compilando o Analisador CWS
Para analisar um arquivo de código `.cws`, você precisa primeiro compilar a ferramenta de análise:
```bash
make
```
Então executar o analisador:
```bash
./rec [arquivo]
```
<br>
<br>
<br>
<br>
<br>

## 4. Exemplo de um Programa CWS
Abaixo está um programa de exemplo válido escrito em CWS.

```c
#include "stdio.h"

int main() {
    printf("Hello World!\n")
    return 0
}
```