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

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
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
    STRLIT = 258,                  /* STRLIT  */
    ID = 259,                      /* ID  */
    PUBLIC = 260,                  /* PUBLIC  */
    CLASS = 261,                   /* CLASS  */
    STATIC = 262,                  /* STATIC  */
    VOID = 263,                    /* VOID  */
    MAIN = 264,                    /* MAIN  */
    STRING = 265,                  /* STRING  */
    PRINT = 266,                   /* PRINT  */
    LPAREN = 267,                  /* LPAREN  */
    RPAREN = 268,                  /* RPAREN  */
    LBRACE = 269,                  /* LBRACE  */
    RBRACE = 270,                  /* RBRACE  */
    SEMICOLON = 271,               /* SEMICOLON  */
    ARR = 272,                     /* ARR  */
    LSQUARE = 273,                 /* LSQUARE  */
    RSQUARE = 274,                 /* RSQUARE  */
    INT = 275,                     /* INT  */
    ASSIGN = 276,                  /* ASSIGN  */
    NUMBER = 277,                  /* NUMBER  */
    CHAR = 278,                    /* CHAR  */
    FLOAT = 279,                   /* FLOAT  */
    DOUBLE = 280,                  /* DOUBLE  */
    FLOATNUM = 281,                /* FLOATNUM  */
    CHARLIT = 282,                 /* CHARLIT  */
    PLUS = 283,                    /* PLUS  */
    MINUS = 284,                   /* MINUS  */
    TIMES = 285,                   /* TIMES  */
    DIVIDE = 286,                  /* DIVIDE  */
    IF = 287,                      /* IF  */
    ELSE = 288,                    /* ELSE  */
    EQ = 289,                      /* EQ  */
    NEQ = 290,                     /* NEQ  */
    AND = 291,                     /* AND  */
    OR = 292,                      /* OR  */
    FOR = 293,                     /* FOR  */
    WHILE = 294,                   /* WHILE  */
    DO = 295,                      /* DO  */
    MINUSMINUS = 296,              /* MINUSMINUS  */
    PLUSPLUS = 297,                /* PLUSPLUS  */
    LE = 298,                      /* LE  */
    GE = 299,                      /* GE  */
    LT = 300                       /* LT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 9 "parser.y"

    char* str;

#line 113 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
