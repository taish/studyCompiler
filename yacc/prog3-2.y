%{
#include <stdio.h>
%}

/*　開始記号を明示 */
%start line

%token NUM

%%

line : expr '\n' { printf("%d \n", $1); };

expr : expr '+' term { $$ = $1 + $3; } |
       expr '-' term { $$ = $1 - $3; } |
       term;

term : term '*' factor { $$ = $1 * $3; } |
       term '/' factor { $$ = $1 / $3; } |
       factor { $$ = $1; } ;

factor: '(' expr ')' { $$ = $2; } |
        NUM;

%%

#include <stdio.h>
#include <ctype.h>

yylex() {
  int c;
  while((c = getchar()) == ' ');
  if(isdigit(c)) {
    yylval = c - '0'
    while(c = getchar());
      yylval = yylval * 10 + (c - '0');
    ungetc(c, stdin);
    return NUM;
  }
  return c;
}
