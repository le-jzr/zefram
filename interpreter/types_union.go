package main

type UnionType struct {
	pkg  *Package
	name string
}

func (t *UnionType) String() string {
	return t.pkg.Path + "::" + t.name
}

func (t *UnionType) Equals(t2 Type) bool {
	ut, ok := t2.(*UnionType)
	if !ok {
		return false
	}
	return t == ut
}

func (t *UnionType) Resolved() Type {
	panic("bug")
}

func (t *UnionType) Resolve() {
}

func (t *UnionType) Name() string {
	return t.name
}
