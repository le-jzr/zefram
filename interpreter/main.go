package main

import (
	"os"
	"strings"
)

func help_and_exit() {
	// TODO
	panic("bad arguments")
}

func main() {
	app := NewApplication()

	args := append([]string(nil), os.Args[1:]...)
	runargs := []string(nil)

	for i := range args {
		if args[i] == "--" {
			runargs = args[i+1:]
			args = args[:i]
			break
		}
	}

	if len(args) == 0 {
		help_and_exit()
	}

	for len(args) > 0 {
		switch args[0] {
		case "--builtinenv":
			if len(args) < 2 {
				help_and_exit()
			}

			app.LoadBuiltinEnv(args[1])

			args = args[2:]

		case "--package":
			if len(args) < 3 {
				help_and_exit()
			}

			app.LoadPackage(args[1], args[2])
			args = args[3:]

		case "--run":
			if len(args) < 2 {
				help_and_exit()
			}

			parts := strings.Split(args[1], ".")
			if len(parts) != 2 {
				help_and_exit()
			}

			mainpkg := app.Packages[parts[0]]
			if mainpkg == nil {
				panic("No package '" + parts[0] + "'.")
			}
			rctx := NewRunContext()
			rctx.SetArgs(runargs)
			failcode, faildesc := rctx.RunMethod(mainpkg.Methods[parts[1]], nil, nil, -1)
			if failcode != "" {
				panic("unhandled failure: " + failcode + " (" + faildesc + ")")
			}

			args = args[2:]
		default:
			println(args[0])
			help_and_exit()
		}
	}
}
