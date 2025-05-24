
all:
	bison -d parser.y
	flex lexer.l
	gcc -o java2cpp parser.tab.c lex.yy.c -lfl
