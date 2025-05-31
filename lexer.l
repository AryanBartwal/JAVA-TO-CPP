%{
#include "parser.tab.h"
#include <stdio.h>
%}

%%

"\[\]"          { return ARR; }
"["             { return LSQUARE; }
"]"             { return RSQUARE; }
"public"        { return PUBLIC; }
"class"         { return CLASS; }
"static"        { return STATIC; }
"void"          { return VOID; }
"main"          { return MAIN; }
"String"        { return STRING; }
"System.out.println" { return PRINT; }
"int"           { return INT; }
"char"          { return CHAR; }
"float"         { return FLOAT; }
"double"        { return DOUBLE; }
"if"            { return IF; }
"else"          { return ELSE; }
"for"           { return FOR; }
"while"         { return WHILE; }
"do"            { return DO; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"break"         { yylval.str = strdup(yytext); return BREAK; }
"return"        { return RETURN; }
"new"            { return NEW; }
"extends"        { return EXTENDS; }

\"[^\"]*\"       { yylval.str = strdup(yytext); return STRLIT; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }
"="             { return ASSIGN; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
">"             { return '>'; }
"<"             { return '<'; }
"=="            { return EQ; }
"!="            { return NEQ; }
"&&"            { return AND; }
"||"            { return OR; }
"--"            { return MINUSMINUS; }
"++"            { return PLUSPLUS; }
"<="            { return LE; }
">="            { return GE; }
":"             { return COLON; }
","             { return COMMA; }
"."             { return DOT; }

[A-Za-z_][A-Za-z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[0-9]+           { yylval.str = strdup(yytext); return NUMBER; }
[0-9]+\.[0-9]+[fF]?  { yylval.str = strdup(yytext); return FLOATNUM; }
'[^']'           { yylval.str = strdup(yytext); return CHARLIT; }

[ \t\r\f]+    {/* skip whitespace */}
[\n]            { yylineno++; }
\/\/.*        {/* skip single-line comments */}

%%

int yywrap() { return 1; }
