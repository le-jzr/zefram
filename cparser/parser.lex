%option noyywrap
%option reentrant
%option bison-locations
%option bison-bridge

%{
	#include <stdbool.h>
	#include <stdio.h>
		
	#include "parser.tab.h"
	
	
	bool semi = false;
%}

%x comment

%%

type                    semi = true; return SYM_TYPE;
func                    semi = true; return SYM_FUNC;
var                     semi = true; return SYM_VAR;
break                   semi = true; return SYM_BREAK;
continue                semi = true; return SYM_CONTINUE;
return                  semi = true; return SYM_RETURN;
switch                  semi = true; return SYM_SWITCH;
case                    semi = true; return SYM_CASE;
default                 semi = true; return SYM_DEFAULT;
if                      semi = true; return SYM_IF;
else                    semi = true; return SYM_ELSE;
while                   semi = true; return SYM_WHILE;
is                      semi = true; return SYM_IS;
own                     semi = true; return SYM_OWN;
new                     semi = true; return SYM_NEW;
delete                  semi = true; return SYM_DELETE;
struct                  semi = true; return SYM_STRUCT;
interface               semi = true; return SYM_INTERFACE;
range                   semi = true; return SYM_RANGE;
ensures                 semi = true; return SYM_ENSURES;
requires                semi = true; return SYM_REQUIRES;
may_fail                semi = true; return SYM_MAY_FAIL;
assert                  semi = true; return SYM_ASSERT;
invariant               semi = true; return SYM_INVARIANT;
fail                    semi = true; return SYM_FAIL;
assume                  semi = true; return SYM_ASSUME;
sanity_check            semi = true; return SYM_SANITY_CHECK;
recursion_bound         semi = true; return SYM_RECURSION_BOUND;
loop_bound              semi = true; return SYM_LOOP_BOUND;
all                     semi = true; return SYM_ALL;

"&&"                    semi = false; return SYM_AMPAMP;
"||"                    semi = false; return SYM_PPPP;

"=="                    semi = false; return SYM_EQEQ;
">="                    semi = false; return SYM_GTEQ;
"<="                    semi = false; return SYM_LTEQ;
"!="                    semi = false; return SYM_BANGEQ;

"<<"                    semi = false; return SYM_LTLT;
">>"                    semi = false; return SYM_GTGT;

"!!"                    semi = true; return SYM_BANGBANG;
"++"                    semi = true; return SYM_PLUSPLUS;
"--"                    semi = true; return SYM_DASHDASH;

"\.\."                  semi = false; return SYM_DOTDOT;

[a-zA-Z_][a-zA-Z0-9_]*  *yylval = SExString(yytext); semi = true; return IDENTIFIER;

[1-9][0-9]*             *yylval = SExString(yytext); semi = true; return DECIMAL;
0[0-7]*                 *yylval = SExString(yytext); semi = true; return OCTAL;
0[xX][0-9a-fA-F]+       *yylval = SExString(yytext); semi = true; return HEXADECIMAL;
[0-9][0-9a-zA-Z]+       fprintf(stderr, "Invalid numeric constant\n"); exit(1);

\"\"                    *yylval = SExString(""); semi = true; return STRING;
\"([^\"\\]|(\\.))*\"    *yylval = SExString(UnescapeString(yytext)); semi = true; return STRING;
\'([^\'\\]|(\\.))*\'    *yylval = SExString(UnescapeString(yytext)); semi = true; return CHAR;

"//"[^\n]*              /* Ignore comment. */

"/*"                    BEGIN(comment);
<comment>[^*]*          /* eat anything that's not a '*' */
<comment>"*"+[^*/]*     /* eat up '*'s not followed by '/'s */
<comment>"*"+"/"        BEGIN(INITIAL);

"\n"                    if (semi) { semi = false; return ';'; }
[ \t]                   /* Ignore space. */

[\)\}\]]                semi = true; return (unsigned)*yytext;
[\(\{\[,:;\+\*\/\%\-\.\=\<\>\@\&\|!\?] semi = false; return (unsigned)*yytext;

.                       fprintf(stderr, "Unexpected character: '%s'\n", yytext); exit(1);
