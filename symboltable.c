#include "symboltable.h"
#include <stdlib.h>
#include <stdio.h>


void init() {
    depth = 0;
    currentAddress = 0;
    symboltable = malloc(sizeof(symbol) * 100);
}

void addSymbol(char* id, int isConst, int isInit) {
    symbol newSymbole;

    newSymbole.address = currentAddress;
    newSymbole.depth = depth;
    newSymbole.id = id;
    newSymbole.isConst = isConst;
    newSymbole.isInit = isInit;
    symboltable[currentAddress] = newSymbole;
    currentAddress += 1;
}

void incrementDepth() {
    depth++;
}

void decrementDepth() {
    depth--;
}