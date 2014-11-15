package main

type StructMember struct {
	name string
	typ  Type
}

type StructType struct {
	pkg  *Package
	name string

	defmembers []StructMember
	defmethods []MethodInterface

	methodimpls map[string]*Method
}

func (t *StructType) AddMethod(m *Method) {
	if t.methodimpls == nil {
		t.methodimpls = make(map[string]*Method)
	}

	if t.methodimpls[m.name] != nil {
		panic("method " + m.name + " already exists")
	}

	t.methodimpls[m.name] = m
	t.defmethods = append(t.defmethods, m.Interface)
}

func (t *StructType) String() string {
	return t.pkg.Path + "::" + t.name
}

func (t *StructType) Equals(t2 Type) bool {
	st, ok := t2.(*StructType)
	if !ok {
		return false
	}

	return t == st
}

func (t *StructType) Resolved() Type {
	panic("bug")
}

func (t *StructType) Resolve() {
	for i := range t.defmembers {
		t.defmembers[i].typ = t.defmembers[i].typ.Resolved()
	}

	for i := range t.defmethods {
		for j := range t.defmethods[i].inTypes {
			t.defmethods[i].inTypes[j] = t.defmethods[i].inTypes[j].Resolved()
		}
		for j := range t.defmethods[i].outTypes {
			t.defmethods[i].outTypes[j] = t.defmethods[i].outTypes[j].Resolved()
		}
	}
}

func (t *StructType) Name() string {
	return t.name
}
