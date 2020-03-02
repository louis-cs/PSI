%{
    #include <stdio.h>
%}

OB          \{
CB          \}
OP          "("
CP          ")"
Digit       [0-9]
Sign        [+-]?
Const       "const"
Int         "int"
Var         ([a-zA-Z][a-zA-Z0-9_]*)
Equal       "="
Operator    "+"|"-"|"*"|"/"|"="
Sep         [ \t]+
Endline     "\n"
Endinst     \;
Main        main\(.*\)
Return      return
Print       printf
Float       {Sign}{Digit}+"."+{Digit}+
Exp         e{Sign}{Digit}+
VarType     {Int}|{Float}



%%
    /*Syntaxe globale du fichier*/
{Sep}               printf(" ");
{OB}                printf("OB\n");
{CB}                printf("CB\n");
{Endinst}           printf(";");
{Endline}           printf("\n");
{Main}              printf("main()");
{Return}            printf("returning");

    /*identificateur de type, var en dernier (si c'est rien d'autre)*/
{Const}{Sep}{VarType}{Sep}{Var}","({Sep}{Var}{Sep}?)*       printf("declaration de plusieurs constantes");
{Const}             printf("const");
{VarType}{Sep}{Var}","({Sep}{Var}{Sep}?)*       printf("declaration de plusieurs var");
{Int}               printf("declaration d'un int");
{Float}{Exp}?       printf("float");

{Var}               printf("var");

    /*opérateurs arithmétiques*/
{Sign}{Digit}+      printf("number");
"e"{Sign}{Digit}+
{Equal}             printf("equal");

    /* operations */
{Print}{OP}{Var}{CP}    printf("printing var");


%%
int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}




