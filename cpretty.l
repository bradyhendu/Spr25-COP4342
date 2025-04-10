/*
 *Name: Brady Henderson
 *Assignment 10: cpretty - lexical analysis for a C pretty printer
 *Purpose: This program reads a C source file from standard input and produces a formatted
 * output compatible with groff for typesetting. It applies different fonts to reserved
 * words, comments, strings, character literals, and numbers while maintaining the
 * overall structure of the source code.
*/

%{
#include <stdio.h>
%}

%option noyywrap

%%

(auto|break|case|char|continue|default|do|double|else|extern|float|for|goto|if|int|long|register|return|short|sizeof|static|struct|switch|typedef|union|unsigned|void|while) {
    printf("\\f(CB%s\\f(CR", yytext);
}


"/*"([^*]|"*"+[^*/])*"*/" {
    printf("\\f(CI%s\\f(CR", yytext);
}

"//".* {
    printf("\\f(CI%s\\f(CR", yytext);
}

\"([^\"]|\\.)*\" {
    printf("\\fB%s\\f(CR", yytext);
}

[0-9]+ {
    printf("\\f5%s\\f(CR", yytext);
}

'([^']|\\.)' {
    printf("%s", yytext);  // Print character literals as-is
}

\n {
    printf("\n");
}

. {
    printf("%s", yytext);
}

%%

int main() {
    printf(".fp 5 CBI\n.ft CR\n.nf\n");
    yylex();
    return 0;
}