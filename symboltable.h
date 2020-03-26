typedef struct element {
    char *id;
    int address;
    int isConst;
    int isInit;
    int value;
    int depth;
} symbol;

int depth;
int currentAddress;
symbol *symboltable;

void init();

void addSymbol(char* id, int isConst, int isInit);

void incrementDepth();

void decrementDepth();
