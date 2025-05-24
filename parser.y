%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int yylex();
%}

%union {
    char* str;
}

%token <str> STRLIT
%token <str> ID
%token PUBLIC CLASS STATIC VOID MAIN STRING PRINT
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON
%token ARR
%token LSQUARE RSQUARE
%token INT
%token ASSIGN
%token <str> NUMBER
%token CHAR FLOAT DOUBLE
%token <str> FLOATNUM
%token <str> CHARLIT
%token PLUS MINUS TIMES DIVIDE
%token IF ELSE
%token EQ NEQ
%token AND OR
%token FOR WHILE DO
%token MINUSMINUS
%token PLUSPLUS
%token LE GE
%token LT

%type <str> program statements statement array_param expr cond statements_or_empty
%type <str> if_stmt else_part block
%type <str> for_init for_incr

%%


program:
    PUBLIC CLASS ID LBRACE PUBLIC STATIC VOID MAIN LPAREN STRING array_param RPAREN LBRACE statements RBRACE RBRACE {
        printf("#include <iostream>\nusing namespace std;\nint main() {\n%s    return 0;\n}\n", $14);
    }
;

array_param:
    ID ARR { $$ = $1; }
    | ID LSQUARE RSQUARE { $$ = $1; }
    | LSQUARE RSQUARE ID { $$ = $3; }
    | ARR ID { $$ = $2; }
    | /* allow just ID for robustness */ ID { $$ = $1; }
;

statements:
    statement statements {
        size_t len = strlen($1) + strlen($2) + 1;
        char *tmp = (char*)malloc(len);
        strcpy(tmp, $1);
        strcat(tmp, $2);
        $$ = tmp;
        free($1);
        free($2);
    }
    | /* empty */ { $$ = strdup(""); }
;

statements_or_empty:
    statements { $$ = $1; }
    | /* empty */ { $$ = strdup(""); }
;

statement:
    PRINT LPAREN STRLIT RPAREN SEMICOLON {
        size_t len = strlen($3) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    cout << %s << endl;\n", $3);
        $$ = out;
        free($3);
    }
    | PRINT LPAREN ID RPAREN SEMICOLON {
        size_t len = strlen($3) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    cout << %s << endl;\n", $3);
        $$ = out;
        free($3);
    }
    | PRINT LPAREN expr RPAREN SEMICOLON {
        size_t len = strlen($3) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    cout << %s << endl;\n", $3);
        $$ = out;
        free($3);
    }
    | INT ID ASSIGN NUMBER SEMICOLON {
        size_t len = strlen($2) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | FLOAT ID ASSIGN FLOATNUM SEMICOLON {
        size_t len = strlen($2) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    float %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | DOUBLE ID ASSIGN FLOATNUM SEMICOLON {
        size_t len = strlen($2) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    double %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | CHAR ID ASSIGN CHARLIT SEMICOLON {
        size_t len = strlen($2) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    char %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | ID ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($3) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s = %s;\n", $1, $3);
        $$ = out;
        free($1);
        free($3);
    }
    | DOUBLE ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    double %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | FLOAT ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    float %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | INT ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | if_stmt { $$ = $1; }
    | FOR LPAREN for_init SEMICOLON cond SEMICOLON for_incr RPAREN LBRACE statements_or_empty RBRACE {
        size_t len = strlen($3) + strlen($5) + strlen($7) + strlen($10) + 100;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    for (%s; %s; %s) {\n%s    }\n", $3, $5, $7, $10);
        $$ = out;
        free($3); free($5); free($7); free($10);
    }
    | WHILE LPAREN cond RPAREN LBRACE statements_or_empty RBRACE {
        size_t len = strlen($3) + strlen($6) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s) {\n%s    }\n", $3, $6);
        $$ = out;
        free($3); free($6);
    }
    | DO LBRACE statements_or_empty RBRACE WHILE LPAREN cond RPAREN SEMICOLON {
        size_t len = strlen($3) + strlen($7) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    do {\n%s    } while (%s);\n", $3, $7);
        $$ = out;
        free($3); free($7);
    }
    | WHILE LPAREN ID LT NUMBER RPAREN LBRACE statements_or_empty RBRACE {
        size_t len = strlen($3) + strlen($5) + strlen($8) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s < %s) {\n%s    }\n", $3, $5, $8);
        $$ = out;
        free($3); free($5); free($8);
    }
;

for_init:
    INT ID ASSIGN expr { 
        size_t len = strlen($2) + strlen($4) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "int %s = %s", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | ID ASSIGN expr {
        size_t len = strlen($1) + strlen($3) + 5;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s = %s", $1, $3);
        $$ = out;
        free($1); free($3);
    }
;

for_incr:
    ID ASSIGN expr {
        size_t len = strlen($1) + strlen($3) + 5;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s = %s", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | ID PLUSPLUS {
        size_t len = strlen($1) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s++", $1);
        $$ = out;
        free($1);
    }
    | ID MINUSMINUS {
        size_t len = strlen($1) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s--", $1);
        $$ = out;
        free($1);
    }
    | ID PLUS PLUS {
        size_t len = strlen($1) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s++", $1);
        $$ = out;
        free($1);
    }
    | ID MINUS MINUS {
        size_t len = strlen($1) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s--", $1);
        $$ = out;
        free($1);
    }
;


if_stmt:
    IF LPAREN cond RPAREN block else_part {
        size_t len = strlen($3) + strlen($5) + strlen($6) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    if (%s) %s%s", $3, $5, $6);
        $$ = out;
        free($3); free($5); free($6);
    }
;

else_part:
    ELSE if_stmt {
        size_t len = strlen($2) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "else %s", $2);
        $$ = out;
        free($2);
    }
    | ELSE block {
        size_t len = strlen($2) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "else %s", $2);
        $$ = out;
        free($2);
    }
    | /* empty */ { $$ = strdup(""); }
;

block:
    LBRACE statements_or_empty RBRACE {
        size_t len = strlen($2) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "{\n%s    }\n", $2);
        $$ = out;
        free($2);
    }
;

expr:
    ID { $$ = strdup($1); free($1); }
    | NUMBER { $$ = strdup($1); free($1); }
    | FLOATNUM { $$ = strdup($1); free($1); }
    | expr PLUS expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s + %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr MINUS expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s - %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr TIMES expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s * %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr DIVIDE expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s / %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
;

cond:
    expr { $$ = strdup($1); free($1); }
    | expr '>' expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s > %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr '<' expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s < %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr LE expr {
        size_t len = strlen($1) + strlen($3) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s <= %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr GE expr {
        size_t len = strlen($1) + strlen($3) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s >= %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr EQ expr {
        size_t len = strlen($1) + strlen($3) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s == %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr NEQ expr {
        size_t len = strlen($1) + strlen($3) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s != %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | cond AND cond {
        size_t len = strlen($1) + strlen($3) + 6;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s && %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | cond OR cond {
        size_t len = strlen($1) + strlen($3) + 6;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s || %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
;


%%


int main() {
    yyparse();
    return 0;
}
