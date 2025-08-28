%{ 
   /* Definition section */
  #include "y.tab.h" 
%} 
  
/* Rule Section */
%% 
[\t\n]+ ;
";"  {return SEMICOLON;}
[a-zA-Z0-9]+  {yylval.str=strdup(yytext); return IDENTIFIER;}
"="                     { return '='; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"%"                     { return '%'; }
"("                     { return '('; }
")"                     { return ')'; }
  
. 
  
%% 
  
int yywrap() 
{ 
 return 1; 
}