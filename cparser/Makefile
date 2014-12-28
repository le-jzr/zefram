CFLAGS += -std=gnu99 -g

zsparser: parser.tab.o lex.yy.o
	$(CC) parser.tab.o lex.yy.o -o zsparser

tools/astgen-yacc4spl:
	GOPATH=$(PWD)/tools/go go get -u github.com/zarevucky/astgen/tools/astgen-yacc4spl
	mv tools/go/bin/astgen-yacc4spl tools

parser.y: tools/astgen-yacc4spl ../spec/ast.def
	tools/astgen-yacc4spl ../spec/ast.def > parser.y

parser.tab.c parser.tab.h: parser.y
	bison -fcaret -fdiagnostics-show-caret --locations -t -d --report=all parser.y

lex.yy.c: parser.lex parser.tab.h
	flex --yylineno --bison-bridge --bison-locations parser.lex

clean:
	rm -rf parser.tab.o lex.yy.o parser.tab.c parser.tab.h parser.output lex.yy.c parser.y zsparser tools
