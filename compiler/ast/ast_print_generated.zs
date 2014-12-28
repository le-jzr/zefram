func (n: *ASTAnd) print() {
	print("And {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTArrayType) print() {
	print("ArrayType {\n")
	
	print("length = ")
	
	n._length.print()
	
	print(",\n")
	
	
	print("element_type = ")
	
	n._element_type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTAssert) print() {
	print("Assert {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTAssertAll) print() {
	print("AssertAll {\n")
	
	print("vars = ")
	
	ret._vars = n.print_vars()
	
	print(",\n")
	
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTAssertAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		print(n._vars[i])
		
		i++
	}
}
func (n: *ASTAssignment) print() {
	print("Assignment {\n")
	
	print("rvalues = ")
	
	ret._rvalues = n.print_rvalues()
	
	print(",\n")
	
	
	print("lvalues = ")
	
	ret._lvalues = n.print_lvalues()
	
	print(",\n")
	
	
	print("}")
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
func (n: *ASTAssume) print() {
	print("Assume {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTBinaryMinus) print() {
	print("BinaryMinus {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTBinaryPlus) print() {
	print("BinaryPlus {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTBitAnd) print() {
	print("BitAnd {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTBitOr) print() {
	print("BitOr {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTBitXor) print() {
	print("BitXor {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTBlock) print() {
	print("Block {\n")
	
	print("statements = ")
	
	ret._statements = n.print_statements()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTBlock) print_statements()
{
	var i = 0
	
	while i < len(n._statements) {
		n._statements[i].print()
		
		i++
	}
}
func (n: *ASTBreak) print() {
	print("Break {\n")
	
	print("label = ")
	
	if n._label == null {
		print("null")
	} else {
		print(*n._label)
	}
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTChar) print() {
	print("Char {\n")
	
	print("str = ")
	
	print(n._str)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTContinue) print() {
	print("Continue {\n")
	
	print("label = ")
	
	if n._label == null {
		print("null")
	} else {
		print(*n._label)
	}
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTDecimal) print() {
	print("Decimal {\n")
	
	print("str = ")
	
	print(n._str)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTDecrement) print() {
	print("Decrement {\n")
	
	print("lvalue = ")
	
	n._lvalue.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTDefaultCase) print() {
	print("DefaultCase {\n")
	
	print("body = ")
	
	n._body.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTDelete) print() {
	print("Delete {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTDeref) print() {
	print("Deref {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTDiv) print() {
	print("Div {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTEnsures) print() {
	print("Ensures {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTEnsuresAll) print() {
	print("EnsuresAll {\n")
	
	print("vars = ")
	
	ret._vars = n.print_vars()
	
	print(",\n")
	
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTEnsuresAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		print(n._vars[i])
		
		i++
	}
}
func (n: *ASTEqual) print() {
	print("Equal {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTFail) print() {
	print("Fail {\n")
	
	print("code = ")
	
	print(n._code)
	
	print(",\n")
	
	
	print("description = ")
	
	if n._description == null {
		print("null")
	} else {
		print(*n._description)
	}
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTFailRecover) print() {
	print("FailRecover {\n")
	
	print("stmt = ")
	
	n._stmt.print()
	
	print(",\n")
	
	
	print("recover_block = ")
	
	n._recover_block.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTGreater) print() {
	print("Greater {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTGreaterEq) print() {
	print("GreaterEq {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTHexaDecimal) print() {
	print("HexaDecimal {\n")
	
	print("str = ")
	
	print(n._str)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTIdentifier) print() {
	print("Identifier {\n")
	
	print("ident = ")
	
	print(n._ident)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTIf) print() {
	print("If {\n")
	
	print("condition = ")
	
	n._condition.print()
	
	print(",\n")
	
	
	print("true_branch = ")
	
	n._true_branch.print()
	
	print(",\n")
	
	
	print("false_branch = ")
	
	n._false_branch.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTIncrement) print() {
	print("Increment {\n")
	
	print("lvalue = ")
	
	n._lvalue.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTIndexed) print() {
	print("Indexed {\n")
	
	print("base = ")
	
	n._base.print()
	
	print(",\n")
	
	
	print("index = ")
	
	n._index.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTInequal) print() {
	print("Inequal {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTInterfaceMember) print() {
	print("InterfaceMember {\n")
	
	print("name = ")
	
	print(n._name)
	
	print(",\n")
	
	
	print("signature = ")
	
	n._signature.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTInterfaceType) print() {
	print("InterfaceType {\n")
	
	print("members = ")
	
	ret._members = n.print_members()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTInterfaceType) print_members()
{
	var i = 0
	
	while i < len(n._members) {
		n._members[i].print()
		
		i++
	}
}
func (n: *ASTInvariant) print() {
	print("Invariant {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTInvariantAll) print() {
	print("InvariantAll {\n")
	
	print("vars = ")
	
	ret._vars = n.print_vars()
	
	print(",\n")
	
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTInvariantAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		print(n._vars[i])
		
		i++
	}
}
func (n: *ASTIs) print() {
	print("Is {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTLShift) print() {
	print("LShift {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTLess) print() {
	print("Less {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTLessEq) print() {
	print("LessEq {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTLoopBound) print() {
	print("LoopBound {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTMayFail) print() {
	print("MayFail {\n")
	
	print("fail_list = ")
	
	ret._fail_list = n.print_fail_list()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTMayFail) print_fail_list()
{
	var i = 0
	
	while i < len(n._fail_list) {
		print(n._fail_list[i])
		
		i++
	}
}
func (n: *ASTMethod) print() {
	print("Method {\n")
	
	print("receiver = ")
	
	n._receiver.print()
	
	print(",\n")
	
	
	print("name = ")
	
	print(n._name)
	
	print(",\n")
	
	
	print("signature = ")
	
	n._signature.print()
	
	print(",\n")
	
	
	print("contracts = ")
	
	ret._contracts = n.print_contracts()
	
	print(",\n")
	
	
	print("body = ")
	
	n._body.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTMethod) print_contracts()
{
	var i = 0
	
	while i < len(n._contracts) {
		n._contracts[i].print()
		
		i++
	}
}
func (n: *ASTMethodCall) print() {
	print("MethodCall {\n")
	
	print("receiver = ")
	
	n._receiver.print()
	
	print(",\n")
	
	
	print("method = ")
	
	print(n._method)
	
	print(",\n")
	
	
	print("args = ")
	
	ret._args = n.print_args()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTMethodCall) print_args()
{
	var i = 0
	
	while i < len(n._args) {
		n._args[i].print()
		
		i++
	}
}
func (n: *ASTMethodSignature) print() {
	print("MethodSignature {\n")
	
	print("in_params = ")
	
	ret._in_params = n.print_in_params()
	
	print(",\n")
	
	
	print("out_params = ")
	
	ret._out_params = n.print_out_params()
	
	print(",\n")
	
	
	print("}")
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
func (n: *ASTMod) print() {
	print("Mod {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTMult) print() {
	print("Mult {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTNew) print() {
	print("New {\n")
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTNewArray) print() {
	print("NewArray {\n")
	
	print("length = ")
	
	n._length.print()
	
	print(",\n")
	
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTNot) print() {
	print("Not {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTOctal) print() {
	print("Octal {\n")
	
	print("str = ")
	
	print(n._str)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTOr) print() {
	print("Or {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTPExpression) print() {
	print("PExpression {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTParameter) print() {
	print("Parameter {\n")
	
	print("name = ")
	
	if n._name == null {
		print("null")
	} else {
		print(*n._name)
	}
	
	print(",\n")
	
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTPointerType) print() {
	print("PointerType {\n")
	
	print("inner_type = ")
	
	n._inner_type.print()
	
	print(",\n")
	
	
	print("nullable = ")
	
	if n._nullable {
		print("true")
	} else {
		print("false")
	}
	
	print(",\n")
	
	
	print("owned = ")
	
	if n._owned {
		print("true")
	} else {
		print("false")
	}
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTRShift) print() {
	print("RShift {\n")
	
	print("left = ")
	
	n._left.print()
	
	print(",\n")
	
	
	print("right = ")
	
	n._right.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTRangeType) print() {
	print("RangeType {\n")
	
	print("low = ")
	
	n._low.print()
	
	print(",\n")
	
	
	print("high = ")
	
	n._high.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTRecursionBound) print() {
	print("RecursionBound {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTRef) print() {
	print("Ref {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTRequires) print() {
	print("Requires {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTRequiresAll) print() {
	print("RequiresAll {\n")
	
	print("vars = ")
	
	ret._vars = n.print_vars()
	
	print(",\n")
	
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTRequiresAll) print_vars()
{
	var i = 0
	
	while i < len(n._vars) {
		print(n._vars[i])
		
		i++
	}
}
func (n: *ASTReturn) print() {
	print("Return {\n")
	
	print("retvals = ")
	
	ret._retvals = n.print_retvals()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTReturn) print_retvals()
{
	var i = 0
	
	while i < len(n._retvals) {
		n._retvals[i].print()
		
		i++
	}
}
func (n: *ASTSanityCheck) print() {
	print("SanityCheck {\n")
	
	print("expr = ")
	
	n._expr.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTSelectionType) print() {
	print("SelectionType {\n")
	
	print("types = ")
	
	ret._types = n.print_types()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTSelectionType) print_types()
{
	var i = 0
	
	while i < len(n._types) {
		n._types[i].print()
		
		i++
	}
}
func (n: *ASTSelector) print() {
	print("Selector {\n")
	
	print("base = ")
	
	n._base.print()
	
	print(",\n")
	
	
	print("selector = ")
	
	print(n._selector)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTString) print() {
	print("String {\n")
	
	print("str = ")
	
	print(n._str)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTStructMember) print() {
	print("StructMember {\n")
	
	print("name = ")
	
	if n._name == null {
		print("null")
	} else {
		print(*n._name)
	}
	
	print(",\n")
	
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTStructType) print() {
	print("StructType {\n")
	
	print("members = ")
	
	ret._members = n.print_members()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTStructType) print_members()
{
	var i = 0
	
	while i < len(n._members) {
		n._members[i].print()
		
		i++
	}
}
func (n: *ASTSwitch) print() {
	print("Switch {\n")
	
	print("discriminant = ")
	
	n._discriminant.print()
	
	print(",\n")
	
	
	print("cases = ")
	
	ret._cases = n.print_cases()
	
	print(",\n")
	
	
	print("default = ")
	
	n._default.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTSwitch) print_cases()
{
	var i = 0
	
	while i < len(n._cases) {
		n._cases[i].print()
		
		i++
	}
}
func (n: *ASTSwitchCase) print() {
	print("SwitchCase {\n")
	
	print("matches = ")
	
	ret._matches = n.print_matches()
	
	print(",\n")
	
	
	print("body = ")
	
	n._body.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTSwitchCase) print_matches()
{
	var i = 0
	
	while i < len(n._matches) {
		n._matches[i].print()
		
		i++
	}
}
func (n: *ASTTake) print() {
	print("Take {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTTypeRef) print() {
	print("TypeRef {\n")
	
	print("package = ")
	
	if n._package == null {
		print("null")
	} else {
		print(*n._package)
	}
	
	print(",\n")
	
	
	print("name = ")
	
	print(n._name)
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTTypeSwitch) print() {
	print("TypeSwitch {\n")
	
	print("discriminant = ")
	
	n._discriminant.print()
	
	print(",\n")
	
	
	print("cases = ")
	
	ret._cases = n.print_cases()
	
	print(",\n")
	
	
	print("default = ")
	
	n._default.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTTypeSwitch) print_cases()
{
	var i = 0
	
	while i < len(n._cases) {
		n._cases[i].print()
		
		i++
	}
}
func (n: *ASTTypeSwitchCase) print() {
	print("TypeSwitchCase {\n")
	
	print("types = ")
	
	ret._types = n.print_types()
	
	print(",\n")
	
	
	print("body = ")
	
	n._body.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTTypeSwitchCase) print_types()
{
	var i = 0
	
	while i < len(n._types) {
		n._types[i].print()
		
		i++
	}
}
func (n: *ASTTypedef) print() {
	print("Typedef {\n")
	
	print("name = ")
	
	print(n._name)
	
	print(",\n")
	
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTUnaryMinus) print() {
	print("UnaryMinus {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTUnaryPlus) print() {
	print("UnaryPlus {\n")
	
	print("arg = ")
	
	n._arg.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTVardecl) print() {
	print("Vardecl {\n")
	
	print("name = ")
	
	print(n._name)
	
	print(",\n")
	
	
	print("initializer = ")
	
	n._initializer.print()
	
	print(",\n")
	
	
	print("}")
}
func (n: *ASTVardeclTyped) print() {
	print("VardeclTyped {\n")
	
	print("names = ")
	
	ret._names = n.print_names()
	
	print(",\n")
	
	
	print("type = ")
	
	n._type.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTVardeclTyped) print_names()
{
	var i = 0
	
	while i < len(n._names) {
		print(n._names[i])
		
		i++
	}
}
func (n: *ASTWhile) print() {
	print("While {\n")
	
	print("label = ")
	
	if n._label == null {
		print("null")
	} else {
		print(*n._label)
	}
	
	print(",\n")
	
	
	print("condition = ")
	
	n._condition.print()
	
	print(",\n")
	
	
	print("contracts = ")
	
	ret._contracts = n.print_contracts()
	
	print(",\n")
	
	
	print("body = ")
	
	n._body.print()
	
	print(",\n")
	
	
	print("}")
}
func  (n: *ASTWhile) print_contracts()
{
	var i = 0
	
	while i < len(n._contracts) {
		n._contracts[i].print()
		
		i++
	}
}
