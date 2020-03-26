%{
    #include <stdio.h>
    #include "y.tab.h"
%}

Var         ([a-zA-Z][a-zA-Z0-9_]*)
Exp         e{Sign}{Digit}+

%%

"main"              {printf("main"); return tMAIN;}
"if"                {printf("if "); return tIF;}
"else"              {printf("else "); return tELSE;}
"while"             {printf("while "); return tELSE;}
"printf"			{printf("printf"); return tPRINT;}
"const"				{printf("const"); return tCONST;}

"int"               {printf("int"); return tINT;}

"{"                 {printf("OB\n"); return tOB;}
"}"                 {printf("CB\n"); return tCB;}
"("					{printf("OP"); return tOP;}
")"					{printf("CP"); return tCP;}
","                 {printf(","); return tC;}
";"                 {printf(";\n"); return tSC;}
"="					{printf("="); return tEQUAL;}
"+"					{printf("+"); return tPLUS;}
"-"					{printf("-"); return tMINUS;}
"/"					{printf("/"); return tDIV;}
"*"					{printf("*"); return tMULT;}

[0-9]+              {
                        printf("number");
                        yylval.intValue = atoi(yytext);
                        return tVAL;
                    }

{Var}               {
						printf("var");
						yylval.stringValue = yytext;
						return tVAR;
					}
                    
[ \t\n]+            {printf(" ");}
%%
