/*bison -y prog3-1.y
gcc y.tab.c -ly -o expr3*/

%{
#include <stdio.h>
%}

/*　開始記号を明示 */
%start line

%%

line : expr '\n' { printf("%d \n", $1); };

expr : expr '+' term { $$ = $1 + $3; } |
       expr '-' term { $$ = $1 - $3; } |
       term { $$ = $1; } ;

term : term '*' factor { $$ = $1 * $3; } |
       term '/' factor { $$ = $1 / $3; } |
       factor { $$ = $1; } ;

factor: '(' expr ')' { $$ = $2; } |
        NUM { $$ = $1; };

NUM : DIGIT { $$ = $1; } |
      NUM DIGIT { $$ = $1 * 10 + $2; };

DIGIT : '0' { $$ = 0; } |
        '1' { $$ = 1; } |
        '2' { $$ = 2; } |
        '3' { $$ = 3; } |
        '4' { $$ = 4; } |
        '5' { $$ = 5; } |
        '6' { $$ = 6; } |
        '7' { $$ = 7; } |
        '8' { $$ = 8; } |
        '9' { $$ = 9; };

%%

#include <stdio.h>

yylex() {
  int c;
  while((c = getchar()) == ' ');
  return c;
}
