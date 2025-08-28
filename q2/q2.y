%{ 
   /* Definition section */
  #include<stdio.h> 
  #include <stdlib.h>
  #include <string.h>
  int flag=0; 
  void yyerror(const char*s);
  int yylex();
%}

%union {
char* str;
}

%start assignment_list
%token <str> IDENTIFIER
%token SEMICOLON


%left '+' '-' '='
%left '*' '/' '%' 
%left '(' ')'
%type <str> E
 
/* Rule Section */
%% 
  
  
assignment_list:assignment_list assignment|assignment;
assignment: IDENTIFIER'='E SEMICOLON {printf("valid %s:%s\n",$1,$3);}

 E:E'+'E {asprintf(&$$, "%s+%s", $1, $3);} 
  
 |E'-'E {asprintf(&$$, "%s-%s", $1, $3);} 
  
 |E'*'E {asprintf(&$$, "%s*%s", $1, $3);} 
  
 |E'/'E {asprintf(&$$, "%s/%s", $1, $3);} 
  
 |E'%'E {asprintf(&$$, "%s%%%s", $1, $3);} 
  
 |'('E')' {asprintf(&$$, "(%s)", $2);} 
 |IDENTIFIER {$$ = strdup($1);}
  ;
  
%% 
  
//driver code 
void main() 
{ 
  printf("\nEnter Any Arithmetic Expression with operations Addition, Subtraction, Multiplication, Division, Modulus and Round brackets:\n"); 
   yyparse(); 
   if(flag==0) 
   	printf("\nEntered arithmetic expression is Valid\n\n"); 
} 
  
void yyerror(const char *s) 
{ 
   printf("\nEntered arithmetic expression is Invalid\n\n"); 
   flag=1; 
}