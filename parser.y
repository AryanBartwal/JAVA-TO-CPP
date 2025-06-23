%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// Buffer for method definitions
char method_buffer[65536] = "";
void add_method(const char* code) {
    strcat(method_buffer, code);
}
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
%token LT GT
%token SWITCH CASE DEFAULT
%token COLON
%token BREAK
%token COMMA
%token RETURN
%token NEW
%token EXTENDS
%token DOT

%type <str> program class_body class_members class_member method_def statements statement array_param expr cond statements_or_empty
%type <str> if_stmt else_part block
%type <str> for_init for_incr
%type <str> switch_stmt case_blocks case_block default_block
%type <str> type
%type <str> parameter_list parameter
%type <str> expr_list
%type <str> opt_extends field_decl

%left '.'
%left LPAREN RPAREN
%left LSQUARE RSQUARE

%%


program:
    class_defs { /* allow multiple top-level classes */ }
;

class_defs:
    class_def class_defs { /* allow multiple classes */ }
    | class_def { }
;

class_def:
    PUBLIC CLASS ID opt_extends LBRACE class_body RBRACE {
        printf("#include <iostream>\nusing namespace std;\n%s", $6);
    }
    | CLASS ID opt_extends LBRACE class_body RBRACE {
        printf("#include <iostream>\nusing namespace std;\n%s", $5);
    }
;

opt_extends:
    /* empty */ { $$ = strdup(""); }
    | EXTENDS ID { $$ = strdup($2); }
;

class_body:
    class_members { $$ = $1; }
;

class_members:
    class_member class_members {
        size_t len = strlen($1) + strlen($2) + 1;
        char *tmp = (char*)malloc(len);
        strcpy(tmp, $1);
        strcat(tmp, $2);
        $$ = tmp;
        free($1); free($2);
    }
    | /* empty */ { $$ = strdup(""); }
;

class_member:
    field_decl { $$ = $1; }
    | method_def { $$ = $1; }
    | type ID LPAREN parameter_list RPAREN LBRACE statements RBRACE {
        size_t len = strlen($1) + strlen($2) + strlen($4) + strlen($7) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(%s) {\n%s}\n\n", $1, $2, $4, $7);
        $$ = out;
        free($1); free($2); free($4); free($7);
    }
    | type ID LPAREN RPAREN LBRACE statements RBRACE {
        size_t len = strlen($1) + strlen($2) + strlen($6) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s() {\n%s}\n\n", $1, $2, $6);
        $$ = out;
        free($1); free($2); free($6);
    }
    | PUBLIC type ID LPAREN parameter_list RPAREN LBRACE statements RBRACE {
        size_t len = strlen($2) + strlen($3) + strlen($5) + strlen($8) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(%s) {\n%s}\n\n", $2, $3, $5, $8);
        $$ = out;
        free($2); free($3); free($5); free($8);
    }
    | PUBLIC type ID LPAREN RPAREN LBRACE statements RBRACE {
        size_t len = strlen($2) + strlen($3) + strlen($7) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s() {\n%s}\n\n", $2, $3, $7);
        $$ = out;
        free($2); free($3); free($7);
    }
    | PUBLIC STATIC VOID MAIN LPAREN STRING array_param RPAREN LBRACE statements RBRACE {
        size_t len = strlen($10) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "int main() {\n%s    return 0;\n}\n", $10);
        $$ = out;
        free($10);
    }
;

field_decl:
    type ID SEMICOLON {
        size_t len = strlen($1) + strlen($2) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s;\n", $1, $2);
        $$ = out;
        free($1); free($2);
    }
    | type ID ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($2) + strlen($4) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s = %s;\n", $1, $2, $4);
        $$ = out;
        free($1); free($2); free($4);
    }
;

methods:
    method_def methods { add_method($1); free($1); }
    | /* empty */
;

method_def:
    PUBLIC STATIC type ID LPAREN RPAREN LBRACE statements RBRACE {
        size_t len = strlen($3) + strlen($4) + strlen($8) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s() {\n%s}\n\n", $3, $4, $8);
        $$ = out;
        free($3); free($4); free($8);
    }
    | PUBLIC STATIC type ID LPAREN parameter_list RPAREN LBRACE statements RBRACE {
        size_t len = strlen($3) + strlen($4) + strlen($6) + strlen($9) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(%s) {\n%s}\n\n", $3, $4, $6, $9);
        $$ = out;
        free($3); free($4); free($6); free($9);
    }
    | PUBLIC STATIC type ID LPAREN STRING array_param RPAREN LBRACE statements RBRACE {
        size_t len = strlen($3) + strlen($4) + strlen($7) + strlen($10) + 64;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(std::string* %s) {\n%s}\n\n", $3, $4, $7, $10);
        $$ = out;
        free($3); free($4); free($7); free($10);
    }
    | PUBLIC STATIC type ID LPAREN RPAREN LBRACE RBRACE {
        size_t len = strlen($3) + strlen($4) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s() {\n}\n\n", $3, $4);
        $$ = out;
        free($3); free($4);
    }
    | PUBLIC STATIC type ID LPAREN parameter_list RPAREN LBRACE RBRACE {
        size_t len = strlen($3) + strlen($4) + strlen($6) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(%s) {\n}\n\n", $3, $4, $6);
        $$ = out;
        free($3); free($4); free($6);
    }
    | PUBLIC STATIC type ID LPAREN STRING array_param RPAREN LBRACE RBRACE {
        size_t len = strlen($3) + strlen($4) + strlen($7) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s(std::string* %s) {\n}\n\n", $3, $4, $7);
        $$ = out;
        free($3); free($4); free($7);
    }
;

type:
    INT { $$ = strdup("int"); }
    | FLOAT { $$ = strdup("float"); }
    | DOUBLE { $$ = strdup("double"); }
    | CHAR { $$ = strdup("char"); }
    | VOID { $$ = strdup("void"); }
    | STRING { $$ = strdup("std::string"); }
    | ID { $$ = $1; } // Allow user-defined types
;

parameter_list:
    parameter { $$ = strdup($1); }
    | parameter_list COMMA parameter {
        size_t len = strlen($1) + strlen($3) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s, %s", $1, $3);
        $$ = out;
    }
;

parameter:
    type ID {
        size_t len = strlen($1) + strlen($2) + 2;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s %s", $1, $2);
        $$ = out;
        free($1);
    }
    | type ARR ID {
        size_t len = strlen($1) + strlen($3) + 4;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s* %s", $1, $3);
        $$ = out;
        free($1);
    }
    | type LSQUARE RSQUARE ID {
        size_t len = strlen($1) + strlen($4) + 4;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s* %s", $1, $4);
        $$ = out;
        free($1);
    }
    | type ID LSQUARE RSQUARE {
        size_t len = strlen($1) + strlen($2) + 4;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s* %s", $1, $2);
        $$ = out;
        free($1);
    }
;

expr_list:
    expr { $$ = strdup($1); free($1); }
    | expr_list COMMA expr {
        size_t len = strlen($1) + strlen($3) + 3;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s, %s", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | /* empty */ { $$ = strdup(""); }
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
    type ID SEMICOLON {
        size_t len = strlen($1) + strlen($2) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s;\n", $1, $2);
        $$ = out;
        free($1); free($2);
    }
    | type ID ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($2) + strlen($4) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s = %s;\n", $1, $2, $4);
        $$ = out;
        free($1); free($2); free($4);
    }
    | type ARR ID ASSIGN LBRACE expr_list RBRACE SEMICOLON {
        size_t len = strlen($1) + strlen($3) + strlen($6) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s[] = {%s};\n", $1, $3, $6);
        $$ = out;
        free($1); free($3); free($6);
    }
    | type LSQUARE RSQUARE ID ASSIGN LBRACE expr_list RBRACE SEMICOLON {
        size_t len = strlen($1) + strlen($4) + strlen($7) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s[] = {%s};\n", $1, $4, $7);
        $$ = out;
        free($1); free($4); free($7);
    }
    | type ID LSQUARE RSQUARE ASSIGN LBRACE expr_list RBRACE SEMICOLON {
        size_t len = strlen($1) + strlen($2) + strlen($7) + 32;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s[] = {%s};\n", $1, $2, $7);
        $$ = out;
        free($1); free($2); free($7);
    }
    | type ID LSQUARE NUMBER RSQUARE ASSIGN LBRACE expr_list RBRACE SEMICOLON {
        size_t len = strlen($1) + strlen($2) + strlen($4) + strlen($8) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s[%s] = {%s};\n", $1, $2, $4, $8);
        $$ = out;
        free($1); free($2); free($4); free($8);
    }
    | type ID ASSIGN NEW ID LPAREN expr_list RPAREN SEMICOLON {
        size_t len = strlen($1) + strlen($2) + strlen($5) + strlen($7) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s = new %s(%s);\n", $1, $2, $5, $7);
        $$ = out;
        free($1); free($2); free($5); free($7);
    }
    | type LSQUARE RSQUARE ID ASSIGN NEW type LSQUARE expr RSQUARE SEMICOLON {
        size_t len = strlen($1) + strlen($4) + strlen($7) + strlen($9) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s %s[%s];\n", $1, $4, $9);
        $$ = out;
        free($1); free($4); free($7); free($9);
    }
    | BREAK SEMICOLON {
        $$ = strdup("        break;\n");
    }
    | RETURN expr SEMICOLON {
        size_t len = strlen($2) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    return %s;\n", $2);
        $$ = out;
        free($2);
    }
    | PRINT LPAREN expr RPAREN SEMICOLON {
        // Convert Java string concatenation to C++ stream insertion
        char* expr = $3;
        // Replace all occurrences of ' + ' with ' << ' for cout
        size_t len = strlen(expr) * 2 + 30; // enough for replacements
        char* out = (char*)malloc(len);
        out[0] = 0;
        char* p = expr;
        while (*p) {
            char* plus = strstr(p, "+");
            if (plus) {
                strncat(out, p, plus - p);
                strcat(out, " << ");
                p = plus + 1;
            } else {
                strcat(out, p);
                break;
            }
        }
        size_t final_len = strlen(out) + 30;
        char* final_out = (char*)malloc(final_len);
        snprintf(final_out, final_len, "    cout << %s << endl;\n", out);
        $$ = final_out;
        free(expr);
        free(out);
    }
    | INT ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    int %s = %s;\n", $2, $4);
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
    | DOUBLE ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    double %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | CHAR ID ASSIGN expr SEMICOLON {
        size_t len = strlen($2) + strlen($4) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    char %s = %s;\n", $2, $4);
        $$ = out;
        free($2);
        free($4);
    }
    | ID LSQUARE expr RSQUARE ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($3) + strlen($6) + 20;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s[%s] = %s;\n", $1, $3, $6);
        $$ = out;
        free($1); free($3); free($6);
    }
    | expr ASSIGN expr SEMICOLON {
        size_t len = strlen($1) + strlen($3) + 10;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s = %s;\n", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | expr LPAREN expr_list RPAREN SEMICOLON {
        size_t len = strlen($1) + strlen($3) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s(%s);\n", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | expr LPAREN RPAREN SEMICOLON {
        size_t len = strlen($1) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    %s();\n", $1);
        $$ = out;
        free($1);
    }
    | if_stmt { $$ = $1; }
    | FOR LPAREN for_init SEMICOLON cond SEMICOLON for_incr RPAREN LBRACE statements_or_empty RBRACE { 
        size_t len = strlen($3) + strlen($5) + strlen($7) + strlen($10) + 100;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    for (%s; %s; %s) {\n%s    }\n", $3, $5, $7, $10);
        $$ = out;
        free($3); free($5); free($7); free($10);
    }
    | FOR LPAREN for_init SEMICOLON cond SEMICOLON for_incr RPAREN statement { 
        size_t len = strlen($3) + strlen($5) + strlen($7) + strlen($9) + 100;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    for (%s; %s; %s)\n%s", $3, $5, $7, $9);
        $$ = out;
        free($3); free($5); free($7); free($9);
    }
    | WHILE LPAREN cond RPAREN statement {
        size_t len = strlen($5) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s)\n%s", $3, $5);
        $$ = out;
        free($3); free($5);
    }
    | WHILE LPAREN cond RPAREN LBRACE statements_or_empty RBRACE {
        size_t len = strlen($3) + strlen($6) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    while (%s) {\n%s    }\n", $3, $6);
        $$ = out;
        free($3); free($6);
    }
    | DO statement WHILE LPAREN cond RPAREN SEMICOLON {
        size_t len = strlen($2) + 50;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    do\n%s while (%s);\n", $2, $5);
        $$ = out;
        free($2); free($5);
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
    | switch_stmt { $$ = $1; }
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
    CASE expr COLON statements_or_empty {
        size_t len = strlen($2) + strlen($4) + 40;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    case %s: {\n%s    }\n", $2, $4);
        $$ = out;
        free($2); free($4);
    }
;

default_block:
    DEFAULT COLON statements_or_empty {
        size_t len = strlen($3) + 30;
        char *out = (char*)malloc(len);
        snprintf(out, len, "    default: {\n%s    }\n", $3);
        $$ = out;
        free($3);
    }
    | /* empty */ { $$ = strdup(""); }
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
    | NEW ID LPAREN expr_list RPAREN {
        size_t len = strlen($2) + strlen($4) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "new %s(%s)", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | NEW type LSQUARE expr RSQUARE {
        size_t len = strlen($2) + strlen($4) + 16;
        char *out = (char*)malloc(len);
        snprintf(out, len, "new %s[%s]", $2, $4);
        $$ = out;
        free($2); free($4);
    }
    | expr DOT ID { // member access
        size_t len = strlen($1) + strlen($3) + 2;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s.%s", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | expr LPAREN expr_list RPAREN { // method call on object
        size_t len = strlen($1) + strlen($3) + 8;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s(%s)", $1, $3);
        $$ = out;
        free($1); free($3);
    }
    | expr LPAREN RPAREN { // method call on object, no args
        size_t len = strlen($1) + 8;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s()", $1);
        $$ = out;
        free($1);
    }
    | expr LSQUARE expr RSQUARE { // array indexing
        size_t len = strlen($1) + strlen($3) + 4;
        char *out = (char*)malloc(len);
        snprintf(out, len, "%s[%s]", $1, $3);
        $$ = out;
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