package main

type PointerType struct {
	base Type
}

func NewPointerType(base Type) *PointerType {
	return &PointerType{base}
}

func (t *PointerType) String() string {
	return "*" + t.base.String()
}

func (t *PointerType) Equals(t2 Type) bool {
	pt, ok := t2.(*PointerType)
	if !ok {
		return false
	}
	return t.base.Equals(pt.base)
}

func (t *PointerType) Resolved() Type {
	t.base = t.base.Resolved()
	return t
}
