%{
#include<stdio.h>
#include<string.h>
%}
%%
abc {printf("ABC");}
. printf("%c",yytext[0]);
%%
int main()
{
yylex();
}
int yywrap()
{
return 1;
}
