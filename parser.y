%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s) { 
    extern int yylineno;
    extern char *yytext;
    fprintf(stderr, "Error: %s at line %d, near token '%s'\n", s, yylineno, yytext);
}
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
%token INT ASSIGN
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
%token GT
%token SWITCH CASE DEFAULT
%token COLON
%token BREAK
%token COMMA
%token RETURN
%token NEW

%type <str> program method_seq method_def method_params param_list block stmts stmts_or_empty statement expr cond for_init for_incr switch_stmt case_blocks case_block default_block expr_list type if_stmt

%start program

%left PLUS MINUS
%left TIMES DIVIDE

%%


program:
    PUBLIC CLASS ID LBRACE method_seq RBRACE {
        FILE *f = fopen("output.cpp", "w");
        if (f) {
            fprintf(f, "#include <iostream>\nusing namespace std;\n%s\n", $5);
            fclose(f);
            printf("[INFO] Conversion complete. Output written to output.cpp\n");
        } else {
            fprintf(stderr, "[ERROR] Could not open output.cpp for writing\n");
        }
    }
;

method_seq:
    method_def method_seq {
        size_t len = strlen($1) + strlen($2) + 2;
        char *out = (char*)malloc(len);
        strcpy(out, $1);
        strcat(out, $2);
        $$ = out;
        free($1); free($2);
    }
    | method_def { $$ = $1; }
;

method_def:
    PUBLIC STATIC type ID LPAREN method_params RPAREN block {
        size_t len = strlen($3) + strlen($4) + strlen($6) + strlen($8) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(%s) %s\n\n", $3, $4, $6, $8);
        $$ = out;
        free($3); free($4); free($6); free($8);
    }
    | PUBLIC STATIC type ID LPAREN RPAREN block {
        size_t len = strlen($3) + strlen($4) + strlen($7) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s() %s\n\n", $3, $4, $7);
        $$ = out;
        free($3); free($4); free($7);
    }
    | PUBLIC STATIC VOID MAIN LPAREN STRING LSQUARE RSQUARE ID RPAREN block {
        size_t len = strlen($11) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "int main() %s\n", $11);
        $$ = out;
        free($11);
    }
    | type ID LPAREN method_params RPAREN block {
        size_t len = strlen($1) + strlen($2) + strlen($4) + strlen($6) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(%s) %s\n\n", $1, $2, $4, $6);
        $$ = out;
        free($1); free($2); free($4); free($6);
    }
    | type ID LPAREN RPAREN block {
        size_t len = strlen($1) + strlen($2) + strlen($5) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s() %s\n\n", $1, $2, $5);
        $$ = out;
        free($1); free($2); free($5);
    }
    | VOID ID LPAREN method_params RPAREN block {
        size_t len = strlen($2) + strlen($4) + strlen($6) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "void %s(%s) %s\n\n", $2, $4, $6);
        $$ = out;
        free($2); free($4); free($6);
    }
    | VOID ID LPAREN RPAREN block {
        size_t len = strlen($2) + strlen($5) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "void %s() %s\n\n", $2, $5);
        $$ = out;
        free($2); free($5);
    }
;

method_params:
    /* empty */ { $$ = strdup(""); }
    | param_list { $$ = $1; }
;

param_list:
    type ID { 
        size_t len = strlen($1) + strlen($2) + 2;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s", $1, $2);
        $$ = out;
        free($1); free($2);
    }
    | type ID COMMA param_list {
        size_t len = strlen($1) + strlen($2) + strlen($4) + 4;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s, %s", $1, $2, $4);
        $$ = out;
        free($1); free($2); free($4);
    }
;

type:
    INT { $$ = strdup("int"); }
    | FLOAT { $$ = strdup("float"); }
    | DOUBLE { $$ = strdup("double"); }
    | CHAR { $$ = strdup("char"); }
    | VOID { $$ = strdup("void"); }
    | type LSQUARE RSQUARE {
        size_t len = strlen($1) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s[]", $1);
        $$ = out;
        free($1);
    }
;

block:
    LBRACE stmts_or_empty RBRACE {
        size_t len = strlen($2) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "{\n%s}\n", $2);
        $$ = out;
        free($2);
    }
;

stmts:
    statement stmts {
        size_t len = strlen($1) + strlen($2) + 1;
        char *tmp = (char*)malloc(len);
        strcpy(tmp, $1);
        strcat(tmp, $2);
        $$ = tmp;
        free($1); free($2);
    }
    | /* empty */ { $$ = strdup(""); }
;

stmts_or_empty:
    stmts { $$ = $1; }
    | /* empty */ { $$ = strdup(""); }
;

statement:
    ID LSQUARE expr RSQUARE ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($3) + strlen($6) + 20;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s[%s] = %s;\n", $1, $3, $6);
        $$ = out;
        free($1); free($3); free($6);
    }
    | ID LSQUARE expr RSQUARE LSQUARE expr RSQUARE ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($3) + strlen($6) + strlen($9) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s[%s][%s] = %s;\n", $1, $3, $6, $9);
        $$ = out;
        free($1); free($3); free($6); free($9);
    }
    | type ID ASSIGN expr SEMICOLON {
        // Enhanced: handle 1D and 2D array declarations
        if (strstr($1, "[][]") && strstr($4, "new ")) {
            // 2D array: int[][] mat = new int[2][3]; => int mat[2][3];
            char *type_c = strdup($1);
            char *bracket = strstr(type_c, "[][]");
            if (bracket) *bracket = '\0';
            // Find first and second dimension
            char *size1_start = strchr($4, '[') + 1;
            char *size1_end = strchr(size1_start, ']');
            char size1[32] = {0};
            strncpy(size1, size1_start, size1_end - size1_start);
            size1[size1_end - size1_start] = 0;
            char *size2_start = strchr(size1_end + 1, '[') + 1;
            char *size2_end = strchr(size2_start, ']');
            char size2[32] = {0};
            strncpy(size2, size2_start, size2_end - size2_start);
            size2[size2_end - size2_start] = 0;
            char *out = (char*)malloc(strlen(type_c) + strlen($2) + strlen(size1) + strlen(size2) + 30);
            snprintf(out, strlen(type_c) + strlen($2) + strlen(size1) + strlen(size2) + 30, "    %s %s[%s][%s];\n", type_c, $2, size1, size2);
            $$ = out;
            free(type_c); free($1); free($2); free($4);
        } else if (strstr($1, "[]") && strstr($4, "new ")) {
            // 1D array: int[] arr = new int[3]; => int arr[3];
            char *type_c = strdup($1);
            char *bracket = strstr(type_c, "[]");
            if (bracket) *bracket = '\0';
            char *size_start = strchr($4, '[') + 1;
            char *size_end = strchr(size_start, ']');
            char size[32] = {0};
            strncpy(size, size_start, size_end - size_start);
            size[size_end - size_start] = 0;
            char *out = (char*)malloc(strlen(type_c) + strlen($2) + strlen(size) + 20);
            snprintf(out, strlen(type_c) + strlen($2) + strlen(size) + 20, "    %s %s[%s];\n", type_c, $2, size);
            $$ = out;
            free(type_c); free($1); free($2); free($4);
        } else {
            size_t len = strlen($1) + strlen($2) + strlen($4) + 30;
            char *out = (char*)malloc(len);
            snprintf(out, len, "    %s %s = %s;\n", $1, $2, $4);
            $$ = out;
            free($1); free($2); free($4);
        }
    }
    | BREAK SEMICOLON {
        char *out = (char*)malloc(16);
        snprintf(out, 16, "    break;\n");
        $$ = out;
    }
    | PRINT LPAREN STRLIT RPAREN SEMICOLON {
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
        // Always start with cout <<
        char *expr = $3;
        size_t len = strlen(expr) * 2 + 40;
        char *out = (char*)malloc(len);
        strcpy(out, " << ");
        char *p = expr;
        while (*p) {
            if (*p == '"' && (p == expr || *(p-1) == ' ' || *(p-1) == '+')) {
                char *q = strchr(p+1, '"');
                if (q) {
                    strncat(out, p, q-p+1);
                    p = q+1;
                    continue;
                }
            }
            if (*p == '+' && (p == expr || *(p-1) == ' ')) {
                strcat(out, " << ");
                p++;
                while (*p == ' ') p++;
                continue;
            }
            size_t l = strlen(out);
            out[l] = *p;
            out[l+1] = 0;
            p++;
        }
        snprintf(out+strlen(out), len-strlen(out), " << endl;\n");
        char *final = (char*)malloc(strlen(out)+20);
        snprintf(final, strlen(out)+20, "    cout%s", out);
        $$ = final;
        free(expr);
        free(out);
    }
    | INT ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s = %s;\n", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | FLOAT ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    float %s = %s;\n", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | DOUBLE ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    double %s = %s;\n", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | CHAR ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    char %s = %s;\n", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | ID ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($3) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s = %s;\n", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | ID LPAREN RPAREN SEMICOLON {
        size_t len = strlen($1) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s();\n", $1);
        $$ = out;
        free($1);
    }
    | ID LPAREN expr_list RPAREN SEMICOLON {
        size_t len = strlen($1) + strlen($3) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s(%s);\n", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | RETURN expr SEMICOLON {
        size_t len = strlen($2) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    return %s;\n", $2);
        $$ = out;
        free($2);
    }
    | if_stmt { $$ = $1; }
    | block { $$ = $1; }
    | FOR LPAREN for_init SEMICOLON cond SEMICOLON for_incr RPAREN block {
        size_t len = strlen($3) + strlen($5) + strlen($7) + strlen($9) + 100;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    for (%s; %s; %s) %s\n", $3, $5, $7, $9);
        $$ = out;
        free($3); free($5); free($7); free($9);
    }
    | FOR LPAREN for_init SEMICOLON cond SEMICOLON for_incr RPAREN statement {
        size_t len = strlen($3) + strlen($5) + strlen($7) + strlen($9) + 100;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    for (%s; %s; %s)\n%s", $3, $5, $7, $9);
        $$ = out;
        free($3); free($5); free($7); free($9);
    }
    | WHILE LPAREN cond RPAREN block {
        size_t len = strlen($5) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s) %s\n", $3, $5);
        $$ = out;
        free($3); free($5);
    }
    | DO block WHILE LPAREN cond RPAREN SEMICOLON {
        size_t len = strlen($2) + strlen($5) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    do %s while (%s);\n", $2, $5);
        $$ = out;
        free($2); free($5);
    }
    | switch_stmt { $$ = $1; }
;

if_stmt:
    IF LPAREN cond RPAREN statement ELSE statement {
        size_t len = strlen($3) + strlen($5) + strlen($7) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    if (%s) %s else %s\n", $3, $5, $7);
        $$ = out;
        free($3); free($5); free($7);
    }
    | IF LPAREN cond RPAREN statement {
        size_t len = strlen($3) + strlen($5) + 20;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    if (%s) %s\n", $3, $5);
        $$ = out;
        free($3); free($5);
    }
;

switch_stmt:
    SWITCH LPAREN expr RPAREN LBRACE case_blocks default_block RBRACE {
        size_t len = strlen($3) + strlen($6) + strlen($7) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    switch (%s) {\n%s%s    }\n", $3, $6, $7);
        $$ = out;
        free($3); free($6); free($7);
    }
;

case_blocks:
    case_blocks case_block {
        size_t len = strlen($1) + strlen($2) + 1;
        char *out = (char*)malloc(len);
        strcpy(out, $1);
        strcat(out, $2);
        $$ = out;
        free($1); free($2);
    }
    | case_block { $$ = $1; }
;

case_block:
    CASE expr COLON stmts_or_empty {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    case %s:\n%s", $2, $4);
        $$ = out;
        free($2); free($4);
    }
;

default_block:
    DEFAULT COLON stmts_or_empty {
        size_t len = strlen($3) + 20;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    default:\n%s", $3);
        $$ = out;
        free($3);
    }
    | /* empty */ { $$ = strdup(""); }
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
;

expr:
    ID { $$ = strdup($1); free($1); }
    | NUMBER { $$ = strdup($1); free($1); }
    | FLOATNUM { $$ = strdup($1); free($1); }
    | STRLIT { $$ = strdup($1); free($1); }
    | CHARLIT { $$ = strdup($1); free($1); }
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
    | ID LPAREN expr_list RPAREN {
        size_t len = strlen($1) + strlen($3) + 8;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s(%s)", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | ID LPAREN RPAREN {
        size_t len = strlen($1) + 8;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s()", $1);
        $$ = out;
        free($1);
    }
    | ID LSQUARE expr RSQUARE {
        size_t len = strlen($1) + strlen($3) + 4;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s[%s]", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | ID LSQUARE expr RSQUARE LSQUARE expr RSQUARE {
        size_t len = strlen($1) + strlen($3) + strlen($6) + 7;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s[%s][%s]", $1, $3, $6);
        $$ = out;
        free($1); free($3); free($6);
    }
    | NEW type LSQUARE expr RSQUARE {
        size_t len = strlen($2) + strlen($4) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "new %s[%s]", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | NEW type LSQUARE expr RSQUARE LSQUARE expr RSQUARE {
        size_t len = strlen($2) + strlen($4) + strlen($7) + 15;
        char *out = (char*)malloc(len);
        snprintf(out, len, "new %s[%s][%s]", $2, $4, $7);
        $$ = out;
        free($2); free($4); free($7);
    }
    | INT LSQUARE RSQUARE ID ASSIGN NEW INT LSQUARE expr RSQUARE SEMICOLON {
        size_t len = strlen($4) + strlen($9) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s[] = new int[%s];\n", $4, $9);
        $$ = out;
        free($4); free($9);
    }
    | INT LSQUARE RSQUARE LSQUARE RSQUARE ID ASSIGN NEW INT LSQUARE expr RSQUARE LSQUARE expr RSQUARE SEMICOLON {
        size_t len = strlen($6) + strlen($11) + strlen($14) + 80;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s[][] = new int[%s][%s];\n", $6, $11, $14);
        $$ = out;
        free($6); free($11); free($14);
    }
    | type LSQUARE RSQUARE ID ASSIGN NEW type LSQUARE expr RSQUARE LSQUARE expr RSQUARE SEMICOLON {
        // 2D array: int[][] mat = new int[2][3]; => int mat[2][3];
        char *type_c = strdup($1);
        char *size1_start = strchr($9, '[') + 1;
        char *size1_end = strchr(size1_start, ']');
        char size1[32] = {0};
        strncpy(size1, size1_start, size1_end - size1_start);
        size1[size1_end - size1_start] = 0;
        char *size2_start = strchr($12, '[') + 1;
        char *size2_end = strchr(size2_start, ']');
        char size2[32] = {0};
        strncpy(size2, size2_start, size2_end - size2_start);
        size2[size2_end - size2_start] = 0;
        char *out = (char*)malloc(strlen(type_c) + strlen($4) + strlen(size1) + strlen(size2) + 30);
        snprintf(out, strlen(type_c) + strlen($4) + strlen(size1) + strlen(size2) + 30, "    %s %s[%s][%s];\n", type_c, $4, size1, size2);
        $$ = out;
        free(type_c); free($4); free($9); free($12);
    }
;

expr_list:
    expr { $$ = $1; }
    | expr COMMA expr_list {
        size_t len = strlen($1) + strlen($3) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s, %s", $1, $3);
        $$ = out;
        free($1); free($3);
    }
;

cond:
    expr { $$ = strdup($1); free($1); }
    | expr GT expr {
        size_t len = strlen($1) + strlen($3) + 4;
        char *tmp = (char*)malloc(len);
        snprintf(tmp, len, "%s > %s", $1, $3);
        $$ = tmp;
        free($1); free($3);
    }
    | expr LT expr {
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
