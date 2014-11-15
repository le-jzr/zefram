package main

var (
	BOOL_TYPE   = &BoolType{}
	INT_TYPE    = &IntType{}
	STRING_TYPE = &StringType{}
)

type MethodInterface struct {
	name     string
	inTypes  []Type
	outTypes []Type
}

type Type interface {
	String() string
	Equals(t2 Type) bool
	Resolved() Type
}

type NamedType interface {
	Type

	Name() string
	Resolve()
}

func LoadTypedef(imports map[string]*Package, ast *ASTTypedef) NamedType {

	switch astt := ast._type.(type) {
	case *ASTStructType:
		st := new(StructType)
		st.name = ast._name
		st.defmembers = make([]StructMember, len(astt._members))

		for i := range astt._members {
			if astt._members[i]._name == nil {
				st.defmembers[i].name = ""
			} else {
				st.defmembers[i].name = *astt._members[i]._name
			}
			st.defmembers[i].typ = LoadType(imports, astt._members[i]._type, false)
		}

		return st

	case *ASTInterfaceType:
		st := new(InterfaceType)
		st.name = ast._name
		return st

	case *ASTSelectionType:
		st := new(UnionType)
		st.name = ast._name
		return st
	}

	panic("missing case")
}

func LoadType(imports map[string]*Package, ast ASTType, resolve bool) Type {

	switch astt := ast.(type) {
	case *ASTTypeRef:
		var pkg *Package

		if astt._package == nil {
			switch astt._name {
			case "bool":
				return BOOL_TYPE
			case "byte", "int", "int8", "uint8", "int16", "uint16", "int32", "uint32", "int64", "uint64":
				return INT_TYPE
			case "string":
				return STRING_TYPE
			}

			pkg = imports[""]
		} else {
			pkg = imports[*astt._package]
			if pkg == nil {
				panic("unknown package: " + *astt._package)
			}
		}

		if resolve {
			t := pkg.Types[astt._name]
			if t == nil {
				panic("bug")
			}
			return t
		}

		return NewUnresolvedType(pkg, astt._name)

	case *ASTRangeType:
		return INT_TYPE

	case *ASTPointerType:
		return NewPointerType(LoadType(imports, astt._inner_type, resolve))

	case *ASTArrayType:
		elem := LoadType(imports, astt._element_type, resolve)
		var count int64
		if astt._length == nil {
			count = 0
		} else {
			count = astt._length.ConstantInt()
		}
		return NewArrayType(elem, count)
	}

	panic("missing case")
}
