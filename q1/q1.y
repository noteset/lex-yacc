%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);
char *c=NULL;
%}

%token INT FLOAT CHAR
%token IDENTIFIER
%token SEMICOLON COMMA

%union {
    char* str;
}

%start program
%type <str> IDENTIFIER
%type <str> datatype



%%
program:
    declarations
    ;

declarations:
    declarations declaration
    | declaration
    ;

declaration:
    datatype var_list SEMICOLON {
    printf("Declared variable:%s of type %s\n",$1,c);
    free(c);
    c=NULL;
    }
    ;
var_list:
    IDENTIFIER{
    printf("Declared variable:%s of type %s\n",$1,c);
    free($1);
    }|var_list COMMA IDENTIFIER{
    printf("Declared variable:%s of type %s\n",$3,c);
    free($3);
    };

datatype:
    INT     { c = strdup("int");
    $$=c; }
    | FLOAT { c= strdup("float"); $$=c;}
    | CHAR  { c= strdup("char");$$=c; }
    ;
%%

int main() {
    printf("Enter variable declarations:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}