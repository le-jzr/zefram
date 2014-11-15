package main

import (
	"fmt"
)

type ArrayType struct {
	length int64
	base   Type
}

func NewArrayType(base Type, length int64) *ArrayType {
	return &ArrayType{length, base}
}

func (t *ArrayType) String() string {
	if t.length < 0 {
		return "[]" + t.base.String()
	}
	return fmt.Sprintf("[%d]%s", t.length, t.base.String())
}

func (t *ArrayType) Equals(t2 Type) bool {
	tt, ok := t2.(*ArrayType)
	if !ok {
		return false
	}

	return t.length == tt.length && t.base.Equals(tt.base)
}

func (t *ArrayType) Resolved() Type {
	t.base = t.base.Resolved()
	return t
}
