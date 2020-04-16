/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tC = 258,
    tCONST = 259,
    tOP = 260,
    tCP = 261,
    tOB = 262,
    tCB = 263,
    tSC = 264,
    tMAIN = 265,
    tINT = 266,
    tPLUS = 267,
    tMINUS = 268,
    tDIV = 269,
    tEQUAL = 270,
    tMULT = 271,
    tPRINT = 272,
    tLT = 273,
    tGT = 274,
    tWHILE = 275,
    tCOMP = 276,
    tVAL = 277,
    tIF = 278,
    tELSE = 279,
    tVAR = 280
  };
#endif
/* Tokens.  */
#define tC 258
#define tCONST 259
#define tOP 260
#define tCP 261
#define tOB 262
#define tCB 263
#define tSC 264
#define tMAIN 265
#define tINT 266
#define tPLUS 267
#define tMINUS 268
#define tDIV 269
#define tEQUAL 270
#define tMULT 271
#define tPRINT 272
#define tLT 273
#define tGT 274
#define tWHILE 275
#define tCOMP 276
#define tVAL 277
#define tIF 278
#define tELSE 279
#define tVAR 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 34 "source.y" /* yacc.c:1909  */

    int intValue;
    char * stringValue;

#line 109 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
