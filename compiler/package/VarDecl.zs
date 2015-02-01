

type VarDecl = struct {
	name: string
	// 0: NO_POINTER, 1: BORROWED, 2: OWN_POINTER, 3: AUTO_POINTER
	// TODO: enum
	pointer: int
	// 0: NO_ARRAY, 1: VALUE_ARRAY, 2: OWN_POINTER_ARRAY, 3: AUTO_POINTER_ARRAY
	// TODO: enum
	array: int
	type: own *TypeRef
}

func write_var_decl(out: *Writer, decl: *VarDecl)
{
	spl.start_list(out)
	spl.write_string(out, decl.name)
	spl.write_int(out, decl.pointer)
	spl.write_int(out, decl.array)
	spl.write_type_ref(out, decl.type)
	spl.end_list(out)
}
