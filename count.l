%{
#include <stdio.h>
int line_count = 0;
int word_count = 0;
int char_count = 0;
%}

%%

\n      { line_count++; char_count++; }
[ \t]+  { char_count += yyleng; } // Count spaces and tabs as characters
[a-zA-Z]+ { word_count++; char_count += yyleng; }
.       { char_count++; }

%%

int yywrap() {
    return 1;
}

int main(int argc, char **argv) {
    yylex();
    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", char_count);
    return 0;
}

