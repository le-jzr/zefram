
ZSOURCE = \
	buffer.zs \
	package.zs \
	spl.zs \
	testvisitor.zs

ZSPARSE = sh shell/zsparse.sh
ZSCHECK = sh shell/zscheck.sh
ZSEMIT = sh shell/zsemit.sh

ZSINTERP = ../interpreter/zsinterp.sh

all:
	$(MAKE) bootstrap
	$(MAKE) zsparse zscheck zsemit
	$(MAKE) realdeal
	$(MAKE) zsparse zscheck zsemit

ast/ast.zs: ../tools/parsergen/zefram_ast ../tools/parsergen/zefram_parser ../ast.def
	../tools/parsergen/zefram_ast ../ast.def > ast/ast.zs
	../tools/parsergen/zefram_parser ../ast.def >> ast/ast.zs

ast/visitor.zs: ../tools/parsergen/zefram_visitor_iface ../ast.def
	../tools/parsergen/zefram_visitor_iface ../ast.def > ast/visitor.zs

ast/visitor_methods.zs: ../tools/parsergen/zefram_visitor_impl ../ast.def
	../tools/parsergen/zefram_visitor_impl ../ast.def > ast/visitor_methods.zs
	

bootstrap:
	rm -rf shell
	mkdir shell
	echo '`dirname $$0`/../../cparser/zsparser $$@' > shell/zsparse.sh
	#echo '`dirname $$0`/../$(ZSINTERP) --builtinenv env --package ast `dirname $$0`/../ast --package parser `dirname $$0`/../parser --run parser.main -- $$@' > shell/zsparse.sh
	echo '`dirname $$0`/../$(ZSINTERP) --builtinenv env --package ast `dirname $$0`/../ast --package checker `dirname $$0`/../checker --run checker.main -- $$@' > shell/zscheck.sh
	echo '`dirname $$0`/../$(ZSINTERP) --builtinenv env --package ast `dirname $$0`/../ast --package emitter `dirname $$0`/../emitter --run emitter.main -- $$@' > shell/zsemit.sh

realdeal:
	rm -rf shell
	mkdir shell
	#mv ./zsparse shell/bsparse
	mv ./zscheck shell/bscheck
	mv ./zsemit shell/bsemit
	echo '`dirname $$0`/../parser/zsparse $$@' > shell/zsparse.sh
	#echo '`dirname $$0`/bsparse $$@' > shell/zsparse.sh
	echo '`dirname $$0`/bscheck $$@' > shell/zscheck.sh
	echo '`dirname $$0`/bsemit $$@' > shell/zsemit.sh

libzefram.spl: $(ZSOURCE)
	cat $(ZSOURCE) | $ZSPARSE > libzefram.spl

libzefram.rspl: libzefram.spl
	cat libzefram.spl | $ZSCHECK --package ast ./ast > libzefram.rspl

zsparse:

checker_ast.spl: checker/*.zs
	cat checker/*.zs | $(ZSPARSE) > checker_ast.spl

checker_ast.checked: ast.spl util.spl checker_ast.spl
	$(ZSCHECK) --package ast ast.spl --package util util.spl --check checker_ast.spl -o checker_ast.checked

zscheck.c: checker_ast.checked
	$(ZSEMIT) < checker_ast.checked > zscheck.c

zscheck: zscheck.c
	gcc -Wall -Wextra -pedantic -std=ansi -o zscheck zscheck.c

