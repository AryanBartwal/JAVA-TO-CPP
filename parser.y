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

%type <str> program statements statement array_param expr cond

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

statement:
    PRINT LPAREN STRLIT RPAREN SEMICOLON {
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
    | IF LPAREN cond RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE {
        size_t len = strlen($3) + strlen($6) + strlen($10) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    if (%s) {\n%s    } else {\n%s    }\n", $3, $6, $10);
        $$ = out;
        free($3); free($6); free($10);
    }
    | IF LPAREN cond RPAREN LBRACE statements RBRACE {
        size_t len = strlen($3) + strlen($6) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    if (%s) {\n%s    }\n", $3, $6);
        $$ = out;
        free($3); free($6);
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
    | expr ASSIGN ASSIGN expr {
        size_t len = strlen($1) + strlen($4) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s == %s", $1, $4);
        $$ = tmp;
        free($1); free($4);
    }
    | expr '!' ASSIGN expr {
        size_t len = strlen($1) + strlen($4) + 5;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s != %s", $1, $4);
        $$ = tmp;
        free($1); free($4);
    }
;


%%


int main() {
    yyparse();
    return 0;
}
