%{
#include "parser.tab.h"
%}

%%

"int"           { return INT; }
"char"          { return CHAR; }
"float"         { return FLOAT; }
"double"        { return DOUBLE; }
"if"            { return IF; }
"else"          { return ELSE; }
"for"           { return FOR; }
"while"         { return WHILE; }
"do"            { return DO; }
"break"         { yylval.str = strdup(yytext); return BREAK; }
"return"        { return RETURN; }
"System.out.println" { return PRINT; }
"public"        { return PUBLIC; }
"class"         { return CLASS; }
"static"        { return STATIC; }
"void"          { return VOID; }
"main"          { return MAIN; }
"String"        { return STRING; }
"new"           { return NEW; }

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
">"             { return GT; }
"<"             { return LT; }
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
"["             { return LSQUARE; }
"]"             { return RSQUARE; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }

\"[^\"]*\"       { yylval.str = strdup(yytext); return STRLIT; }
[A-Za-z_][A-Za-z0-9_]*   { yylval.str = strdup(yytext); fprintf(stderr, "[LEX] ID: %s\n", yytext); return ID; }
[0-9]+           { yylval.str = strdup(yytext); fprintf(stderr, "[LEX] NUMBER: %s\n", yytext); return NUMBER; }
[0-9]+\.[0-9]+[fF]?  { yylval.str = strdup(yytext); fprintf(stderr, "[LEX] FLOATNUM: %s\n", yytext); return FLOATNUM; }
'[^']'           { yylval.str = strdup(yytext); fprintf(stderr, "[LEX] CHARLIT: %s\n", yytext); return CHARLIT; }

[ \t\r]+        { /* skip whitespace */ }
[\n]            { yylineno++; }
.               { /* ignore unknown characters */ }

%%


int yywrap() { return 1; }
