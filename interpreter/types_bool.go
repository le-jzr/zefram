package main

type BoolType struct {
}

func (t *BoolType) String() string {
	return "bool"
}

func (t *BoolType) Equals(t2 Type) bool {
	_, ok := t2.(*BoolType)
	return ok
}

func (t *BoolType) Resolved() Type {
	return t
}
