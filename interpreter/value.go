package main

func ValueCopy(v Value) Value {
	adr, ok := v.(AddressableValue)
	if ok {
		v = adr.Box.Value
	}

	switch vv := v.(type) {
	case bool, int64, string, *BoxedValue:
		return v

	case ArrayValue:
		newelems := make([]*BoxedValue, len(vv.Elements))

		for i := range newelems {
			newelems[i] = &BoxedValue{ValueCopy(vv.Elements[i].Value)}
		}

		return ArrayValue{newelems}

	case StructValue:
		newmembers := make([]*BoxedValue, len(vv.Members))

		for i := range newmembers {
			newmembers[i] = &BoxedValue{ValueCopy(vv.Members[i].Value)}
		}

		return StructValue{vv.Type, newmembers}

	default:
		println("missing case")
		_ = v.(bool)
		panic("")
	}
}

func ValueMethodNonNil(v Value, name string) (recv Value, m *Method) {
	recv, m = ValueMethod(v, name)
	if m == nil {
		panic("Nil method: " + name)
	}
	return
}


func ValueMethod(v Value, name string) (recv Value, m *Method) {
	_, ok := v.(AddressableValue)
	if ok {
		panic("bug")
	}

	if name == "" {
		panic("bug")
	}

	ref := (*BoxedValue)(nil)

	// Unroll indirection.
	for {
		box, ok := v.(*BoxedValue)
		if !ok {
			break
		}

		ref = box
		if ref == nil {
			panic("trying to access " + name + " on a nil pointer")
		}

		v = box.Value
	}

	t := v.(StructValue).Type

	m = t.methodimpls[name]
	if m != nil {
		_, ptr := m.ReceiverType.(*PointerType)
		if ptr {
			return ref, m
		} else {
			return v, m
		}
	}

	for i := range t.defmembers {
		if t.defmembers[i].name == "" {
			//panic("calling anonymous members is untested")
			recv, m = ValueMethod(v.(StructValue).Members[i], name)
			if m != nil {
				return recv, m
			}
		}
	}

	return nil, nil
}

func ValueMember(v Value, name string, funcname string) Value {

	_, ok := v.(AddressableValue)
	if ok {
		panic("bug")
	}

	// Unroll indirection.
	for {
		box, ok := v.(*BoxedValue)
		if !ok {
			break
		}

		if box == nil {
			panic("trying to access " + name + " on a nil pointer in function " + funcname)
		}

		v = box.Value
	}

	switch vv := v.(type) {
	case bool, int64, string, ArrayValue:
		panic("bad program")

	case *BoxedValue:
		panic("impossible")

	case StructValue:
		// TODO: Maybe do this faster.

		t := vv.Type

		for i := range t.defmembers {
			if t.defmembers[i].name == name {
				return AddressableValue{vv.Members[i]}
			}

			if t.defmembers[i].name != "" {
				continue
			}

			// Anonymous fields can be selected by type name.

			at := t.defmembers[i].typ
			for {
				pt, ok := at.(*PointerType)
				if !ok {
					break
				}
				at = pt
			}

			nt := at.(NamedType)

			if nt.Name() == name {
				return AddressableValue{vv.Members[i]}
			}
		}

		for i := range t.defmembers {
			if t.defmembers[i].name != "" {
				continue
			}

			return ValueMember(vv.Members[i], name, funcname)
		}

		panic("bad selector in function " + funcname)

	default:
		panic("missing case")
	}
}

func ValueDefault(t Type) Value {
	if t == nil {
		return nil
	}

	switch tt := t.(type) {
	case *IntType:
		return int64(0)
	case *BoolType:
		return false
	case *StringType:
		return ""
	case *PointerType:
		return (*BoxedValue)(nil)
	case *ArrayType:
		boxes := make([]*BoxedValue, tt.length)
		for i := int64(0); i < tt.length; i++ {
			boxes[i] = &BoxedValue{ValueDefault(tt.base)}
		}
		return ArrayValue{boxes}
	case *StructType:
		val := StructValue{tt, make([]*BoxedValue, len(tt.defmembers))}
		for i := range tt.defmembers {
			val.Members[i] = &BoxedValue{ValueDefault(tt.defmembers[i].typ)}
		}
		return val
	default:
		panic(t.(*IntType))
	}
}

func ValueEqual(val1, val2 Value) bool {
	switch v1 := val1.(type) {
	case bool:
		v2 := val2.(bool)
		return v1 == v2
	case int64:
		v2 := val2.(int64)
		return v1 == v2
	case string:
		v2 := val2.(string)
		return v1 == v2
	case *BoxedValue:
		v2 := val2.(*BoxedValue)
		return v1 == v2
	default:
		panic(val1.(int))
	}
}

func ValueType(val Value) Type {
	switch v := val.(type) {
	case bool:
		return BOOL_TYPE
	case int64:
		return INT_TYPE
	case string:
		return STRING_TYPE
	case *BoxedValue:
		return NewPointerType(ValueType(v.Value))
	case ArrayValue:
		return NewArrayType(ValueType(v.Elements[0].Value), int64(len(v.Elements)))
	case StructValue:
		return v.Type
	case AddressableValue:
		return ValueType(v.Box.Value)
	default:
		panic("missing case")
	}
}

type Value interface {
}

type BoxedValue struct {
	Value Value
}

type ArrayValue struct {
	Elements []*BoxedValue
}

type StructValue struct {
	Type    *StructType
	Members []*BoxedValue
}

type AddressableValue struct {
	Box *BoxedValue
}

type TupleValue struct {
	List []Value
}
