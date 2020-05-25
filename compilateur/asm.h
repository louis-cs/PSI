#define MAXLINES (1024)

typedef enum {PLUS, MINUS, DIV, MULT, LT, GT, COMP} operation;

int index_temp;

void init_asm();
void affectation(char* id);
void temp_expr(operation op);
void tmp_tval(int addr);
void tmp_tvar(char* id);
void print (char * id);
int asm_add(char * id, int var1, int var2, int var3);
void printASM();
void modify_asm_jmf_at_line(int line_num, int nextline);
void modify_asm_jm_at_line(int line_num, int nextline);
int get_next_line();
