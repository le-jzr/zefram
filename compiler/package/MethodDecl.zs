
type MethodDecl = struct {
	name: string
	// TODO: constraints
	
	in_params: own *[]own *VarDecl
	out_params: own *[]own *VarDecl
}

func write_method_decl(out: *Writer, decl: *MethodDecl) {
	spl.start_list(out)
	
	spl.write_string(out, decl.name)
	
	spl.start_list(out)
	var i = 0
	while i < len(decl.in_params) {
		write_var_decl(out, decl.in_params[i])
		i++
	}
	spl.end_list(out)
	
	spl.start_list(out)
	var i = 0
	while i < len(decl.out_params) {
		write_var_decl(out, decl.out_params[i])		
		i++
	}
	spl.end_list(out)
	
	spl.end_list(out)
}
