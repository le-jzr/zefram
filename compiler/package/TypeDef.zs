

type TypeDef = UnionTypeDef | StructTypeDef | InterfaceTypeDef

type UnionTypeDef = struct {
	name: string
	types: own *[] own *TypeRef
}

type StructTypeDef = struct {
	name: string
	members: own *[] own *VarDecl

	// TODO: constraints
}

type InterfaceTypeDef = struct {
	name: string
	methods: own *[] own *MethodDecl
}

func write_type_def(out: *Writer, t: *TypeDef)
{
	out.start_list()

	type switch t
	case *UnionTypeDef {
		out.write_string("UnionTypeDef")
		write_union_type_def(t)
	}
	case *StructTypeDef {
		out.write_string("StructTypeDef")
		write_struct_type_def(t)
	}
	case *InterfaceTypeDef {
		out.write_string("InterfaceTypeDef")
		write_interface_type_def(t)
	};;
	
	out.end_list()
}

func write_union_type_def(out: *Writer, t: *UnionTypeDef)
{
	out.start_list()
	
	out.write_string(t.name)
	
	out.start_list()
	
	var i = 0
	while i < len(t.types) {
		write_type_ref(out, t.types[i])
		i++
	}
	
	out.end_list()
	
	out.end_list()
}

func write_struct_type_def(out: *Writer, t: *StructTypeDef)
{
	out.start_list()
	
	out.write_string(t.name)
	
	out.start_list()
	
	var i = 0
	while i < len(t.members) {
		write_var_decl(out, t.members[i])
		i++
	}
	
	out.end_list()
	
	out.end_list()
}

func write_interface_type_def(out: *Writer, t: *InterfaceTypeDef)
{
	out.start_list()
	
	out.write_string(t.name)
	
	out.start_list()
	
	var i = 0
	while i < len(t.methods) {
		write_method_decl(out, t.methods[i])
		i++
	}
	
	out.end_list()
	
	out.end_list()
}
