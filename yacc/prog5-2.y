/* メモリ付き関数電卓プログラムの字句定義 */

%{
  #include "y.tab.h"
%}

ws [ \t]
symbol [=+\-*/\^()[\]\n]
digit [0-9]
other .
/* .はすべての文字にmatchする */
%%

{ws}+
{symbol} { return (yytext[0]); }
"M" { return (MEM); }
"exp" { return (EXP); }
"log" { return (LOG); }
"sqrt" { return (SQRT); }
{digit}+ {
  sscanf(yytext, "%d", &yylval.rval);
  return(INITC);
}
{digit}+"."{digit}* {
  sscanf(yytext, "%lf", &yylval.rval);
  return(REALC);
}
{other} {
  fprintf(stderr, "Illegal char '%c' ignored\n", yytext[0]);
}

%%
