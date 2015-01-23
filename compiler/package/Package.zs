
type PackageInterface = struct {
	preferred_name: string
	url: string
	machine_name: string

	globals: own *[] own *ast.Global
}

func (pkg: *Package) write_interface(out: *Writer)
{
	spl.write_string(out, pkg.preferred_name)
	spl.write_string(out, pkg.url)
	spl.write_string(out, pkg.machine_name)
	
	var i = 0
	while i < len(pkg.globals) {
		ast.write_global(out, pkg.globals[i])
		i++
	}
}

