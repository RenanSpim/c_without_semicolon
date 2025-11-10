all:
	bison -d -o ./bibi.tab.c ./bibi.y
	flex main.l
	gcc lex.yy.c bibi.tab.c -lfl -o rec