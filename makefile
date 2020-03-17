all:
	lex source.l
	yacc -d source.y
	gcc lex.yy.c y.tab.c -ly -ll