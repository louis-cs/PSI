typedef struct element {
    char *id;
    int address;
    int isConst;
    int isInit;
    int value;
    int depth;
} symbol;

#define MAXDEPTH (128)
#define MAXVAR (128)
#define STARTADDRESS (0)

int depth;
int currentAddress;
symbol ** symboltable;
int* varcount;

void init_symboltable();

void addSymbol(char* id, int isConst, int isInit);

void incrementDepth();

void decrementDepth();



symbol* getSymbol(char * id);
