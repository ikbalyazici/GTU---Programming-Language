#include <stdio.h>
#include "gpp_lexer.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[] = {NULL, "KW_AND", "KW_OR", "KW_NOT", "KW_EQUAL", "KW_LESS", "KW_NIL", "KW_LIST", "KW_APPEND", "KW_CONCAT", "KW_SET", "KW_DEFFUN", "KW_FOR", "KW_IF", "KW_EXIT", "KW_LOAD", "KW_DISP", "KW_TRUE", "KW_FALSE", "OP_PLUS", "OP_MINUS", "OP_DIV", "OP_DIV2", "OP_MULT", "OP_OP", "OP_CP", "OP_OC", "OP_CC", "OP_COMMA", "COMMENT", "INTEGER", "REALNUM", "IDENTIFIER", "OP_DBLMULT"};

int main(){
	int n_token, v_token;
	
	n_token = yylex();
	while(n_token){
		printf("%s\n",names[n_token]);
		n_token = yylex();	
		
	}
	return 0;
}




