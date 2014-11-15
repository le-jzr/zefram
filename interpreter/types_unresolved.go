package main

type UnresolvedType struct {
	pkg  *Package
	name string
}

func NewUnresolvedType(pkg *Package, name string) *UnresolvedType {
	return &UnresolvedType{pkg, name}
}

func (t *UnresolvedType) String() string {
	return "<unresolved>"
}

func (t *UnresolvedType) Equals(t2 Type) bool {
	return false
}

func (t *UnresolvedType) Resolved() Type {
	tt := t.pkg.Types[t.name]
	if tt == nil {
		panic("Type " + t.pkg.Path + "::" + t.name + " not found.")
	}
	return tt
}
