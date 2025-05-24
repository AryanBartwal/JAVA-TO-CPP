%{
#include "parser.tab.h"
%}

%%

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

\"[^\"]*\"       { yylval.str = strdup(yytext); return STRLIT; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
";"             { return SEMICOLON; }
"["             { return LSQUARE; }
"]"             { return RSQUARE; }
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

[A-Za-z_][A-Za-z0-9_]*   { yylval.str = strdup(yytext); return ID; }
[0-9]+           { yylval.str = strdup(yytext); return NUMBER; }
[0-9]+\.[0-9]+[fF]?  { yylval.str = strdup(yytext); return FLOATNUM; }
'[^']'           { yylval.str = strdup(yytext); return CHARLIT; }

[ \t\n]+        { /* skip whitespace */ }
.               { return *yytext; }

%%
