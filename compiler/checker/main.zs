func main()
{
	//var pkgstack = code.new_PackageStack()
	//var resolv = new_ImportResolver(pkgstack)
	
	/*
	var args = env.args()
	var i = 0
	while i < len(args) {
		switch args[i]
		case "--package" {
			var pkg = code.load_interface(args[i+2])
			code.visit_interface(resolv, pkg)
			pkgstack.push(args[i+1], pkg)
			
			i += 3
		}
		default {
			env.print("Unknown argument: ", args[i], "\n")
			
			i++
		};;
	}
	*/

	var mainpkg = ast.load_stdin()
	
	var v = new_TestVisitor()
	v.visit_package(mainpkg)
}
