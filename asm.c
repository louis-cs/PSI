#include "symboltable.h"
#include "asm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _asm_inst{
	char* inst;
	int a1;
	int a2;
	int a3;
}asm_inst;

int current_line;

asm_inst * instructions;

void init_asm() {
	instructions = malloc(MAXLINES * sizeof(asm_inst));
	current_line = 0;
	index_temp = 99;
}

void affectation(char * id) {
	symbol * s = getSymbol(id);

	if(s == NULL) {
		printf("%s is undefined\n", id);
		exit(EXIT_FAILURE);
	}

	asm_add("COP", s->address, 100, -1);
	index_temp = 99;
}

void temp_expr(operation op) {
	switch (op)
	{
	case PLUS:
		asm_add("ADD", index_temp-1, index_temp-1, index_temp);
		break;

	case MULT:
		asm_add("MULT", index_temp-1, index_temp-1, index_temp);
		break;

	case MINUS:
		asm_add("MINUS", index_temp-1, index_temp-1, index_temp);
		break;

	case DIV:
		asm_add("DIV", index_temp-1, index_temp-1, index_temp);
		break;

	case LT:
		asm_add("LT", index_temp-1, index_temp-1, index_temp);
		break;

	case GT:
		asm_add("GT", index_temp-1, index_temp-1, index_temp);
		break;

	case COMP:
		asm_add("EQU", index_temp-1, index_temp-1, index_temp);
		break;
	}

	printf("\n");

	index_temp--;
}

void tmp_tval(int val) {
	index_temp++;
	asm_add("AFC", index_temp, val, -1);
}

void tmp_tvar(char * id) {
	symbol * s = getSymbol(id);
	if(s == NULL) {
		printf("%s is undefined\n", id);
		exit(EXIT_FAILURE);
	}

	int addr = s->address;

	index_temp++;
	asm_add("COP", index_temp, addr, -1);
}

void print (char * id) {
	symbol * s = getSymbol(id);
	if(s == NULL) {
		printf("%s is undefined\n", id);
		exit(EXIT_FAILURE);
	}

	asm_add("PRI", s->address, -1, -1);
}

void printASM(){
	for(int i = 0; i < current_line; i++) {
		asm_inst inst = instructions[i];

		if(inst.a2 == -1)
			printf("%s %d \n", inst.inst, inst.a1);
		else if(inst.a3 == -1)
			printf("%s %d %d \n", inst.inst, inst.a1, inst.a2);
		else
			printf("%s %d %d %d\n", inst.inst, inst.a1, inst.a2, inst.a3);
	}
}

int asm_add(char * id, int a1, int a2, int a3){
	asm_inst new_instruct = {id, a1, a2, a3};
	instructions[current_line] = new_instruct;
	int current = current_line;
	current_line++;
	return current;
}

void modify_asm_jmf_at_line(int line_num, int nextline){
	instructions[line_num].a2 = nextline;
}

void modify_asm_jm_at_line(int line_num, int nextline) {
	instructions[line_num].a1 = nextline;
}

int get_next_line(){
	return current_line;
}