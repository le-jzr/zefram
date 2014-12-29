func (n: *ASTAnd) print()
{
	env.print("And {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTArrayType) print()
{
	env.print("ArrayType {\n")
	
	env.print("length = ")
	
	n._length.print()
	
	env.print(",\n")
	
	
	env.print("element_type = ")
	
	n._element_type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTAssert) print()
{
	env.print("Assert {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTAssertAll) print()
{
	env.print("AssertAll {\n")
	
	env.print("vars = ")
	
	n.print_vars()
	
	env.print(",\n")
	
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTAssertAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		env.print(n._vars[i])
		
		i++
	}
}
func (n: *ASTAssignment) print()
{
	env.print("Assignment {\n")
	
	env.print("rvalues = ")
	
	n.print_rvalues()
	
	env.print(",\n")
	
	
	env.print("lvalues = ")
	
	n.print_lvalues()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTAssignment) print_rvalues()
{
	var i = 0
	
	while i < len(n._rvalues) {
		n._rvalues[i].print()
		
		i++
	}
}
func  (n: *ASTAssignment) print_lvalues()
{
	var i = 0
	
	while i < len(n._lvalues) {
		n._lvalues[i].print()
		
		i++
	}
}
func (n: *ASTAssume) print()
{
	env.print("Assume {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTBinaryMinus) print()
{
	env.print("BinaryMinus {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTBinaryPlus) print()
{
	env.print("BinaryPlus {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTBitAnd) print()
{
	env.print("BitAnd {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTBitOr) print()
{
	env.print("BitOr {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTBitXor) print()
{
	env.print("BitXor {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTBlock) print()
{
	env.print("Block {\n")
	
	env.print("statements = ")
	
	n.print_statements()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTBlock) print_statements()
{
	var i = 0
	
	while i < len(n._statements) {
		n._statements[i].print()
		
		i++
	}
}
func (n: *ASTBreak) print()
{
	env.print("Break {\n")
	
	env.print("label = ")
	
	if n._label == null {
		env.print("null")
	} else {
		env.print(*n._label)
	}
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTChar) print()
{
	env.print("Char {\n")
	
	env.print("str = ")
	
	env.print(n._str)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTContinue) print()
{
	env.print("Continue {\n")
	
	env.print("label = ")
	
	if n._label == null {
		env.print("null")
	} else {
		env.print(*n._label)
	}
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTDecimal) print()
{
	env.print("Decimal {\n")
	
	env.print("str = ")
	
	env.print(n._str)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTDecrement) print()
{
	env.print("Decrement {\n")
	
	env.print("lvalue = ")
	
	n._lvalue.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTDefaultCase) print()
{
	env.print("DefaultCase {\n")
	
	env.print("body = ")
	
	n._body.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTDelete) print()
{
	env.print("Delete {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTDeref) print()
{
	env.print("Deref {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTDiv) print()
{
	env.print("Div {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTEnsures) print()
{
	env.print("Ensures {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTEnsuresAll) print()
{
	env.print("EnsuresAll {\n")
	
	env.print("vars = ")
	
	n.print_vars()
	
	env.print(",\n")
	
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTEnsuresAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		env.print(n._vars[i])
		
		i++
	}
}
func (n: *ASTEqual) print()
{
	env.print("Equal {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTFail) print()
{
	env.print("Fail {\n")
	
	env.print("code = ")
	
	env.print(n._code)
	
	env.print(",\n")
	
	
	env.print("description = ")
	
	if n._description == null {
		env.print("null")
	} else {
		env.print(*n._description)
	}
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTFailRecover) print()
{
	env.print("FailRecover {\n")
	
	env.print("stmt = ")
	
	n._stmt.print()
	
	env.print(",\n")
	
	
	env.print("recover_block = ")
	
	n._recover_block.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTFile) print()
{
	env.print("File {\n")
	
	env.print("globals = ")
	
	n.print_globals()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTFile) print_globals()
{
	var i = 0
	
	while i < len(n._globals) {
		n._globals[i].print()
		
		i++
	}
}
func (n: *ASTGreater) print()
{
	env.print("Greater {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTGreaterEq) print()
{
	env.print("GreaterEq {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTHexaDecimal) print()
{
	env.print("HexaDecimal {\n")
	
	env.print("str = ")
	
	env.print(n._str)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTIdentifier) print()
{
	env.print("Identifier {\n")
	
	env.print("ident = ")
	
	env.print(n._ident)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTIf) print()
{
	env.print("If {\n")
	
	env.print("condition = ")
	
	n._condition.print()
	
	env.print(",\n")
	
	
	env.print("true_branch = ")
	
	n._true_branch.print()
	
	env.print(",\n")
	
	
	env.print("false_branch = ")
	
	n._false_branch.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTIncrement) print()
{
	env.print("Increment {\n")
	
	env.print("lvalue = ")
	
	n._lvalue.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTIndexed) print()
{
	env.print("Indexed {\n")
	
	env.print("base = ")
	
	n._base.print()
	
	env.print(",\n")
	
	
	env.print("index = ")
	
	n._index.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTInequal) print()
{
	env.print("Inequal {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTInterfaceMember) print()
{
	env.print("InterfaceMember {\n")
	
	env.print("name = ")
	
	env.print(n._name)
	
	env.print(",\n")
	
	
	env.print("signature = ")
	
	n._signature.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTInterfaceType) print()
{
	env.print("InterfaceType {\n")
	
	env.print("members = ")
	
	n.print_members()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTInterfaceType) print_members()
{
	var i = 0
	
	while i < len(n._members) {
		n._members[i].print()
		
		i++
	}
}
func (n: *ASTInvariant) print()
{
	env.print("Invariant {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTInvariantAll) print()
{
	env.print("InvariantAll {\n")
	
	env.print("vars = ")
	
	n.print_vars()
	
	env.print(",\n")
	
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTInvariantAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		env.print(n._vars[i])
		
		i++
	}
}
func (n: *ASTIs) print()
{
	env.print("Is {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTLShift) print()
{
	env.print("LShift {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTLess) print()
{
	env.print("Less {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTLessEq) print()
{
	env.print("LessEq {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTLoopBound) print()
{
	env.print("LoopBound {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTMayFail) print()
{
	env.print("MayFail {\n")
	
	env.print("fail_list = ")
	
	n.print_fail_list()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTMayFail) print_fail_list()
{
	var i = 0
	
	while i < len(n._fail_list) {
		env.print(n._fail_list[i])
		
		i++
	}
}
func (n: *ASTMethod) print()
{
	env.print("Method {\n")
	
	env.print("receiver = ")
	
	n._receiver.print()
	
	env.print(",\n")
	
	
	env.print("name = ")
	
	env.print(n._name)
	
	env.print(",\n")
	
	
	env.print("signature = ")
	
	n._signature.print()
	
	env.print(",\n")
	
	
	env.print("contracts = ")
	
	n.print_contracts()
	
	env.print(",\n")
	
	
	env.print("body = ")
	
	n._body.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTMethod) print_contracts()
{
	var i = 0
	
	while i < len(n._contracts) {
		n._contracts[i].print()
		
		i++
	}
}
func (n: *ASTMethodCall) print()
{
	env.print("MethodCall {\n")
	
	env.print("receiver = ")
	
	n._receiver.print()
	
	env.print(",\n")
	
	
	env.print("method = ")
	
	env.print(n._method)
	
	env.print(",\n")
	
	
	env.print("args = ")
	
	n.print_args()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTMethodCall) print_args()
{
	var i = 0
	
	while i < len(n._args) {
		n._args[i].print()
		
		i++
	}
}
func (n: *ASTMethodSignature) print()
{
	env.print("MethodSignature {\n")
	
	env.print("in_params = ")
	
	n.print_in_params()
	
	env.print(",\n")
	
	
	env.print("out_params = ")
	
	n.print_out_params()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTMethodSignature) print_in_params()
{
	var i = 0
	
	while i < len(n._in_params) {
		n._in_params[i].print()
		
		i++
	}
}
func  (n: *ASTMethodSignature) print_out_params()
{
	var i = 0
	
	while i < len(n._out_params) {
		n._out_params[i].print()
		
		i++
	}
}
func (n: *ASTMod) print()
{
	env.print("Mod {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTMult) print()
{
	env.print("Mult {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTNew) print()
{
	env.print("New {\n")
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTNewArray) print()
{
	env.print("NewArray {\n")
	
	env.print("length = ")
	
	n._length.print()
	
	env.print(",\n")
	
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTNot) print()
{
	env.print("Not {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTOctal) print()
{
	env.print("Octal {\n")
	
	env.print("str = ")
	
	env.print(n._str)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTOr) print()
{
	env.print("Or {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTPExpression) print()
{
	env.print("PExpression {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTParameter) print()
{
	env.print("Parameter {\n")
	
	env.print("name = ")
	
	if n._name == null {
		env.print("null")
	} else {
		env.print(*n._name)
	}
	
	env.print(",\n")
	
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTPointerType) print()
{
	env.print("PointerType {\n")
	
	env.print("inner_type = ")
	
	n._inner_type.print()
	
	env.print(",\n")
	
	
	env.print("nullable = ")
	
	if n._nullable {
		env.print("true")
	} else {
		env.print("false")
	}
	
	env.print(",\n")
	
	
	env.print("owned = ")
	
	if n._owned {
		env.print("true")
	} else {
		env.print("false")
	}
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTRShift) print()
{
	env.print("RShift {\n")
	
	env.print("left = ")
	
	n._left.print()
	
	env.print(",\n")
	
	
	env.print("right = ")
	
	n._right.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTRangeType) print()
{
	env.print("RangeType {\n")
	
	env.print("low = ")
	
	n._low.print()
	
	env.print(",\n")
	
	
	env.print("high = ")
	
	n._high.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTRecursionBound) print()
{
	env.print("RecursionBound {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTRef) print()
{
	env.print("Ref {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTRequires) print()
{
	env.print("Requires {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTRequiresAll) print()
{
	env.print("RequiresAll {\n")
	
	env.print("vars = ")
	
	n.print_vars()
	
	env.print(",\n")
	
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTRequiresAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		env.print(n._vars[i])
		
		i++
	}
}
func (n: *ASTReturn) print()
{
	env.print("Return {\n")
	
	env.print("retvals = ")
	
	n.print_retvals()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTReturn) print_retvals()
{
	var i = 0
	
	while i < len(n._retvals) {
		n._retvals[i].print()
		
		i++
	}
}
func (n: *ASTSanityCheck) print()
{
	env.print("SanityCheck {\n")
	
	env.print("expr = ")
	
	n._expr.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTSelectionType) print()
{
	env.print("SelectionType {\n")
	
	env.print("types = ")
	
	n.print_types()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTSelectionType) print_types()
{
	var i = 0
	
	while i < len(n._types) {
		n._types[i].print()
		
		i++
	}
}
func (n: *ASTSelector) print()
{
	env.print("Selector {\n")
	
	env.print("base = ")
	
	n._base.print()
	
	env.print(",\n")
	
	
	env.print("selector = ")
	
	env.print(n._selector)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTString) print()
{
	env.print("String {\n")
	
	env.print("str = ")
	
	env.print(n._str)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTStructMember) print()
{
	env.print("StructMember {\n")
	
	env.print("name = ")
	
	if n._name == null {
		env.print("null")
	} else {
		env.print(*n._name)
	}
	
	env.print(",\n")
	
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTStructType) print()
{
	env.print("StructType {\n")
	
	env.print("members = ")
	
	n.print_members()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTStructType) print_members()
{
	var i = 0
	
	while i < len(n._members) {
		n._members[i].print()
		
		i++
	}
}
func (n: *ASTSwitch) print()
{
	env.print("Switch {\n")
	
	env.print("discriminant = ")
	
	n._discriminant.print()
	
	env.print(",\n")
	
	
	env.print("cases = ")
	
	n.print_cases()
	
	env.print(",\n")
	
	
	env.print("default = ")
	
	n._default.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTSwitch) print_cases()
{
	var i = 0
	
	while i < len(n._cases) {
		n._cases[i].print()
		
		i++
	}
}
func (n: *ASTSwitchCase) print()
{
	env.print("SwitchCase {\n")
	
	env.print("matches = ")
	
	n.print_matches()
	
	env.print(",\n")
	
	
	env.print("body = ")
	
	n._body.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTSwitchCase) print_matches()
{
	var i = 0
	
	while i < len(n._matches) {
		n._matches[i].print()
		
		i++
	}
}
func (n: *ASTTake) print()
{
	env.print("Take {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTTypeRef) print()
{
	env.print("TypeRef {\n")
	
	env.print("package = ")
	
	if n._package == null {
		env.print("null")
	} else {
		env.print(*n._package)
	}
	
	env.print(",\n")
	
	
	env.print("name = ")
	
	env.print(n._name)
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTTypeSwitch) print()
{
	env.print("TypeSwitch {\n")
	
	env.print("discriminant = ")
	
	n._discriminant.print()
	
	env.print(",\n")
	
	
	env.print("cases = ")
	
	n.print_cases()
	
	env.print(",\n")
	
	
	env.print("default = ")
	
	n._default.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTTypeSwitch) print_cases()
{
	var i = 0
	
	while i < len(n._cases) {
		n._cases[i].print()
		
		i++
	}
}
func (n: *ASTTypeSwitchCase) print()
{
	env.print("TypeSwitchCase {\n")
	
	env.print("types = ")
	
	n.print_types()
	
	env.print(",\n")
	
	
	env.print("body = ")
	
	n._body.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTTypeSwitchCase) print_types()
{
	var i = 0
	
	while i < len(n._types) {
		n._types[i].print()
		
		i++
	}
}
func (n: *ASTTypedef) print()
{
	env.print("Typedef {\n")
	
	env.print("name = ")
	
	env.print(n._name)
	
	env.print(",\n")
	
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTUnaryMinus) print()
{
	env.print("UnaryMinus {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTUnaryPlus) print()
{
	env.print("UnaryPlus {\n")
	
	env.print("arg = ")
	
	n._arg.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTVardecl) print()
{
	env.print("Vardecl {\n")
	
	env.print("name = ")
	
	env.print(n._name)
	
	env.print(",\n")
	
	
	env.print("initializer = ")
	
	n._initializer.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func (n: *ASTVardeclTyped) print()
{
	env.print("VardeclTyped {\n")
	
	env.print("names = ")
	
	n.print_names()
	
	env.print(",\n")
	
	
	env.print("type = ")
	
	n._type.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTVardeclTyped) print_names()
{
	var i = 0
	
	while i < len(n._names) {
		env.print(n._names[i])
		
		i++
	}
}
func (n: *ASTWhile) print()
{
	env.print("While {\n")
	
	env.print("label = ")
	
	if n._label == null {
		env.print("null")
	} else {
		env.print(*n._label)
	}
	
	env.print(",\n")
	
	
	env.print("condition = ")
	
	n._condition.print()
	
	env.print(",\n")
	
	
	env.print("contracts = ")
	
	n.print_contracts()
	
	env.print(",\n")
	
	
	env.print("body = ")
	
	n._body.print()
	
	env.print(",\n")
	
	
	env.print("}")
}
func  (n: *ASTWhile) print_contracts()
{
	var i = 0
	
	while i < len(n._contracts) {
		n._contracts[i].print()
		
		i++
	}
}
