package main

type InterfaceType struct {
	pkg  *Package
	name string
}

func (t *InterfaceType) String() string {
	return t.pkg.Path + "::" + t.name
}

func (t *InterfaceType) Equals(t2 Type) bool {
	tt, ok := t2.(*InterfaceType)
	return ok && t == tt
}

func (t *InterfaceType) Resolved() Type {
	panic("bug")
}

func (t *InterfaceType) Resolve() {
}

func (t *InterfaceType) Name() string {
	return t.name
}
