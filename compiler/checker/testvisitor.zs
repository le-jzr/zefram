
type TestVisitor = struct {
	ast.ASTVisitorBase
}

func new_TestVisitor() (v: own *TestVisitor)
{
	v = new(TestVisitor)
	v.self = v
	return v
}

func (v: *TestVisitor) visit_package(pkg: *ast.Package)
{
	var i = 0
	var l = len(pkg.globals)

	while i < l {
		env.print("Visiting global ", i, " of ", l, ".\n")
		v.visit_global(pkg.globals[i])
		i++
	}
}

func (v: *TestVisitor) previsit_method(node: *ast.ASTMethod)
{
	env.print("Previsiting method ", node.__name, "\n")
}

func (v: *TestVisitor) postvisit_method(node: *ast.ASTMethod)
{
	env.print("Postvisiting method ", node.__name, "\n")
}

func (v: *TestVisitor) previsit_while(node: *ast.ASTWhile)
{
	env.print("While!\n")
}

func (v: *TestVisitor) previsit_binary_plus(node: *ast.ASTBinaryPlus)
{
	env.print("Binary +!\n")
}
