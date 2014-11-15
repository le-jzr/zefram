
SPECFILE=../spec/ast.def

all: zsinterp

tools/astgen-go-defs:
	GOPATH=$(PWD)/tools/go go get github.com/zarevucky/astgen/tools/astgen-go-defs
	mv tools/go/bin/astgen-go-defs tools

tools/astgen-go-splparser:
	GOPATH=$(PWD)/tools/go go get github.com/zarevucky/astgen/tools/astgen-go-splparser
	mv tools/go/bin/astgen-go-splparser tools

ast_generated.go: tools/astgen-go-defs tools/astgen-go-splparser $(SPECFILE)
	echo "// This file is generated from $(SPECFILE); DO NOT MODIFY." > $@
	echo >> $@
	echo "package main" >> $@
	echo 'import "log"' >> $@
	echo 'import "github.com/zarevucky/spl"' >> $@
	echo >> $@
	tools/astgen-go-defs $(SPECFILE) >> $@
	echo >> $@
	tools/astgen-go-splparser $(SPECFILE) >> $@
	go fmt $@

zsinterp: *.go ast_generated.go 
	go build -o zsinterp

clean:
	rm -rf ast_generated.go tools zsinterp
