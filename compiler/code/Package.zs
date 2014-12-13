type Package = struct {
	globals: own *[] own *ASTGlobal
}

func load_package(path: string) (pkg: own *Package)
	may_fail FAILED, SYNTAX
{
	var file = env.read_file(path)
	
	env.print("hello1\n")
	
	pkg = new(Package)
	
	var count = spl_count(file)
	
	pkg.globals = new[count](own *ASTGlobal)
	
	var i = 0
	var idx = 0
	
	while i < count {
		if i != 0 {
			idx = spl_next(file, idx)
		}
		
		env.print("Parsing global at offset ", idx, "\n")
		pkg.globals[i] = parse_ASTGlobal(file, idx)
		
		i++
	}
	
	env.print("hello2\n")
	
	env.print(count, "\n")
	env.print("hello3\n")
	return pkg
}
