%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include "symboltable.h"

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
        init();
        yyparse();
    }
%}

%union 
{
    int intValue;
    char * stringValue;
}

%token tC tCONST tOP tCP tOB tCB tSC tMAIN tINT tPLUS tMINUS tDIV tEQUAL tMULT tPRINT tIF tELSE
%token <intValue> tVAL
%token <stringValue> tVAR


%type<intValue> expression

%left tPLUS tMINUS
%left tDIV tMULT

%start input

%%

input: MainStart;

MainStart: tMAIN tOP tCP tOB instructions tCB;

instructions: instruction tSC instructions 
            | instruction tSC;

instruction: define | expression | print | assignVar;

expression: tVAL
            | tVAR
            | tOP expression tCP
            | expression tPLUS expression
            | expression tMINUS expression
            | expression tMULT expression
            | expression tDIV expression;

define: tINT defineInts
        | tCONST defineConsts;

defineConsts: defineConst tC defineConsts
            | defineConst;

defineInts: defineInt tC defineInts
            | defineInt;

defineConst: tVAR tEQUAL tVAL {
                    char* name = $1;
                    addSymbol(name, true, true);
                }
            | tVAR {
                    char* name = $1;
                    addSymbol(name, true, false);
            };

defineInt: tVAR {
                    char* name = $1;
                    addSymbol(name, false, false);
                }
            | tVAR tEQUAL tVAL {
                    char* name = $1;
                    addSymbol(name, false, true);
                };

assignVar: tVAR tEQUAL expression;

print: tPRINT tOP tVAR tCP;

%%
   