%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>

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
        yyparse();
    }
%}

%token tC tCONST tOP tCP tOB tCB tSC tMAIN tINT tVAR tPLUS tMINUS tDIV tEQUAL tMULT tPRINT
%token <intValue> tVAL

%union 
{
    int intValue;
    char * stringValue;
}

%type<intValue> expression

%left tPLUS tMINUS
%left tDIV tMULT

%start input

%%

input: MainStart;

MainStart: tMAIN tOP params tCP tOB lines tCB;

params      : param tC params 
            | param;

param       : tINT tVAR;

lines       : line tSC lines 
            | line;

line        : expression;

expression  : tVAL {$$=$1 ;}
            | expression tPLUS expression {$$=$1+$3 ;}
            | expression tMINUS expression {$$=$1-$3 ;}
            | expression tMULT expression {$$=$1*$3 ;}
            | expression tDIV expression {$$=$1/$3 ;};


%%
   