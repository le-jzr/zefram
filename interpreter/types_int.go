package main

type IntType struct {
}

func (t *IntType) String() string {
	return "int"
}

func (t *IntType) Equals(t2 Type) bool {
	_, ok := t2.(*IntType)
	return ok
}

func (t *IntType) Resolved() Type {
	return t
}
