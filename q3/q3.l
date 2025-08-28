%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"for"           { return FOR; }
"int"           { return INT; }

"=="            { return EQ; }
"!="            { return NE; }
"<="            { return LE; }
">="            { return GE; }
"<"             { return LT; }
">"             { return GT; }

";"             { return SEMICOLON; }
"="             { return '='; }
"("             { return '('; }
")"             { return ')'; }

[0-9]+          { yylval.ival = atoi(yytext); return NUMBER; }

[a-zA-Z_][a-zA-Z0-9_]*  { yylval.sval = strdup(yytext); return IDENTIFIER; }

[ \t\r\n]+      { /* ignore whitespace */ }

.               { return yytext[0]; }

%%

int yywrap(void) { return 1; }