%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include "symboltable.h"
    #include "asm.h"

    #define true 1
    #define false 0

    int yywrap();
    int yylex();
    int yyparse();

    void yyerror(const char *str)
    {
            fprintf(stderr,"error: %s\n",str);
    }
    
    int yywrap()
    {
        return 1;
    } 

    int main(void){
        init_symboltable();
        init_asm();
        yyparse();
        printASM();
    }
%}

%union 
{
    int intValue;
    char * stringValue;
}

%token tC tCONST tOP tCP tOB tCB tSC tMAIN tINT tPLUS tMINUS tDIV tEQUAL tMULT tPRINT tLT tGT tCOMP
%token <intValue> tVAL tIF tELSE tWHILE
%token <stringValue> tVAR

%type<intValue> expression if1

%left tPLUS tMINUS
%left tDIV tMULT

%start input

%%

input: MainStart;

MainStart: tMAIN tOP tCP OB instructions CB;

OB: tOB { incrementDepth(); };
CB: tCB { decrementDepth(); };

instructions: instruction instructions 
            | instruction;

instruction: define tSC| print tSC| assignVar tSC| if | while | tSC;

defineConst: tVAR tEQUAL expression {
                    addSymbol($1, true, true);
                    affectation($1);
                };

defineInt: tVAR {
                    addSymbol($1, false, false);
                }
            | tVAR tEQUAL expression {
                    addSymbol($1, false, true);
                    affectation($1);
                };

define: tINT defineInts
        | tCONST defineConsts;

defineConsts: defineConst tC defineConsts
            | defineConst;

defineInts: defineInt tC defineInts
            | defineInt;

assignVar: tVAR tEQUAL expression {
				char* name = $1;
                affectation(name);
			};

expression: tVAL {tmp_tval($1);}
            | tVAR {tmp_tvar($1);}
            | tOP expression tCP {$$ = $2;}
            | expression tPLUS expression {temp_expr(PLUS);}
            | expression tMINUS expression {temp_expr(MINUS);}
            | expression tMULT expression {temp_expr(MULT);}
            | expression tDIV expression {temp_expr(DIV);}
			| expression tLT expression {temp_expr(LT);}
			| expression tGT expression {temp_expr(GT);}
			| expression tCOMP expression {temp_expr(COMP);}
            ;

print: tPRINT tOP tVAR tCP {print($3);};

if: if1 {modify_asm_jmf_at_line($1, get_next_line());}
    | if1 tELSE {$2 = asm_add("JMP",-1,-1,-1); modify_asm_jmf_at_line($1, get_next_line());} OB instructions CB {modify_asm_jm_at_line($2, get_next_line());};

if1: tIF tOP expression tCP {$1 = asm_add("JMF", index_temp--, -1, -1);} OB instructions CB {$$ = $1;};

while: tWHILE tOP expression tCP {$1 = asm_add("JMF", index_temp--, -1, -1);} OB instructions CB {int temp = asm_add("JMP", $1, -1, -1); modify_asm_jmf_at_line($1, get_next_line());};

%%
   