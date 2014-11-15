package main

import (
	"github.com/zarevucky/spl"
	"os"
	"os/exec"
	pathpkg "path"
	"strings"
)

type Application struct {
	Packages map[string]*Package
}

func NewApplication() *Application {
	return &Application{make(map[string]*Package)}
}

// This method loads the builtin "environment" package into the program context
// under a given name. The package contains very basic methods for interfacing
// with operating system (files, output, program args, etc...).
// It only provides the bare minimum of methods necessary for implementing
// a full-featured self-hosting compiler.
func (app *Application) LoadBuiltinEnv(name string) {
	envpkg := NewPackage("<builtin_env>")
	app.Packages[name] = envpkg

	// Takes arbitrary number of arguments, and prints each of them to
	// the standard output, with nothing in between or at the end.
	// It should only be used to print strings and integers if
	// well-defined result is required, but other values may be printed
	// for human debugging.
	envpkg.Methods["print"] = NewBuiltinMethod("env.print", nil)

	// Accepts a filename as the only argument, and returns an
	// array of bytes with the contents of the file. Can fail.
	// FIXME: Document failure modes.
	envpkg.Methods["read_file"] = NewBuiltinMethod("env.read_file", []Type{NewPointerType(NewArrayType(INT_TYPE, -1))})

	// This method just returns the array of command-line arguments
	// for the running program.
	envpkg.Methods["args"] = NewBuiltinMethod("env.args", []Type{NewPointerType(NewArrayType(STRING_TYPE, -1))})

	/*iopkg.Globals["File"] = NewBuiltinType("io.File")
	iopkg.Globals["Open"] = NewBuiltinMethod("io.Open")
	iopkg.Globals["*File.Read"] = NewBuiltinMethod("io.*File.Read")
	iopkg.Globals["*File.Write"] = NewBuiltinMethod("io.*File.Write")
	iopkg.Globals["Dir"] = NewBuiltinType("io.Dir")
	iopkg.Glabals["OpenDir"] = NewBuiltinMethod("io.OpenDir")
	iopkg.Globals["*Dir.Read"] = NewBuiltinMethod("io.*Dir.Read")
	*/
}

func (app *Application) LoadPackage(name string, path string) {
	pkg := NewPackage(path)

	if path[0] == '/' {
		// TODO: PkgDir
		//	path = pathpkg.Join(app.PkgDir, path)
	}

	dir, err := os.Open(path)
	if err != nil {
		panic(err)
	}

	fi, err := dir.Readdir(0)
	if err != nil {
		panic(err)
	}

	for i := range fi {
		if fi[i].IsDir() {
			continue
		}

		if !strings.HasSuffix(fi[i].Name(), ".zs") {
			continue
		}

		filename := pathpkg.Join(path, fi[i].Name())

		var err error

		parser := os.Getenv("ZSPARSER")
		if parser == "" {
			parser = "zsparser"
		}

		cmd := exec.Command(parser)
		cmd.Stdin, err = os.Open(filename)
		if err != nil {
			panic(err)
		}

		stdout, err := cmd.StdoutPipe()
		if err != nil {
			panic(err)
		}

		err = cmd.Start()
		if err != nil {
			panic(err)
		}

		p := spl.NewSeqParser(stdout)

		globals := make([]ASTGlobal, 0)

		for !p.IsEnd() {
			globals = append(globals, ParseASTGlobal(p))
		}

		err = cmd.Wait()
		if err != nil {
			panic(err)
		}

		pkg.LoadFile(app, globals)
	}

	for _, t := range pkg.Types {
		t.Resolve()
	}

	for _, m := range pkg.MethodList {
		m.Resolve()
	}

	for _, m := range pkg.MethodList {
		NewTranscribeContext(m).Transcribe()
	}

	app.Packages[name] = pkg
}
