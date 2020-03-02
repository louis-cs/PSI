all:
	lex source.l
	gcc lex.yy.c -o analyseur_lexical