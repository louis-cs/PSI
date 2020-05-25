#include "symboltable.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>


void init_symboltable() {
	depth = 0;
	currentAddress = 0;

	symboltable = malloc(sizeof(symbol*) * MAXDEPTH);
	varcount = malloc(sizeof(int) * 100);
	
	symboltable[depth] = malloc(sizeof(symbol) * MAXVAR);
	varcount[depth] = 0;
}

void addSymbol(char* id, int isConst, int isInit) {
	symbol* s = getSymbol(id);
	if(s) {
		if(s->depth == depth) {
			printf("Var %s already exists\n", id);
			exit(EXIT_FAILURE);
		}			
	}

	symbol newSymbole;

	newSymbole.id = id;
	newSymbole.depth = depth;

	for(int i = 0; i <= depth; i++) {
		currentAddress = STARTADDRESS + varcount[i];
	}

	newSymbole.address = currentAddress;

	newSymbole.isConst = isConst;
	newSymbole.isInit = isInit;

	int nbvar = varcount[depth];
	symboltable[depth][nbvar] = newSymbole;
	
	varcount[depth]++;
}

symbol* getSymbol(char * id) {
	for(int j = depth; j > 0; j--) {
		for(int i = 0; i < varcount[j]; i++) {
			if(strcmp(symboltable[j][i].id, id) == 0) {
				return &symboltable[j][i];
			}
		}
	}

	return NULL;
}

void incrementDepth() {
	depth++;
	symboltable[depth] = malloc(sizeof(symbol) * MAXVAR);
	varcount[depth] = 0;
}

void decrementDepth() {
	free(symboltable[depth]);
	varcount[depth] = 0;
	depth--;
}