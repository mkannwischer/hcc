%{
//Prologue

#include "hcc.h"
#include "queue.h"
#include <string.h>

%}
//Bison declarations

%error-verbose

// Define all tokens used in the source code
%start programm
%token ID id DOT IFTHEN
%token OPA CPA COMMA


%union{
	int ival; 
	float fval;
	char* sval;
	queue *qval;
}

%type<sval> ID
%type<sval> id
%type<sval> expression
%type<qval> expressionList





%%    // grammar rules

programm
    : programm clause
	|
    ;
	
clause
	: h_beginOfClause head IFTHEN body 	{
											print_debug();
										}
	| h_beginOfClause head DOT			{
											print_debug();
										}
	;
h_beginOfClause 
	: 	{
			init_new_clause();
		}
	;
	
head 
	: literal
	;
body 
	: literal DOT
	| literal COMMA body
	;

literal
	: id OPA expressionList CPA 
								{ 
									add_predicate($1);
									add_literal($1,$3)
								}
	;	

expressionList 
	: expression   							{
												$$ = queue_new();
												char *ex = (char *) strdup($1);
												queue_enqueue($$, ex);
											}
	| expressionList COMMA expression		{
												char *ex = (char *) strdup($3);
												$$=$1;
												queue_enqueue($$, ex);
											}
	;
	
expression 
	: id   
			{
				$$=$1;
			}
	| ID	{
				$$=$1
			}
	;

	
%%