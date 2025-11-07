/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_BIBI_TAB_H_INCLUDED
# define YY_YY_BIBI_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    NUM = 258,                     /* NUM  */
    FLOAT = 259,                   /* FLOAT  */
    ID = 260,                      /* ID  */
    STRING = 261,                  /* STRING  */
    CHAR = 262,                    /* CHAR  */
    KEYWORD_INT = 263,             /* KEYWORD_INT  */
    KEYWORD_FLOAT = 264,           /* KEYWORD_FLOAT  */
    KEYWORD_CHAR = 265,            /* KEYWORD_CHAR  */
    KEYWORD_STRING = 266,          /* KEYWORD_STRING  */
    KEYWORD_VOID = 267,            /* KEYWORD_VOID  */
    KEYWORD_IF = 268,              /* KEYWORD_IF  */
    KEYWORD_ELSE = 269,            /* KEYWORD_ELSE  */
    KEYWORD_FOR = 270,             /* KEYWORD_FOR  */
    KEYWORD_BREAK = 271,           /* KEYWORD_BREAK  */
    KEYWORD_CONTINUE = 272,        /* KEYWORD_CONTINUE  */
    KEYWORD_WHILE = 273,           /* KEYWORD_WHILE  */
    KEYWORD_RETURN = 274,          /* KEYWORD_RETURN  */
    KEYWORD_PLUS = 275,            /* KEYWORD_PLUS  */
    KEYWORD_MINUS = 276,           /* KEYWORD_MINUS  */
    KEYWORD_MULT = 277,            /* KEYWORD_MULT  */
    KEYWORD_DIV = 278,             /* KEYWORD_DIV  */
    KEYWORD_SQUARE = 279,          /* KEYWORD_SQUARE  */
    KEYWORD_OPEN_P = 280,          /* KEYWORD_OPEN_P  */
    KEYWORD_CLOSE_P = 281,         /* KEYWORD_CLOSE_P  */
    KEYWORD_OPEN_CB = 282,         /* KEYWORD_OPEN_CB  */
    KEYWORD_CLOSE_CB = 283,        /* KEYWORD_CLOSE_CB  */
    KEYWORD_OPEN_B = 284,          /* KEYWORD_OPEN_B  */
    KEYWORD_CLOSE_B = 285,         /* KEYWORD_CLOSE_B  */
    KEYWORD_ASSIGN = 286,          /* KEYWORD_ASSIGN  */
    KEYWORD_EQUALS = 287,          /* KEYWORD_EQUALS  */
    KEYWORD_DIFFERENT = 288,       /* KEYWORD_DIFFERENT  */
    KEYWORD_GREATER = 289,         /* KEYWORD_GREATER  */
    KEYWORD_GREATER_EQ = 290,      /* KEYWORD_GREATER_EQ  */
    KEYWORD_SMALLER = 291,         /* KEYWORD_SMALLER  */
    KEYWORD_SMALLER_EQ = 292,      /* KEYWORD_SMALLER_EQ  */
    KEYWORD_AND = 293,             /* KEYWORD_AND  */
    KEYWORD_OR = 294,              /* KEYWORD_OR  */
    KEYWORD_HASHTAG = 295          /* KEYWORD_HASHTAG  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 13 "./bibi.y"

    int ival;
    float fval;
    char* string;

#line 110 "./bibi.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_BIBI_TAB_H_INCLUDED  */
