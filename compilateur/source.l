%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "y.tab.h"

	const int DEBUG = 0;

	void debug(char * s) {
		if(DEBUG)
			printf("%s", s);
	}
%}

Var         ([a-zA-Z][a-zA-Z0-9_]*)
Exp         e{Sign}{Digit}+

%%

"main"              {debug("main"); return tMAIN;}
"if"                {debug("if "); return tIF;}
"else"              {debug("else "); return tELSE;}
"while"             {debug("while "); return tWHILE;}
"printf"			{debug("printf "); return tPRINT;}
"const"				{debug("const"); return tCONST;}

"int"               {debug("int"); return tINT;}

"{"                 {debug("OB\n"); return tOB;}
"}"                 {debug("CB\n"); return tCB;}
"("					{debug("OP"); return tOP;}
")"					{debug("CP"); return tCP;}
","                 {debug("tC"); return tC;}
";"                 {debug(";\n"); return tSC;}
"="					{debug("="); return tEQUAL;}
"+"					{debug("+"); return tPLUS;}
"-"					{debug("-"); return tMINUS;}
"/"					{debug("/"); return tDIV;}
"*"					{debug("*"); return tMULT;}
"<"					{debug("<"); return tLT;}
">"                 {debug(">"); return tGT;}
"=="				{debug("=="); return tCOMP;}

[0-9]+              {
						debug("number");
						yylval.intValue = atoi(yytext);
						return tVAL;
					}

{Var}               {
						debug("var");
						yylval.stringValue = strdup(yytext);
						return tVAR;
					}
					
[ \t\n]+            {debug(" ");}
%%
