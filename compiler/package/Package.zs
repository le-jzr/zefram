
type ObjectInfo = struct {
	package_url: string
	package_machine_name: string
	object_name: string
}

type PackageInterface = struct {
	preferred_name: string
	url: string
	machine_name: string

	methods: own *[]own *MethodDecl
//	constants: own *[]own *Constant
//	variables: own *[]own *Method
	types: own *[]own *TypeDef
}

//func (pkg: *Package) read_interface(in: *Reader)
//{
//}

func (pkg: *Package) write_interface(out: *Writer)
{
	spl.start_list()
	spl.write_string(out, pkg.preferred_name)
	spl.write_string(out, pkg.url)
	spl.write_string(out, pkg.machine_name)
	
	spl.start_list()
	var i = 0
	while i < len(pkg.typedefs) {
		write_type_def(out, pkg.types[i])
		i++
	}
	spl.end_list()
	
	spl.start_list()
	i = 0
	while i < len(pkg.method) {
		write_method_decl(out, pkg.methods[i])
		i++
	}
	spl.end_list()
	
	spl.end_list()
}



