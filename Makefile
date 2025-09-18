all:
	flex main.l
	gcc lex.yy.c -lfl -o rec