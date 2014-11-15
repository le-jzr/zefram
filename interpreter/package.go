package main

type Global interface {
	// one of: *Method, *NamedType
}

type Package struct {
	Path string

	Types   map[string]NamedType
	Methods map[string]*Method

	MethodList []*Method
}

func NewPackage(path string) *Package {
	return &Package{path, make(map[string]NamedType), make(map[string]*Method), nil}
}

func pkgName(path string) string {
	b := []byte(path)

	for i := 0; i < len(b); i++ {
		if b[i] == '/' {
			b = b[i+1:]
			i = -1
		}
	}

	return string(b)
}

func (p *Package) LoadFile(app *Application, f []ASTGlobal) {

	imports := make(map[string]*Package)
	imports[""] = p

	for k, v := range app.Packages {
		imports[k] = v
	}

	for i := range f {
		switch g := f[i].(type) {
		case *ASTMethod:
			m := NewMethod(imports, g)

			if m.ReceiverType == nil {
				p.Methods[m.Name()] = m
			}

			p.MethodList = append(p.MethodList, m)

		case *ASTTypedef:
			t := LoadTypedef(imports, g)
			p.Types[t.Name()] = t
		}
	}
}
