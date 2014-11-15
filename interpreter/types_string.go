package main

type StringType struct {
}

func (t *StringType) String() string {
	return "string"
}

func (t *StringType) Equals(t2 Type) bool {
	_, ok := t2.(*StringType)
	return ok
}

func (t *StringType) Resolved() Type {
	return t
}
