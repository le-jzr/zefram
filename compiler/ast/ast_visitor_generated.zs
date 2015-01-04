type Visitor = interface {
	preprocess_and(node: *ASTAnd) (enter: bool)
	postprocess_and(node: *ASTAnd)
	preprocess_arraytype(node: *ASTArrayType) (enter: bool)
	postprocess_arraytype(node: *ASTArrayType)
	preprocess_assert(node: *ASTAssert) (enter: bool)
	postprocess_assert(node: *ASTAssert)
	preprocess_assertall(node: *ASTAssertAll) (enter: bool)
	postprocess_assertall(node: *ASTAssertAll)
	preprocess_assignment(node: *ASTAssignment) (enter: bool)
	postprocess_assignment(node: *ASTAssignment)
	preprocess_assume(node: *ASTAssume) (enter: bool)
	postprocess_assume(node: *ASTAssume)
	preprocess_binaryminus(node: *ASTBinaryMinus) (enter: bool)
	postprocess_binaryminus(node: *ASTBinaryMinus)
	preprocess_binaryplus(node: *ASTBinaryPlus) (enter: bool)
	postprocess_binaryplus(node: *ASTBinaryPlus)
	preprocess_bitand(node: *ASTBitAnd) (enter: bool)
	postprocess_bitand(node: *ASTBitAnd)
	preprocess_bitor(node: *ASTBitOr) (enter: bool)
	postprocess_bitor(node: *ASTBitOr)
	preprocess_bitxor(node: *ASTBitXor) (enter: bool)
	postprocess_bitxor(node: *ASTBitXor)
	preprocess_block(node: *ASTBlock) (enter: bool)
	postprocess_block(node: *ASTBlock)
	preprocess_break(node: *ASTBreak) (enter: bool)
	postprocess_break(node: *ASTBreak)
	preprocess_char(node: *ASTChar) (enter: bool)
	postprocess_char(node: *ASTChar)
	preprocess_continue(node: *ASTContinue) (enter: bool)
	postprocess_continue(node: *ASTContinue)
	preprocess_decimal(node: *ASTDecimal) (enter: bool)
	postprocess_decimal(node: *ASTDecimal)
	preprocess_decrement(node: *ASTDecrement) (enter: bool)
	postprocess_decrement(node: *ASTDecrement)
	preprocess_defaultcase(node: *ASTDefaultCase) (enter: bool)
	postprocess_defaultcase(node: *ASTDefaultCase)
	preprocess_delete(node: *ASTDelete) (enter: bool)
	postprocess_delete(node: *ASTDelete)
	preprocess_deref(node: *ASTDeref) (enter: bool)
	postprocess_deref(node: *ASTDeref)
	preprocess_div(node: *ASTDiv) (enter: bool)
	postprocess_div(node: *ASTDiv)
	preprocess_ensures(node: *ASTEnsures) (enter: bool)
	postprocess_ensures(node: *ASTEnsures)
	preprocess_ensuresall(node: *ASTEnsuresAll) (enter: bool)
	postprocess_ensuresall(node: *ASTEnsuresAll)
	preprocess_equal(node: *ASTEqual) (enter: bool)
	postprocess_equal(node: *ASTEqual)
	preprocess_fail(node: *ASTFail) (enter: bool)
	postprocess_fail(node: *ASTFail)
	preprocess_failrecover(node: *ASTFailRecover) (enter: bool)
	postprocess_failrecover(node: *ASTFailRecover)
	preprocess_file(node: *ASTFile) (enter: bool)
	postprocess_file(node: *ASTFile)
	preprocess_greater(node: *ASTGreater) (enter: bool)
	postprocess_greater(node: *ASTGreater)
	preprocess_greatereq(node: *ASTGreaterEq) (enter: bool)
	postprocess_greatereq(node: *ASTGreaterEq)
	preprocess_hexadecimal(node: *ASTHexaDecimal) (enter: bool)
	postprocess_hexadecimal(node: *ASTHexaDecimal)
	preprocess_identifier(node: *ASTIdentifier) (enter: bool)
	postprocess_identifier(node: *ASTIdentifier)
	preprocess_if(node: *ASTIf) (enter: bool)
	postprocess_if(node: *ASTIf)
	preprocess_increment(node: *ASTIncrement) (enter: bool)
	postprocess_increment(node: *ASTIncrement)
	preprocess_indexed(node: *ASTIndexed) (enter: bool)
	postprocess_indexed(node: *ASTIndexed)
	preprocess_inequal(node: *ASTInequal) (enter: bool)
	postprocess_inequal(node: *ASTInequal)
	preprocess_interfacemember(node: *ASTInterfaceMember) (enter: bool)
	postprocess_interfacemember(node: *ASTInterfaceMember)
	preprocess_interfacetype(node: *ASTInterfaceType) (enter: bool)
	postprocess_interfacetype(node: *ASTInterfaceType)
	preprocess_invariant(node: *ASTInvariant) (enter: bool)
	postprocess_invariant(node: *ASTInvariant)
	preprocess_invariantall(node: *ASTInvariantAll) (enter: bool)
	postprocess_invariantall(node: *ASTInvariantAll)
	preprocess_is(node: *ASTIs) (enter: bool)
	postprocess_is(node: *ASTIs)
	preprocess_lshift(node: *ASTLShift) (enter: bool)
	postprocess_lshift(node: *ASTLShift)
	preprocess_less(node: *ASTLess) (enter: bool)
	postprocess_less(node: *ASTLess)
	preprocess_lesseq(node: *ASTLessEq) (enter: bool)
	postprocess_lesseq(node: *ASTLessEq)
	preprocess_loopbound(node: *ASTLoopBound) (enter: bool)
	postprocess_loopbound(node: *ASTLoopBound)
	preprocess_mayfail(node: *ASTMayFail) (enter: bool)
	postprocess_mayfail(node: *ASTMayFail)
	preprocess_method(node: *ASTMethod) (enter: bool)
	postprocess_method(node: *ASTMethod)
	preprocess_methodcall(node: *ASTMethodCall) (enter: bool)
	postprocess_methodcall(node: *ASTMethodCall)
	preprocess_methodsignature(node: *ASTMethodSignature) (enter: bool)
	postprocess_methodsignature(node: *ASTMethodSignature)
	preprocess_mod(node: *ASTMod) (enter: bool)
	postprocess_mod(node: *ASTMod)
	preprocess_mult(node: *ASTMult) (enter: bool)
	postprocess_mult(node: *ASTMult)
	preprocess_new(node: *ASTNew) (enter: bool)
	postprocess_new(node: *ASTNew)
	preprocess_newarray(node: *ASTNewArray) (enter: bool)
	postprocess_newarray(node: *ASTNewArray)
	preprocess_not(node: *ASTNot) (enter: bool)
	postprocess_not(node: *ASTNot)
	preprocess_octal(node: *ASTOctal) (enter: bool)
	postprocess_octal(node: *ASTOctal)
	preprocess_or(node: *ASTOr) (enter: bool)
	postprocess_or(node: *ASTOr)
	preprocess_pexpression(node: *ASTPExpression) (enter: bool)
	postprocess_pexpression(node: *ASTPExpression)
	preprocess_parameter(node: *ASTParameter) (enter: bool)
	postprocess_parameter(node: *ASTParameter)
	preprocess_pointertype(node: *ASTPointerType) (enter: bool)
	postprocess_pointertype(node: *ASTPointerType)
	preprocess_rshift(node: *ASTRShift) (enter: bool)
	postprocess_rshift(node: *ASTRShift)
	preprocess_rangetype(node: *ASTRangeType) (enter: bool)
	postprocess_rangetype(node: *ASTRangeType)
	preprocess_recursionbound(node: *ASTRecursionBound) (enter: bool)
	postprocess_recursionbound(node: *ASTRecursionBound)
	preprocess_ref(node: *ASTRef) (enter: bool)
	postprocess_ref(node: *ASTRef)
	preprocess_requires(node: *ASTRequires) (enter: bool)
	postprocess_requires(node: *ASTRequires)
	preprocess_requiresall(node: *ASTRequiresAll) (enter: bool)
	postprocess_requiresall(node: *ASTRequiresAll)
	preprocess_return(node: *ASTReturn) (enter: bool)
	postprocess_return(node: *ASTReturn)
	preprocess_sanitycheck(node: *ASTSanityCheck) (enter: bool)
	postprocess_sanitycheck(node: *ASTSanityCheck)
	preprocess_selectiontype(node: *ASTSelectionType) (enter: bool)
	postprocess_selectiontype(node: *ASTSelectionType)
	preprocess_selector(node: *ASTSelector) (enter: bool)
	postprocess_selector(node: *ASTSelector)
	preprocess_string(node: *ASTString) (enter: bool)
	postprocess_string(node: *ASTString)
	preprocess_structmember(node: *ASTStructMember) (enter: bool)
	postprocess_structmember(node: *ASTStructMember)
	preprocess_structtype(node: *ASTStructType) (enter: bool)
	postprocess_structtype(node: *ASTStructType)
	preprocess_switch(node: *ASTSwitch) (enter: bool)
	postprocess_switch(node: *ASTSwitch)
	preprocess_switchcase(node: *ASTSwitchCase) (enter: bool)
	postprocess_switchcase(node: *ASTSwitchCase)
	preprocess_take(node: *ASTTake) (enter: bool)
	postprocess_take(node: *ASTTake)
	preprocess_typeref(node: *ASTTypeRef) (enter: bool)
	postprocess_typeref(node: *ASTTypeRef)
	preprocess_typeswitch(node: *ASTTypeSwitch) (enter: bool)
	postprocess_typeswitch(node: *ASTTypeSwitch)
	preprocess_typeswitchcase(node: *ASTTypeSwitchCase) (enter: bool)
	postprocess_typeswitchcase(node: *ASTTypeSwitchCase)
	preprocess_typedef(node: *ASTTypedef) (enter: bool)
	postprocess_typedef(node: *ASTTypedef)
	preprocess_unaryminus(node: *ASTUnaryMinus) (enter: bool)
	postprocess_unaryminus(node: *ASTUnaryMinus)
	preprocess_unaryplus(node: *ASTUnaryPlus) (enter: bool)
	postprocess_unaryplus(node: *ASTUnaryPlus)
	preprocess_vardecl(node: *ASTVardecl) (enter: bool)
	postprocess_vardecl(node: *ASTVardecl)
	preprocess_vardecltyped(node: *ASTVardeclTyped) (enter: bool)
	postprocess_vardecltyped(node: *ASTVardeclTyped)
	preprocess_while(node: *ASTWhile) (enter: bool)
	postprocess_while(node: *ASTWhile)
}
func visit_and(v: *Visitor, node: *ASTAnd)
{
	if node == null {
		return
	}
	
	if !v.preprocess_and(node) {
		return
	}
	
	var i: int
	
	visit_level5expression(v, node._left)
	visit_level4expression(v, node._right)
	
	v.postprocess_and(node)
}
func (v: *NullVisitor) preprocess_and(node: *ASTAnd) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_and(node: *ASTAnd)
{
	unused(node)
}
func visit_arraytype(v: *Visitor, node: *ASTArrayType)
{
	if node == null {
		return
	}
	
	if !v.preprocess_arraytype(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._length)
	visit_type(v, node._element_type)
	
	v.postprocess_arraytype(node)
}
func (v: *NullVisitor) preprocess_arraytype(node: *ASTArrayType) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_arraytype(node: *ASTArrayType)
{
	unused(node)
}
func visit_assert(v: *Visitor, node: *ASTAssert)
{
	if node == null {
		return
	}
	
	if !v.preprocess_assert(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_assert(node)
}
func (v: *NullVisitor) preprocess_assert(node: *ASTAssert) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_assert(node: *ASTAssert)
{
	unused(node)
}
func visit_assertall(v: *Visitor, node: *ASTAssertAll)
{
	if node == null {
		return
	}
	
	if !v.preprocess_assertall(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_assertall(node)
}
func (v: *NullVisitor) preprocess_assertall(node: *ASTAssertAll) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_assertall(node: *ASTAssertAll)
{
	unused(node)
}
func visit_assignment(v: *Visitor, node: *ASTAssignment)
{
	if node == null {
		return
	}
	
	if !v.preprocess_assignment(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._rvalues) {
		visit_expression(v, node._rvalues[i])
		i++
	}
	i = 0
	while i < len(node._lvalues) {
		visit_expression(v, node._lvalues[i])
		i++
	}
	
	v.postprocess_assignment(node)
}
func (v: *NullVisitor) preprocess_assignment(node: *ASTAssignment) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_assignment(node: *ASTAssignment)
{
	unused(node)
}
func visit_assume(v: *Visitor, node: *ASTAssume)
{
	if node == null {
		return
	}
	
	if !v.preprocess_assume(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_assume(node)
}
func (v: *NullVisitor) preprocess_assume(node: *ASTAssume) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_assume(node: *ASTAssume)
{
	unused(node)
}
func visit_binaryminus(v: *Visitor, node: *ASTBinaryMinus)
{
	if node == null {
		return
	}
	
	if !v.preprocess_binaryminus(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level2expression(v, node._right)
	
	v.postprocess_binaryminus(node)
}
func (v: *NullVisitor) preprocess_binaryminus(node: *ASTBinaryMinus) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_binaryminus(node: *ASTBinaryMinus)
{
	unused(node)
}
func visit_binaryplus(v: *Visitor, node: *ASTBinaryPlus)
{
	if node == null {
		return
	}
	
	if !v.preprocess_binaryplus(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level2expression(v, node._right)
	
	v.postprocess_binaryplus(node)
}
func (v: *NullVisitor) preprocess_binaryplus(node: *ASTBinaryPlus) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_binaryplus(node: *ASTBinaryPlus)
{
	unused(node)
}
func visit_bitand(v: *Visitor, node: *ASTBitAnd)
{
	if node == null {
		return
	}
	
	if !v.preprocess_bitand(node) {
		return
	}
	
	var i: int
	
	visit_level2expression(v, node._left)
	visit_level1expression(v, node._right)
	
	v.postprocess_bitand(node)
}
func (v: *NullVisitor) preprocess_bitand(node: *ASTBitAnd) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_bitand(node: *ASTBitAnd)
{
	unused(node)
}
func visit_bitor(v: *Visitor, node: *ASTBitOr)
{
	if node == null {
		return
	}
	
	if !v.preprocess_bitor(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level2expression(v, node._right)
	
	v.postprocess_bitor(node)
}
func (v: *NullVisitor) preprocess_bitor(node: *ASTBitOr) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_bitor(node: *ASTBitOr)
{
	unused(node)
}
func visit_bitxor(v: *Visitor, node: *ASTBitXor)
{
	if node == null {
		return
	}
	
	if !v.preprocess_bitxor(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level2expression(v, node._right)
	
	v.postprocess_bitxor(node)
}
func (v: *NullVisitor) preprocess_bitxor(node: *ASTBitXor) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_bitxor(node: *ASTBitXor)
{
	unused(node)
}
func visit_block(v: *Visitor, node: *ASTBlock)
{
	if node == null {
		return
	}
	
	if !v.preprocess_block(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._statements) {
		visit_statement(v, node._statements[i])
		i++
	}
	
	v.postprocess_block(node)
}
func (v: *NullVisitor) preprocess_block(node: *ASTBlock) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_block(node: *ASTBlock)
{
	unused(node)
}
func visit_break(v: *Visitor, node: *ASTBreak)
{
	if node == null {
		return
	}
	
	if !v.preprocess_break(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_break(node)
}
func (v: *NullVisitor) preprocess_break(node: *ASTBreak) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_break(node: *ASTBreak)
{
	unused(node)
}
func visit_char(v: *Visitor, node: *ASTChar)
{
	if node == null {
		return
	}
	
	if !v.preprocess_char(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_char(node)
}
func (v: *NullVisitor) preprocess_char(node: *ASTChar) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_char(node: *ASTChar)
{
	unused(node)
}
func visit_continue(v: *Visitor, node: *ASTContinue)
{
	if node == null {
		return
	}
	
	if !v.preprocess_continue(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_continue(node)
}
func (v: *NullVisitor) preprocess_continue(node: *ASTContinue) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_continue(node: *ASTContinue)
{
	unused(node)
}
func visit_decimal(v: *Visitor, node: *ASTDecimal)
{
	if node == null {
		return
	}
	
	if !v.preprocess_decimal(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_decimal(node)
}
func (v: *NullVisitor) preprocess_decimal(node: *ASTDecimal) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_decimal(node: *ASTDecimal)
{
	unused(node)
}
func visit_decrement(v: *Visitor, node: *ASTDecrement)
{
	if node == null {
		return
	}
	
	if !v.preprocess_decrement(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._lvalue)
	
	v.postprocess_decrement(node)
}
func (v: *NullVisitor) preprocess_decrement(node: *ASTDecrement) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_decrement(node: *ASTDecrement)
{
	unused(node)
}
func visit_defaultcase(v: *Visitor, node: *ASTDefaultCase)
{
	if node == null {
		return
	}
	
	if !v.preprocess_defaultcase(node) {
		return
	}
	
	var i: int
	
	visit_block(v, node._body)
	
	v.postprocess_defaultcase(node)
}
func (v: *NullVisitor) preprocess_defaultcase(node: *ASTDefaultCase) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_defaultcase(node: *ASTDefaultCase)
{
	unused(node)
}
func visit_delete(v: *Visitor, node: *ASTDelete)
{
	if node == null {
		return
	}
	
	if !v.preprocess_delete(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._arg)
	
	v.postprocess_delete(node)
}
func (v: *NullVisitor) preprocess_delete(node: *ASTDelete) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_delete(node: *ASTDelete)
{
	unused(node)
}
func visit_deref(v: *Visitor, node: *ASTDeref)
{
	if node == null {
		return
	}
	
	if !v.preprocess_deref(node) {
		return
	}
	
	var i: int
	
	visit_level1expression(v, node._arg)
	
	v.postprocess_deref(node)
}
func (v: *NullVisitor) preprocess_deref(node: *ASTDeref) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_deref(node: *ASTDeref)
{
	unused(node)
}
func visit_div(v: *Visitor, node: *ASTDiv)
{
	if node == null {
		return
	}
	
	if !v.preprocess_div(node) {
		return
	}
	
	var i: int
	
	visit_level2expression(v, node._left)
	visit_level1expression(v, node._right)
	
	v.postprocess_div(node)
}
func (v: *NullVisitor) preprocess_div(node: *ASTDiv) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_div(node: *ASTDiv)
{
	unused(node)
}
func visit_elsebranch(v: *Visitor, node: *ASTElseBranch)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTBlock {
		visit_block(v, node)
	}
	case *ASTIf {
		visit_if(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_ensures(v: *Visitor, node: *ASTEnsures)
{
	if node == null {
		return
	}
	
	if !v.preprocess_ensures(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_ensures(node)
}
func (v: *NullVisitor) preprocess_ensures(node: *ASTEnsures) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_ensures(node: *ASTEnsures)
{
	unused(node)
}
func visit_ensuresall(v: *Visitor, node: *ASTEnsuresAll)
{
	if node == null {
		return
	}
	
	if !v.preprocess_ensuresall(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_ensuresall(node)
}
func (v: *NullVisitor) preprocess_ensuresall(node: *ASTEnsuresAll) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_ensuresall(node: *ASTEnsuresAll)
{
	unused(node)
}
func visit_equal(v: *Visitor, node: *ASTEqual)
{
	if node == null {
		return
	}
	
	if !v.preprocess_equal(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level3expression(v, node._right)
	
	v.postprocess_equal(node)
}
func (v: *NullVisitor) preprocess_equal(node: *ASTEqual) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_equal(node: *ASTEqual)
{
	unused(node)
}
func visit_expression(v: *Visitor, node: *ASTExpression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTOr {
		visit_or(v, node)
	}
	case *ASTAnd {
		visit_and(v, node)
	}
	case *ASTLess {
		visit_less(v, node)
	}
	case *ASTLessEq {
		visit_lesseq(v, node)
	}
	case *ASTGreater {
		visit_greater(v, node)
	}
	case *ASTGreaterEq {
		visit_greatereq(v, node)
	}
	case *ASTEqual {
		visit_equal(v, node)
	}
	case *ASTInequal {
		visit_inequal(v, node)
	}
	case *ASTIs {
		visit_is(v, node)
	}
	case *ASTBinaryPlus {
		visit_binaryplus(v, node)
	}
	case *ASTBinaryMinus {
		visit_binaryminus(v, node)
	}
	case *ASTBitOr {
		visit_bitor(v, node)
	}
	case *ASTBitXor {
		visit_bitxor(v, node)
	}
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_fail(v: *Visitor, node: *ASTFail)
{
	if node == null {
		return
	}
	
	if !v.preprocess_fail(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_fail(node)
}
func (v: *NullVisitor) preprocess_fail(node: *ASTFail) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_fail(node: *ASTFail)
{
	unused(node)
}
func visit_failrecover(v: *Visitor, node: *ASTFailRecover)
{
	if node == null {
		return
	}
	
	if !v.preprocess_failrecover(node) {
		return
	}
	
	var i: int
	
	visit_recoverable(v, node._stmt)
	visit_block(v, node._recover_block)
	
	v.postprocess_failrecover(node)
}
func (v: *NullVisitor) preprocess_failrecover(node: *ASTFailRecover) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_failrecover(node: *ASTFailRecover)
{
	unused(node)
}
func visit_file(v: *Visitor, node: *ASTFile)
{
	if node == null {
		return
	}
	
	if !v.preprocess_file(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._globals) {
		visit_global(v, node._globals[i])
		i++
	}
	
	v.postprocess_file(node)
}
func (v: *NullVisitor) preprocess_file(node: *ASTFile) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_file(node: *ASTFile)
{
	unused(node)
}
func visit_global(v: *Visitor, node: *ASTGlobal)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTMethod {
		visit_method(v, node)
	}
	case *ASTTypedef {
		visit_typedef(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_greater(v: *Visitor, node: *ASTGreater)
{
	if node == null {
		return
	}
	
	if !v.preprocess_greater(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level3expression(v, node._right)
	
	v.postprocess_greater(node)
}
func (v: *NullVisitor) preprocess_greater(node: *ASTGreater) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_greater(node: *ASTGreater)
{
	unused(node)
}
func visit_greatereq(v: *Visitor, node: *ASTGreaterEq)
{
	if node == null {
		return
	}
	
	if !v.preprocess_greatereq(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level3expression(v, node._right)
	
	v.postprocess_greatereq(node)
}
func (v: *NullVisitor) preprocess_greatereq(node: *ASTGreaterEq) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_greatereq(node: *ASTGreaterEq)
{
	unused(node)
}
func visit_hexadecimal(v: *Visitor, node: *ASTHexaDecimal)
{
	if node == null {
		return
	}
	
	if !v.preprocess_hexadecimal(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_hexadecimal(node)
}
func (v: *NullVisitor) preprocess_hexadecimal(node: *ASTHexaDecimal) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_hexadecimal(node: *ASTHexaDecimal)
{
	unused(node)
}
func visit_identifier(v: *Visitor, node: *ASTIdentifier)
{
	if node == null {
		return
	}
	
	if !v.preprocess_identifier(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_identifier(node)
}
func (v: *NullVisitor) preprocess_identifier(node: *ASTIdentifier) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_identifier(node: *ASTIdentifier)
{
	unused(node)
}
func visit_if(v: *Visitor, node: *ASTIf)
{
	if node == null {
		return
	}
	
	if !v.preprocess_if(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._condition)
	visit_block(v, node._true_branch)
	visit_elsebranch(v, node._false_branch)
	
	v.postprocess_if(node)
}
func (v: *NullVisitor) preprocess_if(node: *ASTIf) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_if(node: *ASTIf)
{
	unused(node)
}
func visit_increment(v: *Visitor, node: *ASTIncrement)
{
	if node == null {
		return
	}
	
	if !v.preprocess_increment(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._lvalue)
	
	v.postprocess_increment(node)
}
func (v: *NullVisitor) preprocess_increment(node: *ASTIncrement) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_increment(node: *ASTIncrement)
{
	unused(node)
}
func visit_indexed(v: *Visitor, node: *ASTIndexed)
{
	if node == null {
		return
	}
	
	if !v.preprocess_indexed(node) {
		return
	}
	
	var i: int
	
	visit_level0expression(v, node._base)
	visit_expression(v, node._index)
	
	v.postprocess_indexed(node)
}
func (v: *NullVisitor) preprocess_indexed(node: *ASTIndexed) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_indexed(node: *ASTIndexed)
{
	unused(node)
}
func visit_inequal(v: *Visitor, node: *ASTInequal)
{
	if node == null {
		return
	}
	
	if !v.preprocess_inequal(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level3expression(v, node._right)
	
	v.postprocess_inequal(node)
}
func (v: *NullVisitor) preprocess_inequal(node: *ASTInequal) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_inequal(node: *ASTInequal)
{
	unused(node)
}
func visit_interfacemember(v: *Visitor, node: *ASTInterfaceMember)
{
	if node == null {
		return
	}
	
	if !v.preprocess_interfacemember(node) {
		return
	}
	
	var i: int
	
	visit_methodsignature(v, node._signature)
	
	v.postprocess_interfacemember(node)
}
func (v: *NullVisitor) preprocess_interfacemember(node: *ASTInterfaceMember) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_interfacemember(node: *ASTInterfaceMember)
{
	unused(node)
}
func visit_interfacetype(v: *Visitor, node: *ASTInterfaceType)
{
	if node == null {
		return
	}
	
	if !v.preprocess_interfacetype(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._members) {
		visit_interfacemember(v, node._members[i])
		i++
	}
	
	v.postprocess_interfacetype(node)
}
func (v: *NullVisitor) preprocess_interfacetype(node: *ASTInterfaceType) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_interfacetype(node: *ASTInterfaceType)
{
	unused(node)
}
func visit_invariant(v: *Visitor, node: *ASTInvariant)
{
	if node == null {
		return
	}
	
	if !v.preprocess_invariant(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_invariant(node)
}
func (v: *NullVisitor) preprocess_invariant(node: *ASTInvariant) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_invariant(node: *ASTInvariant)
{
	unused(node)
}
func visit_invariantall(v: *Visitor, node: *ASTInvariantAll)
{
	if node == null {
		return
	}
	
	if !v.preprocess_invariantall(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_invariantall(node)
}
func (v: *NullVisitor) preprocess_invariantall(node: *ASTInvariantAll) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_invariantall(node: *ASTInvariantAll)
{
	unused(node)
}
func visit_is(v: *Visitor, node: *ASTIs)
{
	if node == null {
		return
	}
	
	if !v.preprocess_is(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._arg)
	visit_type(v, node._type)
	
	v.postprocess_is(node)
}
func (v: *NullVisitor) preprocess_is(node: *ASTIs) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_is(node: *ASTIs)
{
	unused(node)
}
func visit_lshift(v: *Visitor, node: *ASTLShift)
{
	if node == null {
		return
	}
	
	if !v.preprocess_lshift(node) {
		return
	}
	
	var i: int
	
	visit_level2expression(v, node._left)
	visit_level1expression(v, node._right)
	
	v.postprocess_lshift(node)
}
func (v: *NullVisitor) preprocess_lshift(node: *ASTLShift) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_lshift(node: *ASTLShift)
{
	unused(node)
}
func visit_less(v: *Visitor, node: *ASTLess)
{
	if node == null {
		return
	}
	
	if !v.preprocess_less(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level3expression(v, node._right)
	
	v.postprocess_less(node)
}
func (v: *NullVisitor) preprocess_less(node: *ASTLess) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_less(node: *ASTLess)
{
	unused(node)
}
func visit_lesseq(v: *Visitor, node: *ASTLessEq)
{
	if node == null {
		return
	}
	
	if !v.preprocess_lesseq(node) {
		return
	}
	
	var i: int
	
	visit_level3expression(v, node._left)
	visit_level3expression(v, node._right)
	
	v.postprocess_lesseq(node)
}
func (v: *NullVisitor) preprocess_lesseq(node: *ASTLessEq) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_lesseq(node: *ASTLessEq)
{
	unused(node)
}
func visit_level0expression(v: *Visitor, node: *ASTLevel0Expression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_level1expression(v: *Visitor, node: *ASTLevel1Expression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_level2expression(v: *Visitor, node: *ASTLevel2Expression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_level3expression(v: *Visitor, node: *ASTLevel3Expression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTBinaryPlus {
		visit_binaryplus(v, node)
	}
	case *ASTBinaryMinus {
		visit_binaryminus(v, node)
	}
	case *ASTBitOr {
		visit_bitor(v, node)
	}
	case *ASTBitXor {
		visit_bitxor(v, node)
	}
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_level4expression(v: *Visitor, node: *ASTLevel4Expression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTLess {
		visit_less(v, node)
	}
	case *ASTLessEq {
		visit_lesseq(v, node)
	}
	case *ASTGreater {
		visit_greater(v, node)
	}
	case *ASTGreaterEq {
		visit_greatereq(v, node)
	}
	case *ASTEqual {
		visit_equal(v, node)
	}
	case *ASTInequal {
		visit_inequal(v, node)
	}
	case *ASTIs {
		visit_is(v, node)
	}
	case *ASTBinaryPlus {
		visit_binaryplus(v, node)
	}
	case *ASTBinaryMinus {
		visit_binaryminus(v, node)
	}
	case *ASTBitOr {
		visit_bitor(v, node)
	}
	case *ASTBitXor {
		visit_bitxor(v, node)
	}
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_level5expression(v: *Visitor, node: *ASTLevel5Expression)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTAnd {
		visit_and(v, node)
	}
	case *ASTLess {
		visit_less(v, node)
	}
	case *ASTLessEq {
		visit_lesseq(v, node)
	}
	case *ASTGreater {
		visit_greater(v, node)
	}
	case *ASTGreaterEq {
		visit_greatereq(v, node)
	}
	case *ASTEqual {
		visit_equal(v, node)
	}
	case *ASTInequal {
		visit_inequal(v, node)
	}
	case *ASTIs {
		visit_is(v, node)
	}
	case *ASTBinaryPlus {
		visit_binaryplus(v, node)
	}
	case *ASTBinaryMinus {
		visit_binaryminus(v, node)
	}
	case *ASTBitOr {
		visit_bitor(v, node)
	}
	case *ASTBitXor {
		visit_bitxor(v, node)
	}
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_literal(v: *Visitor, node: *ASTLiteral)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_loopbound(v: *Visitor, node: *ASTLoopBound)
{
	if node == null {
		return
	}
	
	if !v.preprocess_loopbound(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_loopbound(node)
}
func (v: *NullVisitor) preprocess_loopbound(node: *ASTLoopBound) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_loopbound(node: *ASTLoopBound)
{
	unused(node)
}
func visit_mayfail(v: *Visitor, node: *ASTMayFail)
{
	if node == null {
		return
	}
	
	if !v.preprocess_mayfail(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_mayfail(node)
}
func (v: *NullVisitor) preprocess_mayfail(node: *ASTMayFail) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_mayfail(node: *ASTMayFail)
{
	unused(node)
}
func visit_method(v: *Visitor, node: *ASTMethod)
{
	if node == null {
		return
	}
	
	if !v.preprocess_method(node) {
		return
	}
	
	var i: int
	
	visit_parameter(v, node._receiver)
	visit_methodsignature(v, node._signature)
	i = 0
	while i < len(node._contracts) {
		visit_methodcontract(v, node._contracts[i])
		i++
	}
	visit_block(v, node._body)
	
	v.postprocess_method(node)
}
func (v: *NullVisitor) preprocess_method(node: *ASTMethod) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_method(node: *ASTMethod)
{
	unused(node)
}
func visit_methodcall(v: *Visitor, node: *ASTMethodCall)
{
	if node == null {
		return
	}
	
	if !v.preprocess_methodcall(node) {
		return
	}
	
	var i: int
	
	visit_level0expression(v, node._receiver)
	i = 0
	while i < len(node._args) {
		visit_expression(v, node._args[i])
		i++
	}
	
	v.postprocess_methodcall(node)
}
func (v: *NullVisitor) preprocess_methodcall(node: *ASTMethodCall) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_methodcall(node: *ASTMethodCall)
{
	unused(node)
}
func visit_methodcontract(v: *Visitor, node: *ASTMethodContract)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTRequires {
		visit_requires(v, node)
	}
	case *ASTRequiresAll {
		visit_requiresall(v, node)
	}
	case *ASTEnsures {
		visit_ensures(v, node)
	}
	case *ASTEnsuresAll {
		visit_ensuresall(v, node)
	}
	case *ASTMayFail {
		visit_mayfail(v, node)
	}
	case *ASTRecursionBound {
		visit_recursionbound(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_methodsignature(v: *Visitor, node: *ASTMethodSignature)
{
	if node == null {
		return
	}
	
	if !v.preprocess_methodsignature(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._in_params) {
		visit_parameter(v, node._in_params[i])
		i++
	}
	i = 0
	while i < len(node._out_params) {
		visit_parameter(v, node._out_params[i])
		i++
	}
	
	v.postprocess_methodsignature(node)
}
func (v: *NullVisitor) preprocess_methodsignature(node: *ASTMethodSignature) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_methodsignature(node: *ASTMethodSignature)
{
	unused(node)
}
func visit_mod(v: *Visitor, node: *ASTMod)
{
	if node == null {
		return
	}
	
	if !v.preprocess_mod(node) {
		return
	}
	
	var i: int
	
	visit_level2expression(v, node._left)
	visit_level1expression(v, node._right)
	
	v.postprocess_mod(node)
}
func (v: *NullVisitor) preprocess_mod(node: *ASTMod) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_mod(node: *ASTMod)
{
	unused(node)
}
func visit_mult(v: *Visitor, node: *ASTMult)
{
	if node == null {
		return
	}
	
	if !v.preprocess_mult(node) {
		return
	}
	
	var i: int
	
	visit_level2expression(v, node._left)
	visit_level1expression(v, node._right)
	
	v.postprocess_mult(node)
}
func (v: *NullVisitor) preprocess_mult(node: *ASTMult) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_mult(node: *ASTMult)
{
	unused(node)
}
func visit_namedtype(v: *Visitor, node: *ASTNamedType)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTStructType {
		visit_structtype(v, node)
	}
	case *ASTInterfaceType {
		visit_interfacetype(v, node)
	}
	case *ASTSelectionType {
		visit_selectiontype(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_new(v: *Visitor, node: *ASTNew)
{
	if node == null {
		return
	}
	
	if !v.preprocess_new(node) {
		return
	}
	
	var i: int
	
	visit_type(v, node._type)
	
	v.postprocess_new(node)
}
func (v: *NullVisitor) preprocess_new(node: *ASTNew) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_new(node: *ASTNew)
{
	unused(node)
}
func visit_newarray(v: *Visitor, node: *ASTNewArray)
{
	if node == null {
		return
	}
	
	if !v.preprocess_newarray(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._length)
	visit_type(v, node._type)
	
	v.postprocess_newarray(node)
}
func (v: *NullVisitor) preprocess_newarray(node: *ASTNewArray) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_newarray(node: *ASTNewArray)
{
	unused(node)
}
func visit_not(v: *Visitor, node: *ASTNot)
{
	if node == null {
		return
	}
	
	if !v.preprocess_not(node) {
		return
	}
	
	var i: int
	
	visit_level1expression(v, node._arg)
	
	v.postprocess_not(node)
}
func (v: *NullVisitor) preprocess_not(node: *ASTNot) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_not(node: *ASTNot)
{
	unused(node)
}
func visit_octal(v: *Visitor, node: *ASTOctal)
{
	if node == null {
		return
	}
	
	if !v.preprocess_octal(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_octal(node)
}
func (v: *NullVisitor) preprocess_octal(node: *ASTOctal) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_octal(node: *ASTOctal)
{
	unused(node)
}
func visit_or(v: *Visitor, node: *ASTOr)
{
	if node == null {
		return
	}
	
	if !v.preprocess_or(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._left)
	visit_level5expression(v, node._right)
	
	v.postprocess_or(node)
}
func (v: *NullVisitor) preprocess_or(node: *ASTOr) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_or(node: *ASTOr)
{
	unused(node)
}
func visit_pexpression(v: *Visitor, node: *ASTPExpression)
{
	if node == null {
		return
	}
	
	if !v.preprocess_pexpression(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_pexpression(node)
}
func (v: *NullVisitor) preprocess_pexpression(node: *ASTPExpression) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_pexpression(node: *ASTPExpression)
{
	unused(node)
}
func visit_parameter(v: *Visitor, node: *ASTParameter)
{
	if node == null {
		return
	}
	
	if !v.preprocess_parameter(node) {
		return
	}
	
	var i: int
	
	visit_type(v, node._type)
	
	v.postprocess_parameter(node)
}
func (v: *NullVisitor) preprocess_parameter(node: *ASTParameter) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_parameter(node: *ASTParameter)
{
	unused(node)
}
func visit_pointertype(v: *Visitor, node: *ASTPointerType)
{
	if node == null {
		return
	}
	
	if !v.preprocess_pointertype(node) {
		return
	}
	
	var i: int
	
	visit_type(v, node._inner_type)
	
	v.postprocess_pointertype(node)
}
func (v: *NullVisitor) preprocess_pointertype(node: *ASTPointerType) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_pointertype(node: *ASTPointerType)
{
	unused(node)
}
func visit_rshift(v: *Visitor, node: *ASTRShift)
{
	if node == null {
		return
	}
	
	if !v.preprocess_rshift(node) {
		return
	}
	
	var i: int
	
	visit_level2expression(v, node._left)
	visit_level1expression(v, node._right)
	
	v.postprocess_rshift(node)
}
func (v: *NullVisitor) preprocess_rshift(node: *ASTRShift) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_rshift(node: *ASTRShift)
{
	unused(node)
}
func visit_rangetype(v: *Visitor, node: *ASTRangeType)
{
	if node == null {
		return
	}
	
	if !v.preprocess_rangetype(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._low)
	visit_expression(v, node._high)
	
	v.postprocess_rangetype(node)
}
func (v: *NullVisitor) preprocess_rangetype(node: *ASTRangeType) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_rangetype(node: *ASTRangeType)
{
	unused(node)
}
func visit_recoverable(v: *Visitor, node: *ASTRecoverable)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTAssignment {
		visit_assignment(v, node)
	}
	case *ASTVardecl {
		visit_vardecl(v, node)
	}
	case *ASTOr {
		visit_or(v, node)
	}
	case *ASTAnd {
		visit_and(v, node)
	}
	case *ASTLess {
		visit_less(v, node)
	}
	case *ASTLessEq {
		visit_lesseq(v, node)
	}
	case *ASTGreater {
		visit_greater(v, node)
	}
	case *ASTGreaterEq {
		visit_greatereq(v, node)
	}
	case *ASTEqual {
		visit_equal(v, node)
	}
	case *ASTInequal {
		visit_inequal(v, node)
	}
	case *ASTIs {
		visit_is(v, node)
	}
	case *ASTBinaryPlus {
		visit_binaryplus(v, node)
	}
	case *ASTBinaryMinus {
		visit_binaryminus(v, node)
	}
	case *ASTBitOr {
		visit_bitor(v, node)
	}
	case *ASTBitXor {
		visit_bitxor(v, node)
	}
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_recursionbound(v: *Visitor, node: *ASTRecursionBound)
{
	if node == null {
		return
	}
	
	if !v.preprocess_recursionbound(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_recursionbound(node)
}
func (v: *NullVisitor) preprocess_recursionbound(node: *ASTRecursionBound) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_recursionbound(node: *ASTRecursionBound)
{
	unused(node)
}
func visit_ref(v: *Visitor, node: *ASTRef)
{
	if node == null {
		return
	}
	
	if !v.preprocess_ref(node) {
		return
	}
	
	var i: int
	
	visit_level1expression(v, node._arg)
	
	v.postprocess_ref(node)
}
func (v: *NullVisitor) preprocess_ref(node: *ASTRef) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_ref(node: *ASTRef)
{
	unused(node)
}
func visit_requires(v: *Visitor, node: *ASTRequires)
{
	if node == null {
		return
	}
	
	if !v.preprocess_requires(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_requires(node)
}
func (v: *NullVisitor) preprocess_requires(node: *ASTRequires) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_requires(node: *ASTRequires)
{
	unused(node)
}
func visit_requiresall(v: *Visitor, node: *ASTRequiresAll)
{
	if node == null {
		return
	}
	
	if !v.preprocess_requiresall(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_requiresall(node)
}
func (v: *NullVisitor) preprocess_requiresall(node: *ASTRequiresAll) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_requiresall(node: *ASTRequiresAll)
{
	unused(node)
}
func visit_return(v: *Visitor, node: *ASTReturn)
{
	if node == null {
		return
	}
	
	if !v.preprocess_return(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._retvals) {
		visit_expression(v, node._retvals[i])
		i++
	}
	
	v.postprocess_return(node)
}
func (v: *NullVisitor) preprocess_return(node: *ASTReturn) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_return(node: *ASTReturn)
{
	unused(node)
}
func visit_sanitycheck(v: *Visitor, node: *ASTSanityCheck)
{
	if node == null {
		return
	}
	
	if !v.preprocess_sanitycheck(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._expr)
	
	v.postprocess_sanitycheck(node)
}
func (v: *NullVisitor) preprocess_sanitycheck(node: *ASTSanityCheck) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_sanitycheck(node: *ASTSanityCheck)
{
	unused(node)
}
func visit_selectiontype(v: *Visitor, node: *ASTSelectionType)
{
	if node == null {
		return
	}
	
	if !v.preprocess_selectiontype(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._types) {
		visit_type(v, node._types[i])
		i++
	}
	
	v.postprocess_selectiontype(node)
}
func (v: *NullVisitor) preprocess_selectiontype(node: *ASTSelectionType) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_selectiontype(node: *ASTSelectionType)
{
	unused(node)
}
func visit_selector(v: *Visitor, node: *ASTSelector)
{
	if node == null {
		return
	}
	
	if !v.preprocess_selector(node) {
		return
	}
	
	var i: int
	
	visit_level0expression(v, node._base)
	
	v.postprocess_selector(node)
}
func (v: *NullVisitor) preprocess_selector(node: *ASTSelector) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_selector(node: *ASTSelector)
{
	unused(node)
}
func visit_statement(v: *Visitor, node: *ASTStatement)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTVardecl {
		visit_vardecl(v, node)
	}
	case *ASTVardeclTyped {
		visit_vardecltyped(v, node)
	}
	case *ASTWhile {
		visit_while(v, node)
	}
	case *ASTReturn {
		visit_return(v, node)
	}
	case *ASTBreak {
		visit_break(v, node)
	}
	case *ASTContinue {
		visit_continue(v, node)
	}
	case *ASTBlock {
		visit_block(v, node)
	}
	case *ASTIf {
		visit_if(v, node)
	}
	case *ASTAssignment {
		visit_assignment(v, node)
	}
	case *ASTIncrement {
		visit_increment(v, node)
	}
	case *ASTDecrement {
		visit_decrement(v, node)
	}
	case *ASTDelete {
		visit_delete(v, node)
	}
	case *ASTSwitch {
		visit_switch(v, node)
	}
	case *ASTTypeSwitch {
		visit_typeswitch(v, node)
	}
	case *ASTAssert {
		visit_assert(v, node)
	}
	case *ASTAssertAll {
		visit_assertall(v, node)
	}
	case *ASTAssume {
		visit_assume(v, node)
	}
	case *ASTFail {
		visit_fail(v, node)
	}
	case *ASTSanityCheck {
		visit_sanitycheck(v, node)
	}
	case *ASTFailRecover {
		visit_failrecover(v, node)
	}
	case *ASTOr {
		visit_or(v, node)
	}
	case *ASTAnd {
		visit_and(v, node)
	}
	case *ASTLess {
		visit_less(v, node)
	}
	case *ASTLessEq {
		visit_lesseq(v, node)
	}
	case *ASTGreater {
		visit_greater(v, node)
	}
	case *ASTGreaterEq {
		visit_greatereq(v, node)
	}
	case *ASTEqual {
		visit_equal(v, node)
	}
	case *ASTInequal {
		visit_inequal(v, node)
	}
	case *ASTIs {
		visit_is(v, node)
	}
	case *ASTBinaryPlus {
		visit_binaryplus(v, node)
	}
	case *ASTBinaryMinus {
		visit_binaryminus(v, node)
	}
	case *ASTBitOr {
		visit_bitor(v, node)
	}
	case *ASTBitXor {
		visit_bitxor(v, node)
	}
	case *ASTMult {
		visit_mult(v, node)
	}
	case *ASTDiv {
		visit_div(v, node)
	}
	case *ASTMod {
		visit_mod(v, node)
	}
	case *ASTLShift {
		visit_lshift(v, node)
	}
	case *ASTRShift {
		visit_rshift(v, node)
	}
	case *ASTBitAnd {
		visit_bitand(v, node)
	}
	case *ASTUnaryPlus {
		visit_unaryplus(v, node)
	}
	case *ASTUnaryMinus {
		visit_unaryminus(v, node)
	}
	case *ASTDeref {
		visit_deref(v, node)
	}
	case *ASTRef {
		visit_ref(v, node)
	}
	case *ASTNot {
		visit_not(v, node)
	}
	case *ASTTake {
		visit_take(v, node)
	}
	case *ASTMethodCall {
		visit_methodcall(v, node)
	}
	case *ASTSelector {
		visit_selector(v, node)
	}
	case *ASTIndexed {
		visit_indexed(v, node)
	}
	case *ASTIdentifier {
		visit_identifier(v, node)
	}
	case *ASTNew {
		visit_new(v, node)
	}
	case *ASTNewArray {
		visit_newarray(v, node)
	}
	case *ASTPExpression {
		visit_pexpression(v, node)
	}
	case *ASTDecimal {
		visit_decimal(v, node)
	}
	case *ASTOctal {
		visit_octal(v, node)
	}
	case *ASTHexaDecimal {
		visit_hexadecimal(v, node)
	}
	case *ASTString {
		visit_string(v, node)
	}
	case *ASTChar {
		visit_char(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_string(v: *Visitor, node: *ASTString)
{
	if node == null {
		return
	}
	
	if !v.preprocess_string(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_string(node)
}
func (v: *NullVisitor) preprocess_string(node: *ASTString) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_string(node: *ASTString)
{
	unused(node)
}
func visit_structmember(v: *Visitor, node: *ASTStructMember)
{
	if node == null {
		return
	}
	
	if !v.preprocess_structmember(node) {
		return
	}
	
	var i: int
	
	visit_type(v, node._type)
	
	v.postprocess_structmember(node)
}
func (v: *NullVisitor) preprocess_structmember(node: *ASTStructMember) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_structmember(node: *ASTStructMember)
{
	unused(node)
}
func visit_structtype(v: *Visitor, node: *ASTStructType)
{
	if node == null {
		return
	}
	
	if !v.preprocess_structtype(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._members) {
		visit_structmember(v, node._members[i])
		i++
	}
	
	v.postprocess_structtype(node)
}
func (v: *NullVisitor) preprocess_structtype(node: *ASTStructType) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_structtype(node: *ASTStructType)
{
	unused(node)
}
func visit_switch(v: *Visitor, node: *ASTSwitch)
{
	if node == null {
		return
	}
	
	if !v.preprocess_switch(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._discriminant)
	i = 0
	while i < len(node._cases) {
		visit_switchcase(v, node._cases[i])
		i++
	}
	visit_defaultcase(v, node._default)
	
	v.postprocess_switch(node)
}
func (v: *NullVisitor) preprocess_switch(node: *ASTSwitch) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_switch(node: *ASTSwitch)
{
	unused(node)
}
func visit_switchcase(v: *Visitor, node: *ASTSwitchCase)
{
	if node == null {
		return
	}
	
	if !v.preprocess_switchcase(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._matches) {
		visit_expression(v, node._matches[i])
		i++
	}
	visit_block(v, node._body)
	
	v.postprocess_switchcase(node)
}
func (v: *NullVisitor) preprocess_switchcase(node: *ASTSwitchCase) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_switchcase(node: *ASTSwitchCase)
{
	unused(node)
}
func visit_take(v: *Visitor, node: *ASTTake)
{
	if node == null {
		return
	}
	
	if !v.preprocess_take(node) {
		return
	}
	
	var i: int
	
	visit_level1expression(v, node._arg)
	
	v.postprocess_take(node)
}
func (v: *NullVisitor) preprocess_take(node: *ASTTake) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_take(node: *ASTTake)
{
	unused(node)
}
func visit_type(v: *Visitor, node: *ASTType)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTTypeRef {
		visit_typeref(v, node)
	}
	case *ASTRangeType {
		visit_rangetype(v, node)
	}
	case *ASTArrayType {
		visit_arraytype(v, node)
	}
	case *ASTPointerType {
		visit_pointertype(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
func visit_typeref(v: *Visitor, node: *ASTTypeRef)
{
	if node == null {
		return
	}
	
	if !v.preprocess_typeref(node) {
		return
	}
	
	var i: int
	
	
	v.postprocess_typeref(node)
}
func (v: *NullVisitor) preprocess_typeref(node: *ASTTypeRef) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_typeref(node: *ASTTypeRef)
{
	unused(node)
}
func visit_typeswitch(v: *Visitor, node: *ASTTypeSwitch)
{
	if node == null {
		return
	}
	
	if !v.preprocess_typeswitch(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._discriminant)
	i = 0
	while i < len(node._cases) {
		visit_typeswitchcase(v, node._cases[i])
		i++
	}
	visit_defaultcase(v, node._default)
	
	v.postprocess_typeswitch(node)
}
func (v: *NullVisitor) preprocess_typeswitch(node: *ASTTypeSwitch) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_typeswitch(node: *ASTTypeSwitch)
{
	unused(node)
}
func visit_typeswitchcase(v: *Visitor, node: *ASTTypeSwitchCase)
{
	if node == null {
		return
	}
	
	if !v.preprocess_typeswitchcase(node) {
		return
	}
	
	var i: int
	
	i = 0
	while i < len(node._types) {
		visit_type(v, node._types[i])
		i++
	}
	visit_block(v, node._body)
	
	v.postprocess_typeswitchcase(node)
}
func (v: *NullVisitor) preprocess_typeswitchcase(node: *ASTTypeSwitchCase) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_typeswitchcase(node: *ASTTypeSwitchCase)
{
	unused(node)
}
func visit_typedef(v: *Visitor, node: *ASTTypedef)
{
	if node == null {
		return
	}
	
	if !v.preprocess_typedef(node) {
		return
	}
	
	var i: int
	
	visit_namedtype(v, node._type)
	
	v.postprocess_typedef(node)
}
func (v: *NullVisitor) preprocess_typedef(node: *ASTTypedef) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_typedef(node: *ASTTypedef)
{
	unused(node)
}
func visit_unaryminus(v: *Visitor, node: *ASTUnaryMinus)
{
	if node == null {
		return
	}
	
	if !v.preprocess_unaryminus(node) {
		return
	}
	
	var i: int
	
	visit_level1expression(v, node._arg)
	
	v.postprocess_unaryminus(node)
}
func (v: *NullVisitor) preprocess_unaryminus(node: *ASTUnaryMinus) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_unaryminus(node: *ASTUnaryMinus)
{
	unused(node)
}
func visit_unaryplus(v: *Visitor, node: *ASTUnaryPlus)
{
	if node == null {
		return
	}
	
	if !v.preprocess_unaryplus(node) {
		return
	}
	
	var i: int
	
	visit_level1expression(v, node._arg)
	
	v.postprocess_unaryplus(node)
}
func (v: *NullVisitor) preprocess_unaryplus(node: *ASTUnaryPlus) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_unaryplus(node: *ASTUnaryPlus)
{
	unused(node)
}
func visit_vardecl(v: *Visitor, node: *ASTVardecl)
{
	if node == null {
		return
	}
	
	if !v.preprocess_vardecl(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._initializer)
	
	v.postprocess_vardecl(node)
}
func (v: *NullVisitor) preprocess_vardecl(node: *ASTVardecl) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_vardecl(node: *ASTVardecl)
{
	unused(node)
}
func visit_vardecltyped(v: *Visitor, node: *ASTVardeclTyped)
{
	if node == null {
		return
	}
	
	if !v.preprocess_vardecltyped(node) {
		return
	}
	
	var i: int
	
	visit_type(v, node._type)
	
	v.postprocess_vardecltyped(node)
}
func (v: *NullVisitor) preprocess_vardecltyped(node: *ASTVardeclTyped) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_vardecltyped(node: *ASTVardeclTyped)
{
	unused(node)
}
func visit_while(v: *Visitor, node: *ASTWhile)
{
	if node == null {
		return
	}
	
	if !v.preprocess_while(node) {
		return
	}
	
	var i: int
	
	visit_expression(v, node._condition)
	i = 0
	while i < len(node._contracts) {
		visit_whilecontract(v, node._contracts[i])
		i++
	}
	visit_block(v, node._body)
	
	v.postprocess_while(node)
}
func (v: *NullVisitor) preprocess_while(node: *ASTWhile) (enter: bool)
{
	unused(node)
	return true
}
func (v: *NullVisitor) postprocess_while(node: *ASTWhile)
{
	unused(node)
}
func visit_whilecontract(v: *Visitor, node: *ASTWhileContract)
{
	if node == null {
		return
	}
	
	type switch node
	case *ASTInvariant {
		visit_invariant(v, node)
	}
	case *ASTInvariantAll {
		visit_invariantall(v, node)
	}
	case *ASTLoopBound {
		visit_loopbound(v, node)
	}
	default {
		fail BUG, "Missing switch case."
	};;
}
