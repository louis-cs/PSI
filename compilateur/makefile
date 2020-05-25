all:
	lex source.l
	yacc -d source.y
	gcc lex.yy.c y.tab.c symboltable.c asm.c -ly -ll