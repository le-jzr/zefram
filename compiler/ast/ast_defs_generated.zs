type ASTAnd = struct {
	ASTBase
	
	_left: own *ASTLevel5Expression
	_right: own *ASTLevel4Expression
}
func new_ASTAnd(_left: own *ASTLevel5Expression, _right: own *ASTLevel4Expression) (ret: own *ASTAnd)
{
	ret = new(ASTAnd)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTAnd) copy() (ret: own *ASTAnd)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTAnd)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTArrayType = struct {
	ASTBase
	
	_length: own *ASTExpression
	_element_type: own *ASTType
}
func new_ASTArrayType(_length: own *ASTExpression, _element_type: own *ASTType) (ret: own *ASTArrayType)
{
	ret = new(ASTArrayType)
	ret._length = @_length
	ret._element_type = @_element_type
	return ret
}
func (node: *ASTArrayType) copy() (ret: own *ASTArrayType)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTArrayType)
	
	if node._length != null {
		ret._length = node._length.copy()
	}
	if node._element_type != null {
		ret._element_type = node._element_type.copy()
	}
	
	return ret
}
type ASTAssert = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTAssert(_expr: own *ASTExpression) (ret: own *ASTAssert)
{
	ret = new(ASTAssert)
	ret._expr = @_expr
	return ret
}
func (node: *ASTAssert) copy() (ret: own *ASTAssert)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTAssert)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTAssertAll = struct {
	ASTBase
	
	_vars: own *[]string
	_expr: own *ASTExpression
}
func new_ASTAssertAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTAssertAll)
{
	ret = new(ASTAssertAll)
	ret._vars = @_vars
	ret._expr = @_expr
	return ret
}
func (node: *ASTAssertAll) copy() (ret: own *ASTAssertAll)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTAssertAll)
	
	ret._vars = node.copy_vars()
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
func (node: *ASTAssertAll) copy_vars() (ret: own *[]string)
{
	
	ret = new[len(node._vars)](string)
	
	var i = 0
	while i < len(ret) {
		ret[i] = node._vars[i]
		i++
	}
	
	return
}
type ASTAssignment = struct {
	ASTBase
	
	_rvalues: own *[]own *ASTExpression
	_lvalues: own *[]own *ASTExpression
}
func new_ASTAssignment(_rvalues: own *[]own *ASTExpression, _lvalues: own *[]own *ASTExpression) (ret: own *ASTAssignment)
{
	ret = new(ASTAssignment)
	ret._rvalues = @_rvalues
	ret._lvalues = @_lvalues
	return ret
}
func (node: *ASTAssignment) copy() (ret: own *ASTAssignment)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTAssignment)
	
	ret._rvalues = node.copy_rvalues()
	ret._lvalues = node.copy_lvalues()
	
	return ret
}
func (node: *ASTAssignment) copy_rvalues() (ret: own *[]own *ASTExpression)
{
	
	ret = new[len(node._rvalues)](own *ASTExpression)
	
	var i = 0
	while i < len(node._rvalues) {
		if node._rvalues[i] != null {
			ret[i] = node._rvalues[i].copy()
		}
		i++
	}
	
	
	return
}
func (node: *ASTAssignment) copy_lvalues() (ret: own *[]own *ASTExpression)
{
	
	ret = new[len(node._lvalues)](own *ASTExpression)
	
	var i = 0
	while i < len(node._lvalues) {
		if node._lvalues[i] != null {
			ret[i] = node._lvalues[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTAssume = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTAssume(_expr: own *ASTExpression) (ret: own *ASTAssume)
{
	ret = new(ASTAssume)
	ret._expr = @_expr
	return ret
}
func (node: *ASTAssume) copy() (ret: own *ASTAssume)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTAssume)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTBinaryMinus = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel2Expression
}
func new_ASTBinaryMinus(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBinaryMinus)
{
	ret = new(ASTBinaryMinus)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTBinaryMinus) copy() (ret: own *ASTBinaryMinus)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBinaryMinus)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTBinaryPlus = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel2Expression
}
func new_ASTBinaryPlus(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBinaryPlus)
{
	ret = new(ASTBinaryPlus)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTBinaryPlus) copy() (ret: own *ASTBinaryPlus)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBinaryPlus)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTBitAnd = struct {
	ASTBase
	
	_left: own *ASTLevel2Expression
	_right: own *ASTLevel1Expression
}
func new_ASTBitAnd(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTBitAnd)
{
	ret = new(ASTBitAnd)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTBitAnd) copy() (ret: own *ASTBitAnd)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBitAnd)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTBitOr = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel2Expression
}
func new_ASTBitOr(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBitOr)
{
	ret = new(ASTBitOr)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTBitOr) copy() (ret: own *ASTBitOr)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBitOr)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTBitXor = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel2Expression
}
func new_ASTBitXor(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBitXor)
{
	ret = new(ASTBitXor)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTBitXor) copy() (ret: own *ASTBitXor)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBitXor)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTBlock = struct {
	ASTBase
	
	_statements: own *[]own *ASTStatement
}
func new_ASTBlock(_statements: own *[]own *ASTStatement) (ret: own *ASTBlock)
{
	ret = new(ASTBlock)
	ret._statements = @_statements
	return ret
}
func (node: *ASTBlock) copy() (ret: own *ASTBlock)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBlock)
	
	ret._statements = node.copy_statements()
	
	return ret
}
func (node: *ASTBlock) copy_statements() (ret: own *[]own *ASTStatement)
{
	
	ret = new[len(node._statements)](own *ASTStatement)
	
	var i = 0
	while i < len(node._statements) {
		if node._statements[i] != null {
			ret[i] = node._statements[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTBreak = struct {
	ASTBase
	
	_label: own *string
}
func new_ASTBreak(_label: own *string) (ret: own *ASTBreak)
{
	ret = new(ASTBreak)
	ret._label = @_label
	return ret
}
func (node: *ASTBreak) copy() (ret: own *ASTBreak)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTBreak)
	
	ret._label = new(string)
	*ret._label = *node._label
	
	return ret
}
type ASTChar = struct {
	ASTBase
	
	_str: string
}
func new_ASTChar(_str: string) (ret: own *ASTChar)
{
	ret = new(ASTChar)
	ret._str = @_str
	return ret
}
func (node: *ASTChar) copy() (ret: own *ASTChar)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTChar)
	
	ret._str = node._str
	
	return ret
}
type ASTContinue = struct {
	ASTBase
	
	_label: own *string
}
func new_ASTContinue(_label: own *string) (ret: own *ASTContinue)
{
	ret = new(ASTContinue)
	ret._label = @_label
	return ret
}
func (node: *ASTContinue) copy() (ret: own *ASTContinue)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTContinue)
	
	ret._label = new(string)
	*ret._label = *node._label
	
	return ret
}
type ASTDecimal = struct {
	ASTBase
	
	_str: string
}
func new_ASTDecimal(_str: string) (ret: own *ASTDecimal)
{
	ret = new(ASTDecimal)
	ret._str = @_str
	return ret
}
func (node: *ASTDecimal) copy() (ret: own *ASTDecimal)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTDecimal)
	
	ret._str = node._str
	
	return ret
}
type ASTDecrement = struct {
	ASTBase
	
	_lvalue: own *ASTExpression
}
func new_ASTDecrement(_lvalue: own *ASTExpression) (ret: own *ASTDecrement)
{
	ret = new(ASTDecrement)
	ret._lvalue = @_lvalue
	return ret
}
func (node: *ASTDecrement) copy() (ret: own *ASTDecrement)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTDecrement)
	
	if node._lvalue != null {
		ret._lvalue = node._lvalue.copy()
	}
	
	return ret
}
type ASTDefaultCase = struct {
	ASTBase
	
	_body: own *ASTBlock
}
func new_ASTDefaultCase(_body: own *ASTBlock) (ret: own *ASTDefaultCase)
{
	ret = new(ASTDefaultCase)
	ret._body = @_body
	return ret
}
func (node: *ASTDefaultCase) copy() (ret: own *ASTDefaultCase)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTDefaultCase)
	
	if node._body != null {
		ret._body = node._body.copy()
	}
	
	return ret
}
type ASTDelete = struct {
	ASTBase
	
	_arg: own *ASTExpression
}
func new_ASTDelete(_arg: own *ASTExpression) (ret: own *ASTDelete)
{
	ret = new(ASTDelete)
	ret._arg = @_arg
	return ret
}
func (node: *ASTDelete) copy() (ret: own *ASTDelete)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTDelete)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTDeref = struct {
	ASTBase
	
	_arg: own *ASTLevel1Expression
}
func new_ASTDeref(_arg: own *ASTLevel1Expression) (ret: own *ASTDeref)
{
	ret = new(ASTDeref)
	ret._arg = @_arg
	return ret
}
func (node: *ASTDeref) copy() (ret: own *ASTDeref)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTDeref)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTDiv = struct {
	ASTBase
	
	_left: own *ASTLevel2Expression
	_right: own *ASTLevel1Expression
}
func new_ASTDiv(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTDiv)
{
	ret = new(ASTDiv)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTDiv) copy() (ret: own *ASTDiv)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTDiv)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTElseBranch = Block | If
type ASTEnsures = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTEnsures(_expr: own *ASTExpression) (ret: own *ASTEnsures)
{
	ret = new(ASTEnsures)
	ret._expr = @_expr
	return ret
}
func (node: *ASTEnsures) copy() (ret: own *ASTEnsures)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTEnsures)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTEnsuresAll = struct {
	ASTBase
	
	_vars: own *[]string
	_expr: own *ASTExpression
}
func new_ASTEnsuresAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTEnsuresAll)
{
	ret = new(ASTEnsuresAll)
	ret._vars = @_vars
	ret._expr = @_expr
	return ret
}
func (node: *ASTEnsuresAll) copy() (ret: own *ASTEnsuresAll)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTEnsuresAll)
	
	ret._vars = node.copy_vars()
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
func (node: *ASTEnsuresAll) copy_vars() (ret: own *[]string)
{
	
	ret = new[len(node._vars)](string)
	
	var i = 0
	while i < len(ret) {
		ret[i] = node._vars[i]
		i++
	}
	
	return
}
type ASTEqual = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel3Expression
}
func new_ASTEqual(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTEqual)
{
	ret = new(ASTEqual)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTEqual) copy() (ret: own *ASTEqual)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTEqual)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTExpression = Or | Level5Expression
type ASTFail = struct {
	ASTBase
	
	_code: string
	_description: own *string
}
func new_ASTFail(_code: string, _description: own *string) (ret: own *ASTFail)
{
	ret = new(ASTFail)
	ret._code = @_code
	ret._description = @_description
	return ret
}
func (node: *ASTFail) copy() (ret: own *ASTFail)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTFail)
	
	ret._code = node._code
	ret._description = new(string)
	*ret._description = *node._description
	
	return ret
}
type ASTFailRecover = struct {
	ASTBase
	
	_stmt: own *ASTRecoverable
	_recover_block: own *ASTBlock
}
func new_ASTFailRecover(_stmt: own *ASTRecoverable, _recover_block: own *ASTBlock) (ret: own *ASTFailRecover)
{
	ret = new(ASTFailRecover)
	ret._stmt = @_stmt
	ret._recover_block = @_recover_block
	return ret
}
func (node: *ASTFailRecover) copy() (ret: own *ASTFailRecover)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTFailRecover)
	
	if node._stmt != null {
		ret._stmt = node._stmt.copy()
	}
	if node._recover_block != null {
		ret._recover_block = node._recover_block.copy()
	}
	
	return ret
}
type ASTFile = struct {
	ASTBase
	
	_globals: own *[]own *ASTGlobal
}
func new_ASTFile(_globals: own *[]own *ASTGlobal) (ret: own *ASTFile)
{
	ret = new(ASTFile)
	ret._globals = @_globals
	return ret
}
func (node: *ASTFile) copy() (ret: own *ASTFile)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTFile)
	
	ret._globals = node.copy_globals()
	
	return ret
}
func (node: *ASTFile) copy_globals() (ret: own *[]own *ASTGlobal)
{
	
	ret = new[len(node._globals)](own *ASTGlobal)
	
	var i = 0
	while i < len(node._globals) {
		if node._globals[i] != null {
			ret[i] = node._globals[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTGlobal = Method | Typedef
type ASTGreater = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel3Expression
}
func new_ASTGreater(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTGreater)
{
	ret = new(ASTGreater)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTGreater) copy() (ret: own *ASTGreater)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTGreater)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTGreaterEq = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel3Expression
}
func new_ASTGreaterEq(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTGreaterEq)
{
	ret = new(ASTGreaterEq)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTGreaterEq) copy() (ret: own *ASTGreaterEq)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTGreaterEq)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTHexaDecimal = struct {
	ASTBase
	
	_str: string
}
func new_ASTHexaDecimal(_str: string) (ret: own *ASTHexaDecimal)
{
	ret = new(ASTHexaDecimal)
	ret._str = @_str
	return ret
}
func (node: *ASTHexaDecimal) copy() (ret: own *ASTHexaDecimal)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTHexaDecimal)
	
	ret._str = node._str
	
	return ret
}
type ASTIdentifier = struct {
	ASTBase
	
	_ident: string
}
func new_ASTIdentifier(_ident: string) (ret: own *ASTIdentifier)
{
	ret = new(ASTIdentifier)
	ret._ident = @_ident
	return ret
}
func (node: *ASTIdentifier) copy() (ret: own *ASTIdentifier)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTIdentifier)
	
	ret._ident = node._ident
	
	return ret
}
type ASTIf = struct {
	ASTBase
	
	_condition: own *ASTExpression
	_true_branch: own *ASTBlock
	_false_branch: own *ASTElseBranch
}
func new_ASTIf(_condition: own *ASTExpression, _true_branch: own *ASTBlock, _false_branch: own *ASTElseBranch) (ret: own *ASTIf)
{
	ret = new(ASTIf)
	ret._condition = @_condition
	ret._true_branch = @_true_branch
	ret._false_branch = @_false_branch
	return ret
}
func (node: *ASTIf) copy() (ret: own *ASTIf)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTIf)
	
	if node._condition != null {
		ret._condition = node._condition.copy()
	}
	if node._true_branch != null {
		ret._true_branch = node._true_branch.copy()
	}
	if node._false_branch != null {
		ret._false_branch = node._false_branch.copy()
	}
	
	return ret
}
type ASTIncrement = struct {
	ASTBase
	
	_lvalue: own *ASTExpression
}
func new_ASTIncrement(_lvalue: own *ASTExpression) (ret: own *ASTIncrement)
{
	ret = new(ASTIncrement)
	ret._lvalue = @_lvalue
	return ret
}
func (node: *ASTIncrement) copy() (ret: own *ASTIncrement)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTIncrement)
	
	if node._lvalue != null {
		ret._lvalue = node._lvalue.copy()
	}
	
	return ret
}
type ASTIndexed = struct {
	ASTBase
	
	_base: own *ASTLevel0Expression
	_index: own *ASTExpression
}
func new_ASTIndexed(_base: own *ASTLevel0Expression, _index: own *ASTExpression) (ret: own *ASTIndexed)
{
	ret = new(ASTIndexed)
	ret._base = @_base
	ret._index = @_index
	return ret
}
func (node: *ASTIndexed) copy() (ret: own *ASTIndexed)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTIndexed)
	
	if node._base != null {
		ret._base = node._base.copy()
	}
	if node._index != null {
		ret._index = node._index.copy()
	}
	
	return ret
}
type ASTInequal = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel3Expression
}
func new_ASTInequal(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTInequal)
{
	ret = new(ASTInequal)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTInequal) copy() (ret: own *ASTInequal)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTInequal)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTInterfaceMember = struct {
	ASTBase
	
	_name: string
	_signature: own *ASTMethodSignature
}
func new_ASTInterfaceMember(_name: string, _signature: own *ASTMethodSignature) (ret: own *ASTInterfaceMember)
{
	ret = new(ASTInterfaceMember)
	ret._name = @_name
	ret._signature = @_signature
	return ret
}
func (node: *ASTInterfaceMember) copy() (ret: own *ASTInterfaceMember)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTInterfaceMember)
	
	ret._name = node._name
	if node._signature != null {
		ret._signature = node._signature.copy()
	}
	
	return ret
}
type ASTInterfaceType = struct {
	ASTBase
	
	_members: own *[]own *ASTInterfaceMember
}
func new_ASTInterfaceType(_members: own *[]own *ASTInterfaceMember) (ret: own *ASTInterfaceType)
{
	ret = new(ASTInterfaceType)
	ret._members = @_members
	return ret
}
func (node: *ASTInterfaceType) copy() (ret: own *ASTInterfaceType)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTInterfaceType)
	
	ret._members = node.copy_members()
	
	return ret
}
func (node: *ASTInterfaceType) copy_members() (ret: own *[]own *ASTInterfaceMember)
{
	
	ret = new[len(node._members)](own *ASTInterfaceMember)
	
	var i = 0
	while i < len(node._members) {
		if node._members[i] != null {
			ret[i] = node._members[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTInvariant = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTInvariant(_expr: own *ASTExpression) (ret: own *ASTInvariant)
{
	ret = new(ASTInvariant)
	ret._expr = @_expr
	return ret
}
func (node: *ASTInvariant) copy() (ret: own *ASTInvariant)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTInvariant)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTInvariantAll = struct {
	ASTBase
	
	_vars: own *[]string
	_expr: own *ASTExpression
}
func new_ASTInvariantAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTInvariantAll)
{
	ret = new(ASTInvariantAll)
	ret._vars = @_vars
	ret._expr = @_expr
	return ret
}
func (node: *ASTInvariantAll) copy() (ret: own *ASTInvariantAll)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTInvariantAll)
	
	ret._vars = node.copy_vars()
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
func (node: *ASTInvariantAll) copy_vars() (ret: own *[]string)
{
	
	ret = new[len(node._vars)](string)
	
	var i = 0
	while i < len(ret) {
		ret[i] = node._vars[i]
		i++
	}
	
	return
}
type ASTIs = struct {
	ASTBase
	
	_arg: own *ASTLevel3Expression
	_type: own *ASTType
}
func new_ASTIs(_arg: own *ASTLevel3Expression, _type: own *ASTType) (ret: own *ASTIs)
{
	ret = new(ASTIs)
	ret._arg = @_arg
	ret._type = @_type
	return ret
}
func (node: *ASTIs) copy() (ret: own *ASTIs)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTIs)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
type ASTLShift = struct {
	ASTBase
	
	_left: own *ASTLevel2Expression
	_right: own *ASTLevel1Expression
}
func new_ASTLShift(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTLShift)
{
	ret = new(ASTLShift)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTLShift) copy() (ret: own *ASTLShift)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTLShift)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTLess = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel3Expression
}
func new_ASTLess(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTLess)
{
	ret = new(ASTLess)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTLess) copy() (ret: own *ASTLess)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTLess)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTLessEq = struct {
	ASTBase
	
	_left: own *ASTLevel3Expression
	_right: own *ASTLevel3Expression
}
func new_ASTLessEq(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTLessEq)
{
	ret = new(ASTLessEq)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTLessEq) copy() (ret: own *ASTLessEq)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTLessEq)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTLevel0Expression = MethodCall | Selector | Indexed | Identifier | Literal | New | NewArray | PExpression
type ASTLevel1Expression = UnaryPlus | UnaryMinus | Deref | Ref | Not | Take | Level0Expression
type ASTLevel2Expression = Mult | Div | Mod | LShift | RShift | BitAnd | Level1Expression
type ASTLevel3Expression = BinaryPlus | BinaryMinus | BitOr | BitXor | Level2Expression
type ASTLevel4Expression = Less | LessEq | Greater | GreaterEq | Equal | Inequal | Is | Level3Expression
type ASTLevel5Expression = And | Level4Expression
type ASTLiteral = Decimal | Octal | HexaDecimal | String | Char
type ASTLoopBound = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTLoopBound(_expr: own *ASTExpression) (ret: own *ASTLoopBound)
{
	ret = new(ASTLoopBound)
	ret._expr = @_expr
	return ret
}
func (node: *ASTLoopBound) copy() (ret: own *ASTLoopBound)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTLoopBound)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTMayFail = struct {
	ASTBase
	
	_fail_list: own *[]string
}
func new_ASTMayFail(_fail_list: own *[]string) (ret: own *ASTMayFail)
{
	ret = new(ASTMayFail)
	ret._fail_list = @_fail_list
	return ret
}
func (node: *ASTMayFail) copy() (ret: own *ASTMayFail)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTMayFail)
	
	ret._fail_list = node.copy_fail_list()
	
	return ret
}
func (node: *ASTMayFail) copy_fail_list() (ret: own *[]string)
{
	
	ret = new[len(node._fail_list)](string)
	
	var i = 0
	while i < len(ret) {
		ret[i] = node._fail_list[i]
		i++
	}
	
	return
}
type ASTMethod = struct {
	ASTBase
	
	_receiver: own *ASTParameter
	_name: string
	_signature: own *ASTMethodSignature
	_contracts: own *[]own *ASTMethodContract
	_body: own *ASTBlock
}
func new_ASTMethod(_receiver: own *ASTParameter, _name: string, _signature: own *ASTMethodSignature, _contracts: own *[]own *ASTMethodContract, _body: own *ASTBlock) (ret: own *ASTMethod)
{
	ret = new(ASTMethod)
	ret._receiver = @_receiver
	ret._name = @_name
	ret._signature = @_signature
	ret._contracts = @_contracts
	ret._body = @_body
	return ret
}
func (node: *ASTMethod) copy() (ret: own *ASTMethod)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTMethod)
	
	if node._receiver != null {
		ret._receiver = node._receiver.copy()
	}
	ret._name = node._name
	if node._signature != null {
		ret._signature = node._signature.copy()
	}
	ret._contracts = node.copy_contracts()
	if node._body != null {
		ret._body = node._body.copy()
	}
	
	return ret
}
func (node: *ASTMethod) copy_contracts() (ret: own *[]own *ASTMethodContract)
{
	
	ret = new[len(node._contracts)](own *ASTMethodContract)
	
	var i = 0
	while i < len(node._contracts) {
		if node._contracts[i] != null {
			ret[i] = node._contracts[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTMethodCall = struct {
	ASTBase
	
	_receiver: own *ASTLevel0Expression
	_method: string
	_args: own *[]own *ASTExpression
}
func new_ASTMethodCall(_receiver: own *ASTLevel0Expression, _method: string, _args: own *[]own *ASTExpression) (ret: own *ASTMethodCall)
{
	ret = new(ASTMethodCall)
	ret._receiver = @_receiver
	ret._method = @_method
	ret._args = @_args
	return ret
}
func (node: *ASTMethodCall) copy() (ret: own *ASTMethodCall)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTMethodCall)
	
	if node._receiver != null {
		ret._receiver = node._receiver.copy()
	}
	ret._method = node._method
	ret._args = node.copy_args()
	
	return ret
}
func (node: *ASTMethodCall) copy_args() (ret: own *[]own *ASTExpression)
{
	
	ret = new[len(node._args)](own *ASTExpression)
	
	var i = 0
	while i < len(node._args) {
		if node._args[i] != null {
			ret[i] = node._args[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTMethodContract = Requires | RequiresAll | Ensures | EnsuresAll | MayFail | RecursionBound
type ASTMethodSignature = struct {
	ASTBase
	
	_in_params: own *[]own *ASTParameter
	_out_params: own *[]own *ASTParameter
}
func new_ASTMethodSignature(_in_params: own *[]own *ASTParameter, _out_params: own *[]own *ASTParameter) (ret: own *ASTMethodSignature)
{
	ret = new(ASTMethodSignature)
	ret._in_params = @_in_params
	ret._out_params = @_out_params
	return ret
}
func (node: *ASTMethodSignature) copy() (ret: own *ASTMethodSignature)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTMethodSignature)
	
	ret._in_params = node.copy_in_params()
	ret._out_params = node.copy_out_params()
	
	return ret
}
func (node: *ASTMethodSignature) copy_in_params() (ret: own *[]own *ASTParameter)
{
	
	ret = new[len(node._in_params)](own *ASTParameter)
	
	var i = 0
	while i < len(node._in_params) {
		if node._in_params[i] != null {
			ret[i] = node._in_params[i].copy()
		}
		i++
	}
	
	
	return
}
func (node: *ASTMethodSignature) copy_out_params() (ret: own *[]own *ASTParameter)
{
	
	ret = new[len(node._out_params)](own *ASTParameter)
	
	var i = 0
	while i < len(node._out_params) {
		if node._out_params[i] != null {
			ret[i] = node._out_params[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTMod = struct {
	ASTBase
	
	_left: own *ASTLevel2Expression
	_right: own *ASTLevel1Expression
}
func new_ASTMod(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTMod)
{
	ret = new(ASTMod)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTMod) copy() (ret: own *ASTMod)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTMod)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTMult = struct {
	ASTBase
	
	_left: own *ASTLevel2Expression
	_right: own *ASTLevel1Expression
}
func new_ASTMult(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTMult)
{
	ret = new(ASTMult)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTMult) copy() (ret: own *ASTMult)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTMult)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTNamedType = StructType | InterfaceType | SelectionType
type ASTNew = struct {
	ASTBase
	
	_type: own *ASTType
}
func new_ASTNew(_type: own *ASTType) (ret: own *ASTNew)
{
	ret = new(ASTNew)
	ret._type = @_type
	return ret
}
func (node: *ASTNew) copy() (ret: own *ASTNew)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTNew)
	
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
type ASTNewArray = struct {
	ASTBase
	
	_length: own *ASTExpression
	_type: own *ASTType
}
func new_ASTNewArray(_length: own *ASTExpression, _type: own *ASTType) (ret: own *ASTNewArray)
{
	ret = new(ASTNewArray)
	ret._length = @_length
	ret._type = @_type
	return ret
}
func (node: *ASTNewArray) copy() (ret: own *ASTNewArray)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTNewArray)
	
	if node._length != null {
		ret._length = node._length.copy()
	}
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
type ASTNot = struct {
	ASTBase
	
	_arg: own *ASTLevel1Expression
}
func new_ASTNot(_arg: own *ASTLevel1Expression) (ret: own *ASTNot)
{
	ret = new(ASTNot)
	ret._arg = @_arg
	return ret
}
func (node: *ASTNot) copy() (ret: own *ASTNot)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTNot)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTOctal = struct {
	ASTBase
	
	_str: string
}
func new_ASTOctal(_str: string) (ret: own *ASTOctal)
{
	ret = new(ASTOctal)
	ret._str = @_str
	return ret
}
func (node: *ASTOctal) copy() (ret: own *ASTOctal)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTOctal)
	
	ret._str = node._str
	
	return ret
}
type ASTOr = struct {
	ASTBase
	
	_left: own *ASTExpression
	_right: own *ASTLevel5Expression
}
func new_ASTOr(_left: own *ASTExpression, _right: own *ASTLevel5Expression) (ret: own *ASTOr)
{
	ret = new(ASTOr)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTOr) copy() (ret: own *ASTOr)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTOr)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTPExpression = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTPExpression(_expr: own *ASTExpression) (ret: own *ASTPExpression)
{
	ret = new(ASTPExpression)
	ret._expr = @_expr
	return ret
}
func (node: *ASTPExpression) copy() (ret: own *ASTPExpression)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTPExpression)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTParameter = struct {
	ASTBase
	
	_name: own *string
	_type: own *ASTType
}
func new_ASTParameter(_name: own *string, _type: own *ASTType) (ret: own *ASTParameter)
{
	ret = new(ASTParameter)
	ret._name = @_name
	ret._type = @_type
	return ret
}
func (node: *ASTParameter) copy() (ret: own *ASTParameter)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTParameter)
	
	ret._name = new(string)
	*ret._name = *node._name
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
type ASTPointerType = struct {
	ASTBase
	
	_inner_type: own *ASTType
	_nullable: bool
	_owned: bool
}
func new_ASTPointerType(_inner_type: own *ASTType, _nullable: bool, _owned: bool) (ret: own *ASTPointerType)
{
	ret = new(ASTPointerType)
	ret._inner_type = @_inner_type
	ret._nullable = @_nullable
	ret._owned = @_owned
	return ret
}
func (node: *ASTPointerType) copy() (ret: own *ASTPointerType)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTPointerType)
	
	if node._inner_type != null {
		ret._inner_type = node._inner_type.copy()
	}
	ret._nullable = node._nullable
	ret._owned = node._owned
	
	return ret
}
type ASTRShift = struct {
	ASTBase
	
	_left: own *ASTLevel2Expression
	_right: own *ASTLevel1Expression
}
func new_ASTRShift(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTRShift)
{
	ret = new(ASTRShift)
	ret._left = @_left
	ret._right = @_right
	return ret
}
func (node: *ASTRShift) copy() (ret: own *ASTRShift)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTRShift)
	
	if node._left != null {
		ret._left = node._left.copy()
	}
	if node._right != null {
		ret._right = node._right.copy()
	}
	
	return ret
}
type ASTRangeType = struct {
	ASTBase
	
	_low: own *ASTExpression
	_high: own *ASTExpression
}
func new_ASTRangeType(_low: own *ASTExpression, _high: own *ASTExpression) (ret: own *ASTRangeType)
{
	ret = new(ASTRangeType)
	ret._low = @_low
	ret._high = @_high
	return ret
}
func (node: *ASTRangeType) copy() (ret: own *ASTRangeType)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTRangeType)
	
	if node._low != null {
		ret._low = node._low.copy()
	}
	if node._high != null {
		ret._high = node._high.copy()
	}
	
	return ret
}
type ASTRecoverable = Expression | Assignment | Vardecl
type ASTRecursionBound = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTRecursionBound(_expr: own *ASTExpression) (ret: own *ASTRecursionBound)
{
	ret = new(ASTRecursionBound)
	ret._expr = @_expr
	return ret
}
func (node: *ASTRecursionBound) copy() (ret: own *ASTRecursionBound)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTRecursionBound)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTRef = struct {
	ASTBase
	
	_arg: own *ASTLevel1Expression
}
func new_ASTRef(_arg: own *ASTLevel1Expression) (ret: own *ASTRef)
{
	ret = new(ASTRef)
	ret._arg = @_arg
	return ret
}
func (node: *ASTRef) copy() (ret: own *ASTRef)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTRef)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTRequires = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTRequires(_expr: own *ASTExpression) (ret: own *ASTRequires)
{
	ret = new(ASTRequires)
	ret._expr = @_expr
	return ret
}
func (node: *ASTRequires) copy() (ret: own *ASTRequires)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTRequires)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTRequiresAll = struct {
	ASTBase
	
	_vars: own *[]string
	_expr: own *ASTExpression
}
func new_ASTRequiresAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTRequiresAll)
{
	ret = new(ASTRequiresAll)
	ret._vars = @_vars
	ret._expr = @_expr
	return ret
}
func (node: *ASTRequiresAll) copy() (ret: own *ASTRequiresAll)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTRequiresAll)
	
	ret._vars = node.copy_vars()
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
func (node: *ASTRequiresAll) copy_vars() (ret: own *[]string)
{
	
	ret = new[len(node._vars)](string)
	
	var i = 0
	while i < len(ret) {
		ret[i] = node._vars[i]
		i++
	}
	
	return
}
type ASTReturn = struct {
	ASTBase
	
	_retvals: own *[]own *ASTExpression
}
func new_ASTReturn(_retvals: own *[]own *ASTExpression) (ret: own *ASTReturn)
{
	ret = new(ASTReturn)
	ret._retvals = @_retvals
	return ret
}
func (node: *ASTReturn) copy() (ret: own *ASTReturn)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTReturn)
	
	ret._retvals = node.copy_retvals()
	
	return ret
}
func (node: *ASTReturn) copy_retvals() (ret: own *[]own *ASTExpression)
{
	
	ret = new[len(node._retvals)](own *ASTExpression)
	
	var i = 0
	while i < len(node._retvals) {
		if node._retvals[i] != null {
			ret[i] = node._retvals[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTSanityCheck = struct {
	ASTBase
	
	_expr: own *ASTExpression
}
func new_ASTSanityCheck(_expr: own *ASTExpression) (ret: own *ASTSanityCheck)
{
	ret = new(ASTSanityCheck)
	ret._expr = @_expr
	return ret
}
func (node: *ASTSanityCheck) copy() (ret: own *ASTSanityCheck)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTSanityCheck)
	
	if node._expr != null {
		ret._expr = node._expr.copy()
	}
	
	return ret
}
type ASTSelectionType = struct {
	ASTBase
	
	_types: own *[]own *ASTType
}
func new_ASTSelectionType(_types: own *[]own *ASTType) (ret: own *ASTSelectionType)
{
	ret = new(ASTSelectionType)
	ret._types = @_types
	return ret
}
func (node: *ASTSelectionType) copy() (ret: own *ASTSelectionType)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTSelectionType)
	
	ret._types = node.copy_types()
	
	return ret
}
func (node: *ASTSelectionType) copy_types() (ret: own *[]own *ASTType)
{
	
	ret = new[len(node._types)](own *ASTType)
	
	var i = 0
	while i < len(node._types) {
		if node._types[i] != null {
			ret[i] = node._types[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTSelector = struct {
	ASTBase
	
	_base: own *ASTLevel0Expression
	_selector: string
}
func new_ASTSelector(_base: own *ASTLevel0Expression, _selector: string) (ret: own *ASTSelector)
{
	ret = new(ASTSelector)
	ret._base = @_base
	ret._selector = @_selector
	return ret
}
func (node: *ASTSelector) copy() (ret: own *ASTSelector)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTSelector)
	
	if node._base != null {
		ret._base = node._base.copy()
	}
	ret._selector = node._selector
	
	return ret
}
type ASTStatement = Vardecl | VardeclTyped | While | Return | Break | Continue | Block | If | Assignment | Increment | Decrement | Delete | Expression | Switch | TypeSwitch | Assert | AssertAll | Assume | Fail | SanityCheck | FailRecover
type ASTString = struct {
	ASTBase
	
	_str: string
}
func new_ASTString(_str: string) (ret: own *ASTString)
{
	ret = new(ASTString)
	ret._str = @_str
	return ret
}
func (node: *ASTString) copy() (ret: own *ASTString)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTString)
	
	ret._str = node._str
	
	return ret
}
type ASTStructMember = struct {
	ASTBase
	
	_name: own *string
	_type: own *ASTType
}
func new_ASTStructMember(_name: own *string, _type: own *ASTType) (ret: own *ASTStructMember)
{
	ret = new(ASTStructMember)
	ret._name = @_name
	ret._type = @_type
	return ret
}
func (node: *ASTStructMember) copy() (ret: own *ASTStructMember)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTStructMember)
	
	ret._name = new(string)
	*ret._name = *node._name
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
type ASTStructType = struct {
	ASTBase
	
	_members: own *[]own *ASTStructMember
}
func new_ASTStructType(_members: own *[]own *ASTStructMember) (ret: own *ASTStructType)
{
	ret = new(ASTStructType)
	ret._members = @_members
	return ret
}
func (node: *ASTStructType) copy() (ret: own *ASTStructType)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTStructType)
	
	ret._members = node.copy_members()
	
	return ret
}
func (node: *ASTStructType) copy_members() (ret: own *[]own *ASTStructMember)
{
	
	ret = new[len(node._members)](own *ASTStructMember)
	
	var i = 0
	while i < len(node._members) {
		if node._members[i] != null {
			ret[i] = node._members[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTSwitch = struct {
	ASTBase
	
	_discriminant: own *ASTExpression
	_cases: own *[]own *ASTSwitchCase
	_default: own *ASTDefaultCase
}
func new_ASTSwitch(_discriminant: own *ASTExpression, _cases: own *[]own *ASTSwitchCase, _default: own *ASTDefaultCase) (ret: own *ASTSwitch)
{
	ret = new(ASTSwitch)
	ret._discriminant = @_discriminant
	ret._cases = @_cases
	ret._default = @_default
	return ret
}
func (node: *ASTSwitch) copy() (ret: own *ASTSwitch)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTSwitch)
	
	if node._discriminant != null {
		ret._discriminant = node._discriminant.copy()
	}
	ret._cases = node.copy_cases()
	if node._default != null {
		ret._default = node._default.copy()
	}
	
	return ret
}
func (node: *ASTSwitch) copy_cases() (ret: own *[]own *ASTSwitchCase)
{
	
	ret = new[len(node._cases)](own *ASTSwitchCase)
	
	var i = 0
	while i < len(node._cases) {
		if node._cases[i] != null {
			ret[i] = node._cases[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTSwitchCase = struct {
	ASTBase
	
	_matches: own *[]own *ASTExpression
	_body: own *ASTBlock
}
func new_ASTSwitchCase(_matches: own *[]own *ASTExpression, _body: own *ASTBlock) (ret: own *ASTSwitchCase)
{
	ret = new(ASTSwitchCase)
	ret._matches = @_matches
	ret._body = @_body
	return ret
}
func (node: *ASTSwitchCase) copy() (ret: own *ASTSwitchCase)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTSwitchCase)
	
	ret._matches = node.copy_matches()
	if node._body != null {
		ret._body = node._body.copy()
	}
	
	return ret
}
func (node: *ASTSwitchCase) copy_matches() (ret: own *[]own *ASTExpression)
{
	
	ret = new[len(node._matches)](own *ASTExpression)
	
	var i = 0
	while i < len(node._matches) {
		if node._matches[i] != null {
			ret[i] = node._matches[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTTake = struct {
	ASTBase
	
	_arg: own *ASTLevel1Expression
}
func new_ASTTake(_arg: own *ASTLevel1Expression) (ret: own *ASTTake)
{
	ret = new(ASTTake)
	ret._arg = @_arg
	return ret
}
func (node: *ASTTake) copy() (ret: own *ASTTake)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTTake)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTType = TypeRef | RangeType | ArrayType | PointerType
type ASTTypeRef = struct {
	ASTBase
	
	_package: own *string
	_name: string
}
func new_ASTTypeRef(_package: own *string, _name: string) (ret: own *ASTTypeRef)
{
	ret = new(ASTTypeRef)
	ret._package = @_package
	ret._name = @_name
	return ret
}
func (node: *ASTTypeRef) copy() (ret: own *ASTTypeRef)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTTypeRef)
	
	ret._package = new(string)
	*ret._package = *node._package
	ret._name = node._name
	
	return ret
}
type ASTTypeSwitch = struct {
	ASTBase
	
	_discriminant: own *ASTExpression
	_cases: own *[]own *ASTTypeSwitchCase
	_default: own *ASTDefaultCase
}
func new_ASTTypeSwitch(_discriminant: own *ASTExpression, _cases: own *[]own *ASTTypeSwitchCase, _default: own *ASTDefaultCase) (ret: own *ASTTypeSwitch)
{
	ret = new(ASTTypeSwitch)
	ret._discriminant = @_discriminant
	ret._cases = @_cases
	ret._default = @_default
	return ret
}
func (node: *ASTTypeSwitch) copy() (ret: own *ASTTypeSwitch)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTTypeSwitch)
	
	if node._discriminant != null {
		ret._discriminant = node._discriminant.copy()
	}
	ret._cases = node.copy_cases()
	if node._default != null {
		ret._default = node._default.copy()
	}
	
	return ret
}
func (node: *ASTTypeSwitch) copy_cases() (ret: own *[]own *ASTTypeSwitchCase)
{
	
	ret = new[len(node._cases)](own *ASTTypeSwitchCase)
	
	var i = 0
	while i < len(node._cases) {
		if node._cases[i] != null {
			ret[i] = node._cases[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTTypeSwitchCase = struct {
	ASTBase
	
	_types: own *[]own *ASTType
	_body: own *ASTBlock
}
func new_ASTTypeSwitchCase(_types: own *[]own *ASTType, _body: own *ASTBlock) (ret: own *ASTTypeSwitchCase)
{
	ret = new(ASTTypeSwitchCase)
	ret._types = @_types
	ret._body = @_body
	return ret
}
func (node: *ASTTypeSwitchCase) copy() (ret: own *ASTTypeSwitchCase)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTTypeSwitchCase)
	
	ret._types = node.copy_types()
	if node._body != null {
		ret._body = node._body.copy()
	}
	
	return ret
}
func (node: *ASTTypeSwitchCase) copy_types() (ret: own *[]own *ASTType)
{
	
	ret = new[len(node._types)](own *ASTType)
	
	var i = 0
	while i < len(node._types) {
		if node._types[i] != null {
			ret[i] = node._types[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTTypedef = struct {
	ASTBase
	
	_name: string
	_type: own *ASTNamedType
}
func new_ASTTypedef(_name: string, _type: own *ASTNamedType) (ret: own *ASTTypedef)
{
	ret = new(ASTTypedef)
	ret._name = @_name
	ret._type = @_type
	return ret
}
func (node: *ASTTypedef) copy() (ret: own *ASTTypedef)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTTypedef)
	
	ret._name = node._name
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
type ASTUnaryMinus = struct {
	ASTBase
	
	_arg: own *ASTLevel1Expression
}
func new_ASTUnaryMinus(_arg: own *ASTLevel1Expression) (ret: own *ASTUnaryMinus)
{
	ret = new(ASTUnaryMinus)
	ret._arg = @_arg
	return ret
}
func (node: *ASTUnaryMinus) copy() (ret: own *ASTUnaryMinus)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTUnaryMinus)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTUnaryPlus = struct {
	ASTBase
	
	_arg: own *ASTLevel1Expression
}
func new_ASTUnaryPlus(_arg: own *ASTLevel1Expression) (ret: own *ASTUnaryPlus)
{
	ret = new(ASTUnaryPlus)
	ret._arg = @_arg
	return ret
}
func (node: *ASTUnaryPlus) copy() (ret: own *ASTUnaryPlus)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTUnaryPlus)
	
	if node._arg != null {
		ret._arg = node._arg.copy()
	}
	
	return ret
}
type ASTVardecl = struct {
	ASTBase
	
	_name: string
	_initializer: own *ASTExpression
}
func new_ASTVardecl(_name: string, _initializer: own *ASTExpression) (ret: own *ASTVardecl)
{
	ret = new(ASTVardecl)
	ret._name = @_name
	ret._initializer = @_initializer
	return ret
}
func (node: *ASTVardecl) copy() (ret: own *ASTVardecl)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTVardecl)
	
	ret._name = node._name
	if node._initializer != null {
		ret._initializer = node._initializer.copy()
	}
	
	return ret
}
type ASTVardeclTyped = struct {
	ASTBase
	
	_names: own *[]string
	_type: own *ASTType
}
func new_ASTVardeclTyped(_names: own *[]string, _type: own *ASTType) (ret: own *ASTVardeclTyped)
{
	ret = new(ASTVardeclTyped)
	ret._names = @_names
	ret._type = @_type
	return ret
}
func (node: *ASTVardeclTyped) copy() (ret: own *ASTVardeclTyped)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTVardeclTyped)
	
	ret._names = node.copy_names()
	if node._type != null {
		ret._type = node._type.copy()
	}
	
	return ret
}
func (node: *ASTVardeclTyped) copy_names() (ret: own *[]string)
{
	
	ret = new[len(node._names)](string)
	
	var i = 0
	while i < len(ret) {
		ret[i] = node._names[i]
		i++
	}
	
	return
}
type ASTWhile = struct {
	ASTBase
	
	_label: own *string
	_condition: own *ASTExpression
	_contracts: own *[]own *ASTWhileContract
	_body: own *ASTBlock
}
func new_ASTWhile(_label: own *string, _condition: own *ASTExpression, _contracts: own *[]own *ASTWhileContract, _body: own *ASTBlock) (ret: own *ASTWhile)
{
	ret = new(ASTWhile)
	ret._label = @_label
	ret._condition = @_condition
	ret._contracts = @_contracts
	ret._body = @_body
	return ret
}
func (node: *ASTWhile) copy() (ret: own *ASTWhile)
{
	
	if node == null {
		return null
	}
	
	ret = new(ASTWhile)
	
	ret._label = new(string)
	*ret._label = *node._label
	if node._condition != null {
		ret._condition = node._condition.copy()
	}
	ret._contracts = node.copy_contracts()
	if node._body != null {
		ret._body = node._body.copy()
	}
	
	return ret
}
func (node: *ASTWhile) copy_contracts() (ret: own *[]own *ASTWhileContract)
{
	
	ret = new[len(node._contracts)](own *ASTWhileContract)
	
	var i = 0
	while i < len(node._contracts) {
		if node._contracts[i] != null {
			ret[i] = node._contracts[i].copy()
		}
		i++
	}
	
	
	return
}
type ASTWhileContract = Invariant | InvariantAll | LoopBound
