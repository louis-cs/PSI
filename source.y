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

instruction: define 
            | expression;

expression: tVAL {$$=$1 ;}
            | expression tPLUS expression {$$=$1+$3 ;}
            | expression tMINUS expression {$$=$1-$3 ;}
            | expression tMULT expression {$$=$1*$3 ;}
            | expression tDIV expression {$$=$1/$3 ;};

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

%%
   