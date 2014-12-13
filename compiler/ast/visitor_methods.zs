func (b: *ASTVisitorBase) previsit_while_contract(ast: *ASTWhileContract)
{
}

func (b: *ASTVisitorBase) postvisit_while_contract(ast: *ASTWhileContract)
{
}

func (b: *ASTVisitorBase) visit_while_contract(ast: *ASTWhileContract)
{
	b.self.previsit_while_contract(ast)
	type switch ast
	case *ASTInvariant {
		b.self.visit_invariant(ast)
	}
	case *ASTInvariantAll {
		b.self.visit_invariant_all(ast)
	}
	case *ASTLoopBound {
		b.self.visit_loop_bound(ast)
	};;
	b.self.postvisit_while_contract(ast)
}

func (b: *ASTVisitorBase) previsit_less_eq(ast: *ASTLessEq)
{
}

func (b: *ASTVisitorBase) postvisit_less_eq(ast: *ASTLessEq)
{
}

func (b: *ASTVisitorBase) visit_less_eq(ast: *ASTLessEq)
{
	b.self.previsit_less_eq(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level3_expression(ast.__right)
	b.self.postvisit_less_eq(ast)
}

func (b: *ASTVisitorBase) previsit_new_array(ast: *ASTNewArray)
{
}

func (b: *ASTVisitorBase) postvisit_new_array(ast: *ASTNewArray)
{
}

func (b: *ASTVisitorBase) visit_new_array(ast: *ASTNewArray)
{
	b.self.previsit_new_array(ast)
	b.self.visit_expression(ast.__length)
	b.self.visit_type(ast.__type)
	b.self.postvisit_new_array(ast)
}

func (b: *ASTVisitorBase) previsit_vardecl_typed(ast: *ASTVardeclTyped)
{
}

func (b: *ASTVisitorBase) postvisit_vardecl_typed(ast: *ASTVardeclTyped)
{
}

func (b: *ASTVisitorBase) visit_vardecl_typed(ast: *ASTVardeclTyped)
{
	b.self.previsit_vardecl_typed(ast)
	b.self.visit_type(ast.__type)
	b.self.postvisit_vardecl_typed(ast)
}

func (b: *ASTVisitorBase) previsit_fail_recover(ast: *ASTFailRecover)
{
}

func (b: *ASTVisitorBase) postvisit_fail_recover(ast: *ASTFailRecover)
{
}

func (b: *ASTVisitorBase) visit_fail_recover(ast: *ASTFailRecover)
{
	b.self.previsit_fail_recover(ast)
	b.self.visit_recoverable(ast.__stmt)
	b.self.visit_block(ast.__recover_block)
	b.self.postvisit_fail_recover(ast)
}

func (b: *ASTVisitorBase) previsit_invariant(ast: *ASTInvariant)
{
}

func (b: *ASTVisitorBase) postvisit_invariant(ast: *ASTInvariant)
{
}

func (b: *ASTVisitorBase) visit_invariant(ast: *ASTInvariant)
{
	b.self.previsit_invariant(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_invariant(ast)
}

func (b: *ASTVisitorBase) previsit_greater_eq(ast: *ASTGreaterEq)
{
}

func (b: *ASTVisitorBase) postvisit_greater_eq(ast: *ASTGreaterEq)
{
}

func (b: *ASTVisitorBase) visit_greater_eq(ast: *ASTGreaterEq)
{
	b.self.previsit_greater_eq(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level3_expression(ast.__right)
	b.self.postvisit_greater_eq(ast)
}

func (b: *ASTVisitorBase) previsit_bit_and(ast: *ASTBitAnd)
{
}

func (b: *ASTVisitorBase) postvisit_bit_and(ast: *ASTBitAnd)
{
}

func (b: *ASTVisitorBase) visit_bit_and(ast: *ASTBitAnd)
{
	b.self.previsit_bit_and(ast)
	b.self.visit_level2_expression(ast.__left)
	b.self.visit_level1_expression(ast.__right)
	b.self.postvisit_bit_and(ast)
}

func (b: *ASTVisitorBase) previsit_char(ast: *ASTChar)
{
}

func (b: *ASTVisitorBase) postvisit_char(ast: *ASTChar)
{
}

func (b: *ASTVisitorBase) visit_char(ast: *ASTChar)
{
	b.self.previsit_char(ast)
	b.self.postvisit_char(ast)
}

func (b: *ASTVisitorBase) previsit_block(ast: *ASTBlock)
{
}

func (b: *ASTVisitorBase) postvisit_block(ast: *ASTBlock)
{
}

func (b: *ASTVisitorBase) visit_block(ast: *ASTBlock)
{
	b.self.previsit_block(ast)
	var i = 0
	while i < len(ast.__statements) {
		b.self.visit_statement(ast.__statements[i])
		i++
	}
	b.self.postvisit_block(ast)
}

func (b: *ASTVisitorBase) previsit_vardecl(ast: *ASTVardecl)
{
}

func (b: *ASTVisitorBase) postvisit_vardecl(ast: *ASTVardecl)
{
}

func (b: *ASTVisitorBase) visit_vardecl(ast: *ASTVardecl)
{
	b.self.previsit_vardecl(ast)
	if ast.__initializer != null {
		b.self.visit_expression(ast.__initializer)
	}
	b.self.postvisit_vardecl(ast)
}

func (b: *ASTVisitorBase) previsit_or(ast: *ASTOr)
{
}

func (b: *ASTVisitorBase) postvisit_or(ast: *ASTOr)
{
}

func (b: *ASTVisitorBase) visit_or(ast: *ASTOr)
{
	b.self.previsit_or(ast)
	b.self.visit_level6_expression(ast.__left)
	b.self.visit_level5_expression(ast.__right)
	b.self.postvisit_or(ast)
}

func (b: *ASTVisitorBase) previsit_ensures_all(ast: *ASTEnsuresAll)
{
}

func (b: *ASTVisitorBase) postvisit_ensures_all(ast: *ASTEnsuresAll)
{
}

func (b: *ASTVisitorBase) visit_ensures_all(ast: *ASTEnsuresAll)
{
	b.self.previsit_ensures_all(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_ensures_all(ast)
}

func (b: *ASTVisitorBase) previsit_assume(ast: *ASTAssume)
{
}

func (b: *ASTVisitorBase) postvisit_assume(ast: *ASTAssume)
{
}

func (b: *ASTVisitorBase) visit_assume(ast: *ASTAssume)
{
	b.self.previsit_assume(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_assume(ast)
}

func (b: *ASTVisitorBase) previsit_loop_bound(ast: *ASTLoopBound)
{
}

func (b: *ASTVisitorBase) postvisit_loop_bound(ast: *ASTLoopBound)
{
}

func (b: *ASTVisitorBase) visit_loop_bound(ast: *ASTLoopBound)
{
	b.self.previsit_loop_bound(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_loop_bound(ast)
}

func (b: *ASTVisitorBase) previsit_level6_expression(ast: *ASTLevel6Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level6_expression(ast: *ASTLevel6Expression)
{
}

func (b: *ASTVisitorBase) visit_level6_expression(ast: *ASTLevel6Expression)
{
	b.self.previsit_level6_expression(ast)
	type switch ast
	case *ASTOr {
		b.self.visit_or(ast)
	}
	case *ASTAnd {
		b.self.visit_and(ast)
	}
	case *ASTLess {
		b.self.visit_less(ast)
	}
	case *ASTLessEq {
		b.self.visit_less_eq(ast)
	}
	case *ASTGreater {
		b.self.visit_greater(ast)
	}
	case *ASTGreaterEq {
		b.self.visit_greater_eq(ast)
	}
	case *ASTEqual {
		b.self.visit_equal(ast)
	}
	case *ASTInequal {
		b.self.visit_inequal(ast)
	}
	case *ASTIs {
		b.self.visit_is(ast)
	}
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level6_expression(ast)
}

func (b: *ASTVisitorBase) previsit_new(ast: *ASTNew)
{
}

func (b: *ASTVisitorBase) postvisit_new(ast: *ASTNew)
{
}

func (b: *ASTVisitorBase) visit_new(ast: *ASTNew)
{
	b.self.previsit_new(ast)
	b.self.visit_type(ast.__type)
	b.self.postvisit_new(ast)
}

func (b: *ASTVisitorBase) previsit_selection_type(ast: *ASTSelectionType)
{
}

func (b: *ASTVisitorBase) postvisit_selection_type(ast: *ASTSelectionType)
{
}

func (b: *ASTVisitorBase) visit_selection_type(ast: *ASTSelectionType)
{
	b.self.previsit_selection_type(ast)
	var i = 0
	while i < len(ast.__types) {
		b.self.visit_type(ast.__types[i])
		i++
	}
	b.self.postvisit_selection_type(ast)
}

func (b: *ASTVisitorBase) previsit_requires_all(ast: *ASTRequiresAll)
{
}

func (b: *ASTVisitorBase) postvisit_requires_all(ast: *ASTRequiresAll)
{
}

func (b: *ASTVisitorBase) visit_requires_all(ast: *ASTRequiresAll)
{
	b.self.previsit_requires_all(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_requires_all(ast)
}

func (b: *ASTVisitorBase) previsit_ensures(ast: *ASTEnsures)
{
}

func (b: *ASTVisitorBase) postvisit_ensures(ast: *ASTEnsures)
{
}

func (b: *ASTVisitorBase) visit_ensures(ast: *ASTEnsures)
{
	b.self.previsit_ensures(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_ensures(ast)
}

func (b: *ASTVisitorBase) previsit_break(ast: *ASTBreak)
{
}

func (b: *ASTVisitorBase) postvisit_break(ast: *ASTBreak)
{
}

func (b: *ASTVisitorBase) visit_break(ast: *ASTBreak)
{
	b.self.previsit_break(ast)
	b.self.postvisit_break(ast)
}

func (b: *ASTVisitorBase) previsit_delete(ast: *ASTDelete)
{
}

func (b: *ASTVisitorBase) postvisit_delete(ast: *ASTDelete)
{
}

func (b: *ASTVisitorBase) visit_delete(ast: *ASTDelete)
{
	b.self.previsit_delete(ast)
	b.self.visit_expression(ast.__arg)
	b.self.postvisit_delete(ast)
}

func (b: *ASTVisitorBase) previsit_literal(ast: *ASTLiteral)
{
}

func (b: *ASTVisitorBase) postvisit_literal(ast: *ASTLiteral)
{
}

func (b: *ASTVisitorBase) visit_literal(ast: *ASTLiteral)
{
	b.self.previsit_literal(ast)
	type switch ast
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_literal(ast)
}

func (b: *ASTVisitorBase) previsit_decimal(ast: *ASTDecimal)
{
}

func (b: *ASTVisitorBase) postvisit_decimal(ast: *ASTDecimal)
{
}

func (b: *ASTVisitorBase) visit_decimal(ast: *ASTDecimal)
{
	b.self.previsit_decimal(ast)
	b.self.postvisit_decimal(ast)
}

func (b: *ASTVisitorBase) previsit_take(ast: *ASTTake)
{
}

func (b: *ASTVisitorBase) postvisit_take(ast: *ASTTake)
{
}

func (b: *ASTVisitorBase) visit_take(ast: *ASTTake)
{
	b.self.previsit_take(ast)
	b.self.visit_level1_expression(ast.__arg)
	b.self.postvisit_take(ast)
}

func (b: *ASTVisitorBase) previsit_type_switch_case(ast: *ASTTypeSwitchCase)
{
}

func (b: *ASTVisitorBase) postvisit_type_switch_case(ast: *ASTTypeSwitchCase)
{
}

func (b: *ASTVisitorBase) visit_type_switch_case(ast: *ASTTypeSwitchCase)
{
	b.self.previsit_type_switch_case(ast)
	var i = 0
	while i < len(ast.__types) {
		b.self.visit_type(ast.__types[i])
		i++
	}
	b.self.visit_block(ast.__body)
	b.self.postvisit_type_switch_case(ast)
}

func (b: *ASTVisitorBase) previsit_level0_expression(ast: *ASTLevel0Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level0_expression(ast: *ASTLevel0Expression)
{
}

func (b: *ASTVisitorBase) visit_level0_expression(ast: *ASTLevel0Expression)
{
	b.self.previsit_level0_expression(ast)
	type switch ast
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level0_expression(ast)
}

func (b: *ASTVisitorBase) previsit_is(ast: *ASTIs)
{
}

func (b: *ASTVisitorBase) postvisit_is(ast: *ASTIs)
{
}

func (b: *ASTVisitorBase) visit_is(ast: *ASTIs)
{
	b.self.previsit_is(ast)
	b.self.visit_level3_expression(ast.__arg)
	b.self.visit_type(ast.__type)
	b.self.postvisit_is(ast)
}

func (b: *ASTVisitorBase) previsit_mod(ast: *ASTMod)
{
}

func (b: *ASTVisitorBase) postvisit_mod(ast: *ASTMod)
{
}

func (b: *ASTVisitorBase) visit_mod(ast: *ASTMod)
{
	b.self.previsit_mod(ast)
	b.self.visit_level2_expression(ast.__left)
	b.self.visit_level1_expression(ast.__right)
	b.self.postvisit_mod(ast)
}

func (b: *ASTVisitorBase) previsit_type(ast: *ASTType)
{
}

func (b: *ASTVisitorBase) postvisit_type(ast: *ASTType)
{
}

func (b: *ASTVisitorBase) visit_type(ast: *ASTType)
{
	b.self.previsit_type(ast)
	type switch ast
	case *ASTTypeRef {
		b.self.visit_type_ref(ast)
	}
	case *ASTRangeType {
		b.self.visit_range_type(ast)
	}
	case *ASTArrayType {
		b.self.visit_array_type(ast)
	}
	case *ASTPointerType {
		b.self.visit_pointer_type(ast)
	};;
	b.self.postvisit_type(ast)
}

func (b: *ASTVisitorBase) previsit_range_type(ast: *ASTRangeType)
{
}

func (b: *ASTVisitorBase) postvisit_range_type(ast: *ASTRangeType)
{
}

func (b: *ASTVisitorBase) visit_range_type(ast: *ASTRangeType)
{
	b.self.previsit_range_type(ast)
	b.self.visit_expression(ast.__low)
	b.self.visit_expression(ast.__high)
	b.self.postvisit_range_type(ast)
}

func (b: *ASTVisitorBase) previsit_increment(ast: *ASTIncrement)
{
}

func (b: *ASTVisitorBase) postvisit_increment(ast: *ASTIncrement)
{
}

func (b: *ASTVisitorBase) visit_increment(ast: *ASTIncrement)
{
	b.self.previsit_increment(ast)
	b.self.visit_expression(ast.__lvalue)
	b.self.postvisit_increment(ast)
}

func (b: *ASTVisitorBase) previsit_level3_expression(ast: *ASTLevel3Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level3_expression(ast: *ASTLevel3Expression)
{
}

func (b: *ASTVisitorBase) visit_level3_expression(ast: *ASTLevel3Expression)
{
	b.self.previsit_level3_expression(ast)
	type switch ast
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level3_expression(ast)
}

func (b: *ASTVisitorBase) previsit_named_type(ast: *ASTNamedType)
{
}

func (b: *ASTVisitorBase) postvisit_named_type(ast: *ASTNamedType)
{
}

func (b: *ASTVisitorBase) visit_named_type(ast: *ASTNamedType)
{
	b.self.previsit_named_type(ast)
	type switch ast
	case *ASTStructType {
		b.self.visit_struct_type(ast)
	}
	case *ASTInterfaceType {
		b.self.visit_interface_type(ast)
	}
	case *ASTSelectionType {
		b.self.visit_selection_type(ast)
	};;
	b.self.postvisit_named_type(ast)
}

func (b: *ASTVisitorBase) previsit_bit_or(ast: *ASTBitOr)
{
}

func (b: *ASTVisitorBase) postvisit_bit_or(ast: *ASTBitOr)
{
}

func (b: *ASTVisitorBase) visit_bit_or(ast: *ASTBitOr)
{
	b.self.previsit_bit_or(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level2_expression(ast.__right)
	b.self.postvisit_bit_or(ast)
}

func (b: *ASTVisitorBase) previsit_sanity_check(ast: *ASTSanityCheck)
{
}

func (b: *ASTVisitorBase) postvisit_sanity_check(ast: *ASTSanityCheck)
{
}

func (b: *ASTVisitorBase) visit_sanity_check(ast: *ASTSanityCheck)
{
	b.self.previsit_sanity_check(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_sanity_check(ast)
}

func (b: *ASTVisitorBase) previsit_level5_expression(ast: *ASTLevel5Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level5_expression(ast: *ASTLevel5Expression)
{
}

func (b: *ASTVisitorBase) visit_level5_expression(ast: *ASTLevel5Expression)
{
	b.self.previsit_level5_expression(ast)
	type switch ast
	case *ASTAnd {
		b.self.visit_and(ast)
	}
	case *ASTLess {
		b.self.visit_less(ast)
	}
	case *ASTLessEq {
		b.self.visit_less_eq(ast)
	}
	case *ASTGreater {
		b.self.visit_greater(ast)
	}
	case *ASTGreaterEq {
		b.self.visit_greater_eq(ast)
	}
	case *ASTEqual {
		b.self.visit_equal(ast)
	}
	case *ASTInequal {
		b.self.visit_inequal(ast)
	}
	case *ASTIs {
		b.self.visit_is(ast)
	}
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level5_expression(ast)
}

func (b: *ASTVisitorBase) previsit_unary_plus(ast: *ASTUnaryPlus)
{
}

func (b: *ASTVisitorBase) postvisit_unary_plus(ast: *ASTUnaryPlus)
{
}

func (b: *ASTVisitorBase) visit_unary_plus(ast: *ASTUnaryPlus)
{
	b.self.previsit_unary_plus(ast)
	b.self.visit_level1_expression(ast.__arg)
	b.self.postvisit_unary_plus(ast)
}

func (b: *ASTVisitorBase) previsit_switch(ast: *ASTSwitch)
{
}

func (b: *ASTVisitorBase) postvisit_switch(ast: *ASTSwitch)
{
}

func (b: *ASTVisitorBase) visit_switch(ast: *ASTSwitch)
{
	b.self.previsit_switch(ast)
	if ast.__discriminant != null {
		b.self.visit_expression(ast.__discriminant)
	}
	var i = 0
	while i < len(ast.__cases) {
		b.self.visit_switch_case(ast.__cases[i])
		i++
	}
	if ast.__default != null {
		b.self.visit_default_case(ast.__default)
	}
	b.self.postvisit_switch(ast)
}

func (b: *ASTVisitorBase) previsit_equal(ast: *ASTEqual)
{
}

func (b: *ASTVisitorBase) postvisit_equal(ast: *ASTEqual)
{
}

func (b: *ASTVisitorBase) visit_equal(ast: *ASTEqual)
{
	b.self.previsit_equal(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level3_expression(ast.__right)
	b.self.postvisit_equal(ast)
}

func (b: *ASTVisitorBase) previsit_method_signature(ast: *ASTMethodSignature)
{
}

func (b: *ASTVisitorBase) postvisit_method_signature(ast: *ASTMethodSignature)
{
}

func (b: *ASTVisitorBase) visit_method_signature(ast: *ASTMethodSignature)
{
	b.self.previsit_method_signature(ast)
	var i = 0
	while i < len(ast.__in_params) {
		b.self.visit_parameter(ast.__in_params[i])
		i++
	}
	i = 0
	while i < len(ast.__out_params) {
		b.self.visit_parameter(ast.__out_params[i])
		i++
	}
	b.self.postvisit_method_signature(ast)
}

func (b: *ASTVisitorBase) previsit_assert_all(ast: *ASTAssertAll)
{
}

func (b: *ASTVisitorBase) postvisit_assert_all(ast: *ASTAssertAll)
{
}

func (b: *ASTVisitorBase) visit_assert_all(ast: *ASTAssertAll)
{
	b.self.previsit_assert_all(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_assert_all(ast)
}

func (b: *ASTVisitorBase) previsit_and(ast: *ASTAnd)
{
}

func (b: *ASTVisitorBase) postvisit_and(ast: *ASTAnd)
{
}

func (b: *ASTVisitorBase) visit_and(ast: *ASTAnd)
{
	b.self.previsit_and(ast)
	b.self.visit_level5_expression(ast.__left)
	b.self.visit_level4_expression(ast.__right)
	b.self.postvisit_and(ast)
}

func (b: *ASTVisitorBase) previsit_binary_plus(ast: *ASTBinaryPlus)
{
}

func (b: *ASTVisitorBase) postvisit_binary_plus(ast: *ASTBinaryPlus)
{
}

func (b: *ASTVisitorBase) visit_binary_plus(ast: *ASTBinaryPlus)
{
	b.self.previsit_binary_plus(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level2_expression(ast.__right)
	b.self.postvisit_binary_plus(ast)
}

func (b: *ASTVisitorBase) previsit_unary_minus(ast: *ASTUnaryMinus)
{
}

func (b: *ASTVisitorBase) postvisit_unary_minus(ast: *ASTUnaryMinus)
{
}

func (b: *ASTVisitorBase) visit_unary_minus(ast: *ASTUnaryMinus)
{
	b.self.previsit_unary_minus(ast)
	b.self.visit_level1_expression(ast.__arg)
	b.self.postvisit_unary_minus(ast)
}

func (b: *ASTVisitorBase) previsit_pointer_type(ast: *ASTPointerType)
{
}

func (b: *ASTVisitorBase) postvisit_pointer_type(ast: *ASTPointerType)
{
}

func (b: *ASTVisitorBase) visit_pointer_type(ast: *ASTPointerType)
{
	b.self.previsit_pointer_type(ast)
	b.self.visit_type(ast.__inner_type)
	b.self.postvisit_pointer_type(ast)
}

func (b: *ASTVisitorBase) previsit_method_call(ast: *ASTMethodCall)
{
}

func (b: *ASTVisitorBase) postvisit_method_call(ast: *ASTMethodCall)
{
}

func (b: *ASTVisitorBase) visit_method_call(ast: *ASTMethodCall)
{
	b.self.previsit_method_call(ast)
	if ast.__receiver != null {
		b.self.visit_level0_expression(ast.__receiver)
	}
	var i = 0
	while i < len(ast.__args) {
		b.self.visit_expression(ast.__args[i])
		i++
	}
	b.self.postvisit_method_call(ast)
}

func (b: *ASTVisitorBase) previsit_selector(ast: *ASTSelector)
{
}

func (b: *ASTVisitorBase) postvisit_selector(ast: *ASTSelector)
{
}

func (b: *ASTVisitorBase) visit_selector(ast: *ASTSelector)
{
	b.self.previsit_selector(ast)
	b.self.visit_level0_expression(ast.__base)
	b.self.postvisit_selector(ast)
}

func (b: *ASTVisitorBase) previsit_not(ast: *ASTNot)
{
}

func (b: *ASTVisitorBase) postvisit_not(ast: *ASTNot)
{
}

func (b: *ASTVisitorBase) visit_not(ast: *ASTNot)
{
	b.self.previsit_not(ast)
	b.self.visit_level1_expression(ast.__arg)
	b.self.postvisit_not(ast)
}

func (b: *ASTVisitorBase) previsit_expression(ast: *ASTExpression)
{
}

func (b: *ASTVisitorBase) postvisit_expression(ast: *ASTExpression)
{
}

func (b: *ASTVisitorBase) visit_expression(ast: *ASTExpression)
{
	b.self.previsit_expression(ast)
	type switch ast
	case *ASTOr {
		b.self.visit_or(ast)
	}
	case *ASTAnd {
		b.self.visit_and(ast)
	}
	case *ASTLess {
		b.self.visit_less(ast)
	}
	case *ASTLessEq {
		b.self.visit_less_eq(ast)
	}
	case *ASTGreater {
		b.self.visit_greater(ast)
	}
	case *ASTGreaterEq {
		b.self.visit_greater_eq(ast)
	}
	case *ASTEqual {
		b.self.visit_equal(ast)
	}
	case *ASTInequal {
		b.self.visit_inequal(ast)
	}
	case *ASTIs {
		b.self.visit_is(ast)
	}
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_expression(ast)
}

func (b: *ASTVisitorBase) previsit_octal(ast: *ASTOctal)
{
}

func (b: *ASTVisitorBase) postvisit_octal(ast: *ASTOctal)
{
}

func (b: *ASTVisitorBase) visit_octal(ast: *ASTOctal)
{
	b.self.previsit_octal(ast)
	b.self.postvisit_octal(ast)
}

func (b: *ASTVisitorBase) previsit_type_ref(ast: *ASTTypeRef)
{
}

func (b: *ASTVisitorBase) postvisit_type_ref(ast: *ASTTypeRef)
{
}

func (b: *ASTVisitorBase) visit_type_ref(ast: *ASTTypeRef)
{
	b.self.previsit_type_ref(ast)
	b.self.postvisit_type_ref(ast)
}

func (b: *ASTVisitorBase) previsit_struct_type(ast: *ASTStructType)
{
}

func (b: *ASTVisitorBase) postvisit_struct_type(ast: *ASTStructType)
{
}

func (b: *ASTVisitorBase) visit_struct_type(ast: *ASTStructType)
{
	b.self.previsit_struct_type(ast)
	var i = 0
	while i < len(ast.__members) {
		b.self.visit_struct_member(ast.__members[i])
		i++
	}
	b.self.postvisit_struct_type(ast)
}

func (b: *ASTVisitorBase) previsit_method(ast: *ASTMethod)
{
}

func (b: *ASTVisitorBase) postvisit_method(ast: *ASTMethod)
{
}

func (b: *ASTVisitorBase) visit_method(ast: *ASTMethod)
{
	b.self.previsit_method(ast)
	if ast.__receiver != null {
		b.self.visit_parameter(ast.__receiver)
	}
	b.self.visit_method_signature(ast.__signature)
	var i = 0
	while i < len(ast.__contracts) {
		b.self.visit_method_contract(ast.__contracts[i])
		i++
	}
	b.self.visit_block(ast.__body)
	b.self.postvisit_method(ast)
}

func (b: *ASTVisitorBase) previsit_statement(ast: *ASTStatement)
{
}

func (b: *ASTVisitorBase) postvisit_statement(ast: *ASTStatement)
{
}

func (b: *ASTVisitorBase) visit_statement(ast: *ASTStatement)
{
	b.self.previsit_statement(ast)
	type switch ast
	case *ASTVardecl {
		b.self.visit_vardecl(ast)
	}
	case *ASTVardeclTyped {
		b.self.visit_vardecl_typed(ast)
	}
	case *ASTWhile {
		b.self.visit_while(ast)
	}
	case *ASTReturn {
		b.self.visit_return(ast)
	}
	case *ASTBreak {
		b.self.visit_break(ast)
	}
	case *ASTContinue {
		b.self.visit_continue(ast)
	}
	case *ASTBlock {
		b.self.visit_block(ast)
	}
	case *ASTIf {
		b.self.visit_if(ast)
	}
	case *ASTAssignment {
		b.self.visit_assignment(ast)
	}
	case *ASTIncrement {
		b.self.visit_increment(ast)
	}
	case *ASTDecrement {
		b.self.visit_decrement(ast)
	}
	case *ASTDelete {
		b.self.visit_delete(ast)
	}
	case *ASTSwitch {
		b.self.visit_switch(ast)
	}
	case *ASTTypeSwitch {
		b.self.visit_type_switch(ast)
	}
	case *ASTAssert {
		b.self.visit_assert(ast)
	}
	case *ASTAssertAll {
		b.self.visit_assert_all(ast)
	}
	case *ASTAssume {
		b.self.visit_assume(ast)
	}
	case *ASTFail {
		b.self.visit_fail(ast)
	}
	case *ASTSanityCheck {
		b.self.visit_sanity_check(ast)
	}
	case *ASTFailRecover {
		b.self.visit_fail_recover(ast)
	}
	case *ASTOr {
		b.self.visit_or(ast)
	}
	case *ASTAnd {
		b.self.visit_and(ast)
	}
	case *ASTLess {
		b.self.visit_less(ast)
	}
	case *ASTLessEq {
		b.self.visit_less_eq(ast)
	}
	case *ASTGreater {
		b.self.visit_greater(ast)
	}
	case *ASTGreaterEq {
		b.self.visit_greater_eq(ast)
	}
	case *ASTEqual {
		b.self.visit_equal(ast)
	}
	case *ASTInequal {
		b.self.visit_inequal(ast)
	}
	case *ASTIs {
		b.self.visit_is(ast)
	}
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_statement(ast)
}

func (b: *ASTVisitorBase) previsit_assignment(ast: *ASTAssignment)
{
}

func (b: *ASTVisitorBase) postvisit_assignment(ast: *ASTAssignment)
{
}

func (b: *ASTVisitorBase) visit_assignment(ast: *ASTAssignment)
{
	b.self.previsit_assignment(ast)
	var i = 0
	while i < len(ast.__rvalues) {
		b.self.visit_expression(ast.__rvalues[i])
		i++
	}
	i = 0
	while i < len(ast.__lvalues) {
		b.self.visit_expression(ast.__lvalues[i])
		i++
	}
	b.self.postvisit_assignment(ast)
}

func (b: *ASTVisitorBase) previsit_string(ast: *ASTString)
{
}

func (b: *ASTVisitorBase) postvisit_string(ast: *ASTString)
{
}

func (b: *ASTVisitorBase) visit_string(ast: *ASTString)
{
	b.self.previsit_string(ast)
	b.self.postvisit_string(ast)
}

func (b: *ASTVisitorBase) previsit_inequal(ast: *ASTInequal)
{
}

func (b: *ASTVisitorBase) postvisit_inequal(ast: *ASTInequal)
{
}

func (b: *ASTVisitorBase) visit_inequal(ast: *ASTInequal)
{
	b.self.previsit_inequal(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level3_expression(ast.__right)
	b.self.postvisit_inequal(ast)
}

func (b: *ASTVisitorBase) previsit_level2_expression(ast: *ASTLevel2Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level2_expression(ast: *ASTLevel2Expression)
{
}

func (b: *ASTVisitorBase) visit_level2_expression(ast: *ASTLevel2Expression)
{
	b.self.previsit_level2_expression(ast)
	type switch ast
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level2_expression(ast)
}

func (b: *ASTVisitorBase) previsit_rshift(ast: *ASTRShift)
{
}

func (b: *ASTVisitorBase) postvisit_rshift(ast: *ASTRShift)
{
}

func (b: *ASTVisitorBase) visit_rshift(ast: *ASTRShift)
{
	b.self.previsit_rshift(ast)
	b.self.visit_level2_expression(ast.__left)
	b.self.visit_level1_expression(ast.__right)
	b.self.postvisit_rshift(ast)
}

func (b: *ASTVisitorBase) previsit_pexpression(ast: *ASTPExpression)
{
}

func (b: *ASTVisitorBase) postvisit_pexpression(ast: *ASTPExpression)
{
}

func (b: *ASTVisitorBase) visit_pexpression(ast: *ASTPExpression)
{
	b.self.previsit_pexpression(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_pexpression(ast)
}

func (b: *ASTVisitorBase) previsit_return(ast: *ASTReturn)
{
}

func (b: *ASTVisitorBase) postvisit_return(ast: *ASTReturn)
{
}

func (b: *ASTVisitorBase) visit_return(ast: *ASTReturn)
{
	b.self.previsit_return(ast)
	var i = 0
	while i < len(ast.__retvals) {
		b.self.visit_expression(ast.__retvals[i])
		i++
	}
	b.self.postvisit_return(ast)
}

func (b: *ASTVisitorBase) previsit_interface_type(ast: *ASTInterfaceType)
{
}

func (b: *ASTVisitorBase) postvisit_interface_type(ast: *ASTInterfaceType)
{
}

func (b: *ASTVisitorBase) visit_interface_type(ast: *ASTInterfaceType)
{
	b.self.previsit_interface_type(ast)
	var i = 0
	while i < len(ast.__members) {
		b.self.visit_interface_member(ast.__members[i])
		i++
	}
	b.self.postvisit_interface_type(ast)
}

func (b: *ASTVisitorBase) previsit_if(ast: *ASTIf)
{
}

func (b: *ASTVisitorBase) postvisit_if(ast: *ASTIf)
{
}

func (b: *ASTVisitorBase) visit_if(ast: *ASTIf)
{
	b.self.previsit_if(ast)
	b.self.visit_expression(ast.__condition)
	b.self.visit_block(ast.__true_branch)
	if ast.__false_branch != null {
		b.self.visit_else_branch(ast.__false_branch)
	}
	b.self.postvisit_if(ast)
}

func (b: *ASTVisitorBase) previsit_global(ast: *ASTGlobal)
{
}

func (b: *ASTVisitorBase) postvisit_global(ast: *ASTGlobal)
{
}

func (b: *ASTVisitorBase) visit_global(ast: *ASTGlobal)
{
	b.self.previsit_global(ast)
	type switch ast
	case *ASTMethod {
		b.self.visit_method(ast)
	}
	case *ASTTypedef {
		b.self.visit_typedef(ast)
	};;
	b.self.postvisit_global(ast)
}

func (b: *ASTVisitorBase) previsit_fail(ast: *ASTFail)
{
}

func (b: *ASTVisitorBase) postvisit_fail(ast: *ASTFail)
{
}

func (b: *ASTVisitorBase) visit_fail(ast: *ASTFail)
{
	b.self.previsit_fail(ast)
	b.self.postvisit_fail(ast)
}

func (b: *ASTVisitorBase) previsit_type_switch(ast: *ASTTypeSwitch)
{
}

func (b: *ASTVisitorBase) postvisit_type_switch(ast: *ASTTypeSwitch)
{
}

func (b: *ASTVisitorBase) visit_type_switch(ast: *ASTTypeSwitch)
{
	b.self.previsit_type_switch(ast)
	b.self.visit_expression(ast.__discriminant)
	var i = 0
	while i < len(ast.__cases) {
		b.self.visit_type_switch_case(ast.__cases[i])
		i++
	}
	if ast.__default != null {
		b.self.visit_default_case(ast.__default)
	}
	b.self.postvisit_type_switch(ast)
}

func (b: *ASTVisitorBase) previsit_default_case(ast: *ASTDefaultCase)
{
}

func (b: *ASTVisitorBase) postvisit_default_case(ast: *ASTDefaultCase)
{
}

func (b: *ASTVisitorBase) visit_default_case(ast: *ASTDefaultCase)
{
	b.self.previsit_default_case(ast)
	b.self.visit_block(ast.__body)
	b.self.postvisit_default_case(ast)
}

func (b: *ASTVisitorBase) previsit_may_fail(ast: *ASTMayFail)
{
}

func (b: *ASTVisitorBase) postvisit_may_fail(ast: *ASTMayFail)
{
}

func (b: *ASTVisitorBase) visit_may_fail(ast: *ASTMayFail)
{
	b.self.previsit_may_fail(ast)
	b.self.postvisit_may_fail(ast)
}

func (b: *ASTVisitorBase) previsit_assert(ast: *ASTAssert)
{
}

func (b: *ASTVisitorBase) postvisit_assert(ast: *ASTAssert)
{
}

func (b: *ASTVisitorBase) visit_assert(ast: *ASTAssert)
{
	b.self.previsit_assert(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_assert(ast)
}

func (b: *ASTVisitorBase) previsit_greater(ast: *ASTGreater)
{
}

func (b: *ASTVisitorBase) postvisit_greater(ast: *ASTGreater)
{
}

func (b: *ASTVisitorBase) visit_greater(ast: *ASTGreater)
{
	b.self.previsit_greater(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level3_expression(ast.__right)
	b.self.postvisit_greater(ast)
}

func (b: *ASTVisitorBase) previsit_parameter(ast: *ASTParameter)
{
}

func (b: *ASTVisitorBase) postvisit_parameter(ast: *ASTParameter)
{
}

func (b: *ASTVisitorBase) visit_parameter(ast: *ASTParameter)
{
	b.self.previsit_parameter(ast)
	b.self.visit_type(ast.__type)
	b.self.postvisit_parameter(ast)
}

func (b: *ASTVisitorBase) previsit_level1_expression(ast: *ASTLevel1Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level1_expression(ast: *ASTLevel1Expression)
{
}

func (b: *ASTVisitorBase) visit_level1_expression(ast: *ASTLevel1Expression)
{
	b.self.previsit_level1_expression(ast)
	type switch ast
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level1_expression(ast)
}

func (b: *ASTVisitorBase) previsit_identifier(ast: *ASTIdentifier)
{
}

func (b: *ASTVisitorBase) postvisit_identifier(ast: *ASTIdentifier)
{
}

func (b: *ASTVisitorBase) visit_identifier(ast: *ASTIdentifier)
{
	b.self.previsit_identifier(ast)
	b.self.postvisit_identifier(ast)
}

func (b: *ASTVisitorBase) previsit_lshift(ast: *ASTLShift)
{
}

func (b: *ASTVisitorBase) postvisit_lshift(ast: *ASTLShift)
{
}

func (b: *ASTVisitorBase) visit_lshift(ast: *ASTLShift)
{
	b.self.previsit_lshift(ast)
	b.self.visit_level2_expression(ast.__left)
	b.self.visit_level1_expression(ast.__right)
	b.self.postvisit_lshift(ast)
}

func (b: *ASTVisitorBase) previsit_deref(ast: *ASTDeref)
{
}

func (b: *ASTVisitorBase) postvisit_deref(ast: *ASTDeref)
{
}

func (b: *ASTVisitorBase) visit_deref(ast: *ASTDeref)
{
	b.self.previsit_deref(ast)
	b.self.visit_level1_expression(ast.__arg)
	b.self.postvisit_deref(ast)
}

func (b: *ASTVisitorBase) previsit_while(ast: *ASTWhile)
{
}

func (b: *ASTVisitorBase) postvisit_while(ast: *ASTWhile)
{
}

func (b: *ASTVisitorBase) visit_while(ast: *ASTWhile)
{
	b.self.previsit_while(ast)
	b.self.visit_expression(ast.__condition)
	var i = 0
	while i < len(ast.__contracts) {
		b.self.visit_while_contract(ast.__contracts[i])
		i++
	}
	b.self.visit_block(ast.__body)
	b.self.postvisit_while(ast)
}

func (b: *ASTVisitorBase) previsit_else_branch(ast: *ASTElseBranch)
{
}

func (b: *ASTVisitorBase) postvisit_else_branch(ast: *ASTElseBranch)
{
}

func (b: *ASTVisitorBase) visit_else_branch(ast: *ASTElseBranch)
{
	b.self.previsit_else_branch(ast)
	type switch ast
	case *ASTBlock {
		b.self.visit_block(ast)
	}
	case *ASTIf {
		b.self.visit_if(ast)
	};;
	b.self.postvisit_else_branch(ast)
}

func (b: *ASTVisitorBase) previsit_less(ast: *ASTLess)
{
}

func (b: *ASTVisitorBase) postvisit_less(ast: *ASTLess)
{
}

func (b: *ASTVisitorBase) visit_less(ast: *ASTLess)
{
	b.self.previsit_less(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level3_expression(ast.__right)
	b.self.postvisit_less(ast)
}

func (b: *ASTVisitorBase) previsit_ref(ast: *ASTRef)
{
}

func (b: *ASTVisitorBase) postvisit_ref(ast: *ASTRef)
{
}

func (b: *ASTVisitorBase) visit_ref(ast: *ASTRef)
{
	b.self.previsit_ref(ast)
	b.self.visit_level1_expression(ast.__arg)
	b.self.postvisit_ref(ast)
}

func (b: *ASTVisitorBase) previsit_mult(ast: *ASTMult)
{
}

func (b: *ASTVisitorBase) postvisit_mult(ast: *ASTMult)
{
}

func (b: *ASTVisitorBase) visit_mult(ast: *ASTMult)
{
	b.self.previsit_mult(ast)
	b.self.visit_level2_expression(ast.__left)
	b.self.visit_level1_expression(ast.__right)
	b.self.postvisit_mult(ast)
}

func (b: *ASTVisitorBase) previsit_struct_member(ast: *ASTStructMember)
{
}

func (b: *ASTVisitorBase) postvisit_struct_member(ast: *ASTStructMember)
{
}

func (b: *ASTVisitorBase) visit_struct_member(ast: *ASTStructMember)
{
	b.self.previsit_struct_member(ast)
	b.self.visit_type(ast.__type)
	b.self.postvisit_struct_member(ast)
}

func (b: *ASTVisitorBase) previsit_method_contract(ast: *ASTMethodContract)
{
}

func (b: *ASTVisitorBase) postvisit_method_contract(ast: *ASTMethodContract)
{
}

func (b: *ASTVisitorBase) visit_method_contract(ast: *ASTMethodContract)
{
	b.self.previsit_method_contract(ast)
	type switch ast
	case *ASTRequires {
		b.self.visit_requires(ast)
	}
	case *ASTRequiresAll {
		b.self.visit_requires_all(ast)
	}
	case *ASTEnsures {
		b.self.visit_ensures(ast)
	}
	case *ASTEnsuresAll {
		b.self.visit_ensures_all(ast)
	}
	case *ASTMayFail {
		b.self.visit_may_fail(ast)
	}
	case *ASTRecursionBound {
		b.self.visit_recursion_bound(ast)
	};;
	b.self.postvisit_method_contract(ast)
}

func (b: *ASTVisitorBase) previsit_div(ast: *ASTDiv)
{
}

func (b: *ASTVisitorBase) postvisit_div(ast: *ASTDiv)
{
}

func (b: *ASTVisitorBase) visit_div(ast: *ASTDiv)
{
	b.self.previsit_div(ast)
	b.self.visit_level2_expression(ast.__left)
	b.self.visit_level1_expression(ast.__right)
	b.self.postvisit_div(ast)
}

func (b: *ASTVisitorBase) previsit_hexa_decimal(ast: *ASTHexaDecimal)
{
}

func (b: *ASTVisitorBase) postvisit_hexa_decimal(ast: *ASTHexaDecimal)
{
}

func (b: *ASTVisitorBase) visit_hexa_decimal(ast: *ASTHexaDecimal)
{
	b.self.previsit_hexa_decimal(ast)
	b.self.postvisit_hexa_decimal(ast)
}

func (b: *ASTVisitorBase) previsit_level4_expression(ast: *ASTLevel4Expression)
{
}

func (b: *ASTVisitorBase) postvisit_level4_expression(ast: *ASTLevel4Expression)
{
}

func (b: *ASTVisitorBase) visit_level4_expression(ast: *ASTLevel4Expression)
{
	b.self.previsit_level4_expression(ast)
	type switch ast
	case *ASTLess {
		b.self.visit_less(ast)
	}
	case *ASTLessEq {
		b.self.visit_less_eq(ast)
	}
	case *ASTGreater {
		b.self.visit_greater(ast)
	}
	case *ASTGreaterEq {
		b.self.visit_greater_eq(ast)
	}
	case *ASTEqual {
		b.self.visit_equal(ast)
	}
	case *ASTInequal {
		b.self.visit_inequal(ast)
	}
	case *ASTIs {
		b.self.visit_is(ast)
	}
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_level4_expression(ast)
}

func (b: *ASTVisitorBase) previsit_requires(ast: *ASTRequires)
{
}

func (b: *ASTVisitorBase) postvisit_requires(ast: *ASTRequires)
{
}

func (b: *ASTVisitorBase) visit_requires(ast: *ASTRequires)
{
	b.self.previsit_requires(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_requires(ast)
}

func (b: *ASTVisitorBase) previsit_interface_member(ast: *ASTInterfaceMember)
{
}

func (b: *ASTVisitorBase) postvisit_interface_member(ast: *ASTInterfaceMember)
{
}

func (b: *ASTVisitorBase) visit_interface_member(ast: *ASTInterfaceMember)
{
	b.self.previsit_interface_member(ast)
	if ast.__signature != null {
		b.self.visit_method_signature(ast.__signature)
	}
	b.self.postvisit_interface_member(ast)
}

func (b: *ASTVisitorBase) previsit_decrement(ast: *ASTDecrement)
{
}

func (b: *ASTVisitorBase) postvisit_decrement(ast: *ASTDecrement)
{
}

func (b: *ASTVisitorBase) visit_decrement(ast: *ASTDecrement)
{
	b.self.previsit_decrement(ast)
	b.self.visit_expression(ast.__lvalue)
	b.self.postvisit_decrement(ast)
}

func (b: *ASTVisitorBase) previsit_typedef(ast: *ASTTypedef)
{
}

func (b: *ASTVisitorBase) postvisit_typedef(ast: *ASTTypedef)
{
}

func (b: *ASTVisitorBase) visit_typedef(ast: *ASTTypedef)
{
	b.self.previsit_typedef(ast)
	b.self.visit_named_type(ast.__type)
	b.self.postvisit_typedef(ast)
}

func (b: *ASTVisitorBase) previsit_invariant_all(ast: *ASTInvariantAll)
{
}

func (b: *ASTVisitorBase) postvisit_invariant_all(ast: *ASTInvariantAll)
{
}

func (b: *ASTVisitorBase) visit_invariant_all(ast: *ASTInvariantAll)
{
	b.self.previsit_invariant_all(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_invariant_all(ast)
}

func (b: *ASTVisitorBase) previsit_binary_minus(ast: *ASTBinaryMinus)
{
}

func (b: *ASTVisitorBase) postvisit_binary_minus(ast: *ASTBinaryMinus)
{
}

func (b: *ASTVisitorBase) visit_binary_minus(ast: *ASTBinaryMinus)
{
	b.self.previsit_binary_minus(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level2_expression(ast.__right)
	b.self.postvisit_binary_minus(ast)
}

func (b: *ASTVisitorBase) previsit_recoverable(ast: *ASTRecoverable)
{
}

func (b: *ASTVisitorBase) postvisit_recoverable(ast: *ASTRecoverable)
{
}

func (b: *ASTVisitorBase) visit_recoverable(ast: *ASTRecoverable)
{
	b.self.previsit_recoverable(ast)
	type switch ast
	case *ASTAssignment {
		b.self.visit_assignment(ast)
	}
	case *ASTVardecl {
		b.self.visit_vardecl(ast)
	}
	case *ASTOr {
		b.self.visit_or(ast)
	}
	case *ASTAnd {
		b.self.visit_and(ast)
	}
	case *ASTLess {
		b.self.visit_less(ast)
	}
	case *ASTLessEq {
		b.self.visit_less_eq(ast)
	}
	case *ASTGreater {
		b.self.visit_greater(ast)
	}
	case *ASTGreaterEq {
		b.self.visit_greater_eq(ast)
	}
	case *ASTEqual {
		b.self.visit_equal(ast)
	}
	case *ASTInequal {
		b.self.visit_inequal(ast)
	}
	case *ASTIs {
		b.self.visit_is(ast)
	}
	case *ASTBinaryPlus {
		b.self.visit_binary_plus(ast)
	}
	case *ASTBinaryMinus {
		b.self.visit_binary_minus(ast)
	}
	case *ASTBitOr {
		b.self.visit_bit_or(ast)
	}
	case *ASTBitXor {
		b.self.visit_bit_xor(ast)
	}
	case *ASTMult {
		b.self.visit_mult(ast)
	}
	case *ASTDiv {
		b.self.visit_div(ast)
	}
	case *ASTMod {
		b.self.visit_mod(ast)
	}
	case *ASTLShift {
		b.self.visit_lshift(ast)
	}
	case *ASTRShift {
		b.self.visit_rshift(ast)
	}
	case *ASTBitAnd {
		b.self.visit_bit_and(ast)
	}
	case *ASTUnaryPlus {
		b.self.visit_unary_plus(ast)
	}
	case *ASTUnaryMinus {
		b.self.visit_unary_minus(ast)
	}
	case *ASTDeref {
		b.self.visit_deref(ast)
	}
	case *ASTRef {
		b.self.visit_ref(ast)
	}
	case *ASTNot {
		b.self.visit_not(ast)
	}
	case *ASTTake {
		b.self.visit_take(ast)
	}
	case *ASTMethodCall {
		b.self.visit_method_call(ast)
	}
	case *ASTSelector {
		b.self.visit_selector(ast)
	}
	case *ASTIndexed {
		b.self.visit_indexed(ast)
	}
	case *ASTIdentifier {
		b.self.visit_identifier(ast)
	}
	case *ASTNew {
		b.self.visit_new(ast)
	}
	case *ASTNewArray {
		b.self.visit_new_array(ast)
	}
	case *ASTPExpression {
		b.self.visit_pexpression(ast)
	}
	case *ASTDecimal {
		b.self.visit_decimal(ast)
	}
	case *ASTOctal {
		b.self.visit_octal(ast)
	}
	case *ASTHexaDecimal {
		b.self.visit_hexa_decimal(ast)
	}
	case *ASTString {
		b.self.visit_string(ast)
	}
	case *ASTChar {
		b.self.visit_char(ast)
	};;
	b.self.postvisit_recoverable(ast)
}

func (b: *ASTVisitorBase) previsit_switch_case(ast: *ASTSwitchCase)
{
}

func (b: *ASTVisitorBase) postvisit_switch_case(ast: *ASTSwitchCase)
{
}

func (b: *ASTVisitorBase) visit_switch_case(ast: *ASTSwitchCase)
{
	b.self.previsit_switch_case(ast)
	var i = 0
	while i < len(ast.__matches) {
		b.self.visit_expression(ast.__matches[i])
		i++
	}
	b.self.visit_block(ast.__body)
	b.self.postvisit_switch_case(ast)
}

func (b: *ASTVisitorBase) previsit_bit_xor(ast: *ASTBitXor)
{
}

func (b: *ASTVisitorBase) postvisit_bit_xor(ast: *ASTBitXor)
{
}

func (b: *ASTVisitorBase) visit_bit_xor(ast: *ASTBitXor)
{
	b.self.previsit_bit_xor(ast)
	b.self.visit_level3_expression(ast.__left)
	b.self.visit_level2_expression(ast.__right)
	b.self.postvisit_bit_xor(ast)
}

func (b: *ASTVisitorBase) previsit_recursion_bound(ast: *ASTRecursionBound)
{
}

func (b: *ASTVisitorBase) postvisit_recursion_bound(ast: *ASTRecursionBound)
{
}

func (b: *ASTVisitorBase) visit_recursion_bound(ast: *ASTRecursionBound)
{
	b.self.previsit_recursion_bound(ast)
	b.self.visit_expression(ast.__expr)
	b.self.postvisit_recursion_bound(ast)
}

func (b: *ASTVisitorBase) previsit_array_type(ast: *ASTArrayType)
{
}

func (b: *ASTVisitorBase) postvisit_array_type(ast: *ASTArrayType)
{
}

func (b: *ASTVisitorBase) visit_array_type(ast: *ASTArrayType)
{
	b.self.previsit_array_type(ast)
	if ast.__length != null {
		b.self.visit_expression(ast.__length)
	}
	b.self.visit_type(ast.__element_type)
	b.self.postvisit_array_type(ast)
}

func (b: *ASTVisitorBase) previsit_continue(ast: *ASTContinue)
{
}

func (b: *ASTVisitorBase) postvisit_continue(ast: *ASTContinue)
{
}

func (b: *ASTVisitorBase) visit_continue(ast: *ASTContinue)
{
	b.self.previsit_continue(ast)
	b.self.postvisit_continue(ast)
}

func (b: *ASTVisitorBase) previsit_indexed(ast: *ASTIndexed)
{
}

func (b: *ASTVisitorBase) postvisit_indexed(ast: *ASTIndexed)
{
}

func (b: *ASTVisitorBase) visit_indexed(ast: *ASTIndexed)
{
	b.self.previsit_indexed(ast)
	b.self.visit_level0_expression(ast.__base)
	b.self.visit_expression(ast.__index)
	b.self.postvisit_indexed(ast)
}

