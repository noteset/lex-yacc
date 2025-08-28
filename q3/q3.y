%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int flag = 0;
void yyerror(const char*);
int yylex(void);
%}

%union {
    int ival;
    char* sval;
}


%token <ival> NUMBER
%token <sval> IDENTIFIER

%token FOR
%token INT
%token SEMICOLON
%token LT GT LE GE EQ NE

%type <ival> expression

%start program


%right '='
%left LT GT LE GE EQ NE
%left '+' '-'
%left '*' '/' '%'

%%
program:
      statements_opt
    ;

statements_opt:
   
    | statements
    ;

statements:
      statements statement
    | statement
    ;


statement:
      assign_stmt
    | decl_stmt
    | FOR '(' expression SEMICOLON expression SEMICOLON expression ')' assign_stmt
      {
        printf("For loop parsed: init[%d]; cond[%d]; step[%d]\n", $3, $5, $7);
      }
    ;


assign_stmt:
      IDENTIFIER '=' expression SEMICOLON
      {
        printf("Assignment: %s = [expression evaluated to %d]\n", $1, $3);
        free($1);
      }
    ;


decl_stmt:
      INT IDENTIFIER '=' expression SEMICOLON
      {
        printf("Declaration: int %s = [expression evaluated to %d]\n", $2, $4);
        free($2);
      }
    ;


expression:
      expression '+' expression   { $$ = $1 + $3; }
    | expression '-' expression   { $$ = $1 - $3; }
    | expression '*' expression   { $$ = $1 * $3; }
    | expression '/' expression   { $$ = $1 / $3; }
    | expression '%' expression   { $$ = $1 % $3; }

    | expression LT expression    { $$ = ($1 <  $3); }
    | expression GT expression    { $$ = ($1 >  $3); }
    | expression LE expression    { $$ = ($1 <= $3); }
    | expression GE expression    { $$ = ($1 >= $3); }
    | expression EQ expression    { $$ = ($1 == $3); }
    | expression NE expression    { $$ = ($1 != $3); }

    | '(' expression ')'          { $$ = $2; }
    | NUMBER                      { $$ = $1; }
    | IDENTIFIER                  { $$ = 0; free($1); }
    | IDENTIFIER '=' expression   { $$ = $3; free($1); }
    ;
%%

int main() {
    printf("Enter statements (assignments, declarations, or for-loops):\n");
    yyparse();
    if (flag == 0)
        printf("Input is valid.\n");
    return 0;
}

void yyerror(const char* s) {
    printf("Error: %s\n", s);
    flag = 1;
}