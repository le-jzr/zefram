type ASTSelectionType = struct {
	ASTBase
	__types: own *[]own *ASTType
}

func new_ASTSelectionType(_types: own *[]own *ASTType) (ret: own *ASTSelectionType)
{
	ret = new(ASTSelectionType)
	ret.__types = @_types
	return
}

func (ast: *ASTSelectionType) copy() (ret: own *ASTSelectionType)
{
	ret = new(ASTSelectionType)
	ret.__types = ast.copy_types()
	return
}

func (ast: *ASTSelectionType) copy_types() (ret: own *[]own *ASTType)
{
	ret = new[len(ast.__types)](own *ASTType)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__types[i].copy()
		i++
	}
	return
}

type ASTAssume = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTAssume(_expr: own *ASTExpression) (ret: own *ASTAssume)
{
	ret = new(ASTAssume)
	ret.__expr = @_expr
	return
}

func (ast: *ASTAssume) copy() (ret: own *ASTAssume)
{
	ret = new(ASTAssume)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTExpression = ASTOr | ASTAnd | ASTLess | ASTLessEq | ASTGreater | ASTGreaterEq | ASTEqual | ASTInequal | ASTIs | ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTTypedef = struct {
	ASTBase
	__name: string
	__type: own *ASTNamedType
}

func new_ASTTypedef(_name: string, _type: own *ASTNamedType) (ret: own *ASTTypedef)
{
	ret = new(ASTTypedef)
	ret.__name = _name
	ret.__type = @_type
	return
}

func (ast: *ASTTypedef) copy() (ret: own *ASTTypedef)
{
	ret = new(ASTTypedef)
	ret.__name = ast.__name
	ret.__type = ast.__type.copy()
	return
}

type ASTRecursionBound = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTRecursionBound(_expr: own *ASTExpression) (ret: own *ASTRecursionBound)
{
	ret = new(ASTRecursionBound)
	ret.__expr = @_expr
	return
}

func (ast: *ASTRecursionBound) copy() (ret: own *ASTRecursionBound)
{
	ret = new(ASTRecursionBound)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTTypeSwitchCase = struct {
	ASTBase
	__types: own *[]own *ASTType
	__body: own *ASTBlock
}

func new_ASTTypeSwitchCase(_types: own *[]own *ASTType, _body: own *ASTBlock) (ret: own *ASTTypeSwitchCase)
{
	ret = new(ASTTypeSwitchCase)
	ret.__types = @_types
	ret.__body = @_body
	return
}

func (ast: *ASTTypeSwitchCase) copy() (ret: own *ASTTypeSwitchCase)
{
	ret = new(ASTTypeSwitchCase)
	ret.__types = ast.copy_types()
	ret.__body = ast.__body.copy()
	return
}

func (ast: *ASTTypeSwitchCase) copy_types() (ret: own *[]own *ASTType)
{
	ret = new[len(ast.__types)](own *ASTType)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__types[i].copy()
		i++
	}
	return
}

type ASTLevel0Expression = ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTBitXor = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel2Expression
}

func new_ASTBitXor(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBitXor)
{
	ret = new(ASTBitXor)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTBitXor) copy() (ret: own *ASTBitXor)
{
	ret = new(ASTBitXor)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTDeref = struct {
	ASTBase
	__arg: own *ASTLevel1Expression
}

func new_ASTDeref(_arg: own *ASTLevel1Expression) (ret: own *ASTDeref)
{
	ret = new(ASTDeref)
	ret.__arg = @_arg
	return
}

func (ast: *ASTDeref) copy() (ret: own *ASTDeref)
{
	ret = new(ASTDeref)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTIndexed = struct {
	ASTBase
	__base: own *ASTLevel0Expression
	__index: own *ASTExpression
}

func new_ASTIndexed(_base: own *ASTLevel0Expression, _index: own *ASTExpression) (ret: own *ASTIndexed)
{
	ret = new(ASTIndexed)
	ret.__base = @_base
	ret.__index = @_index
	return
}

func (ast: *ASTIndexed) copy() (ret: own *ASTIndexed)
{
	ret = new(ASTIndexed)
	ret.__base = ast.__base.copy()
	ret.__index = ast.__index.copy()
	return
}

type ASTNamedType = ASTStructType | ASTInterfaceType | ASTSelectionType

type ASTLevel3Expression = ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTBitOr = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel2Expression
}

func new_ASTBitOr(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBitOr)
{
	ret = new(ASTBitOr)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTBitOr) copy() (ret: own *ASTBitOr)
{
	ret = new(ASTBitOr)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTRShift = struct {
	ASTBase
	__left: own *ASTLevel2Expression
	__right: own *ASTLevel1Expression
}

func new_ASTRShift(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTRShift)
{
	ret = new(ASTRShift)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTRShift) copy() (ret: own *ASTRShift)
{
	ret = new(ASTRShift)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTGlobal = ASTMethod | ASTTypedef

type ASTStructMember = struct {
	ASTBase
	__name: own ?string
	__type: own *ASTType
}

func new_ASTStructMember(_name: own ?string, _type: own *ASTType) (ret: own *ASTStructMember)
{
	ret = new(ASTStructMember)
	ret.__name = @_name
	ret.__type = @_type
	return
}

func (ast: *ASTStructMember) copy() (ret: own *ASTStructMember)
{
	ret = new(ASTStructMember)
	if ast.__name == null {
		ret.__name = null
	} else {
		ret.__name = new(string)
		*ret.__name = *ast.__name
	}
	ret.__type = ast.__type.copy()
	return
}

type ASTInterfaceType = struct {
	ASTBase
	__members: own *[]own *ASTInterfaceMember
}

func new_ASTInterfaceType(_members: own *[]own *ASTInterfaceMember) (ret: own *ASTInterfaceType)
{
	ret = new(ASTInterfaceType)
	ret.__members = @_members
	return
}

func (ast: *ASTInterfaceType) copy() (ret: own *ASTInterfaceType)
{
	ret = new(ASTInterfaceType)
	ret.__members = ast.copy_members()
	return
}

func (ast: *ASTInterfaceType) copy_members() (ret: own *[]own *ASTInterfaceMember)
{
	ret = new[len(ast.__members)](own *ASTInterfaceMember)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__members[i].copy()
		i++
	}
	return
}

type ASTWhileContract = ASTInvariant | ASTInvariantAll | ASTLoopBound

type ASTDiv = struct {
	ASTBase
	__left: own *ASTLevel2Expression
	__right: own *ASTLevel1Expression
}

func new_ASTDiv(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTDiv)
{
	ret = new(ASTDiv)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTDiv) copy() (ret: own *ASTDiv)
{
	ret = new(ASTDiv)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTRequires = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTRequires(_expr: own *ASTExpression) (ret: own *ASTRequires)
{
	ret = new(ASTRequires)
	ret.__expr = @_expr
	return
}

func (ast: *ASTRequires) copy() (ret: own *ASTRequires)
{
	ret = new(ASTRequires)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTFail = struct {
	ASTBase
	__code: string
	__description: own ?string
}

func new_ASTFail(_code: string, _description: own ?string) (ret: own *ASTFail)
{
	ret = new(ASTFail)
	ret.__code = _code
	ret.__description = @_description
	return
}

func (ast: *ASTFail) copy() (ret: own *ASTFail)
{
	ret = new(ASTFail)
	ret.__code = ast.__code
	if ast.__description == null {
		ret.__description = null
	} else {
		ret.__description = new(string)
		*ret.__description = *ast.__description
	}
	return
}

type ASTGreaterEq = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel3Expression
}

func new_ASTGreaterEq(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTGreaterEq)
{
	ret = new(ASTGreaterEq)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTGreaterEq) copy() (ret: own *ASTGreaterEq)
{
	ret = new(ASTGreaterEq)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTBinaryPlus = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel2Expression
}

func new_ASTBinaryPlus(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBinaryPlus)
{
	ret = new(ASTBinaryPlus)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTBinaryPlus) copy() (ret: own *ASTBinaryPlus)
{
	ret = new(ASTBinaryPlus)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTDefaultCase = struct {
	ASTBase
	__body: own *ASTBlock
}

func new_ASTDefaultCase(_body: own *ASTBlock) (ret: own *ASTDefaultCase)
{
	ret = new(ASTDefaultCase)
	ret.__body = @_body
	return
}

func (ast: *ASTDefaultCase) copy() (ret: own *ASTDefaultCase)
{
	ret = new(ASTDefaultCase)
	ret.__body = ast.__body.copy()
	return
}

type ASTMethodCall = struct {
	ASTBase
	__receiver: own ?ASTLevel0Expression
	__method: string
	__args: own *[]own *ASTExpression
}

func new_ASTMethodCall(_receiver: own ?ASTLevel0Expression, _method: string, _args: own *[]own *ASTExpression) (ret: own *ASTMethodCall)
{
	ret = new(ASTMethodCall)
	ret.__receiver = @_receiver
	ret.__method = _method
	ret.__args = @_args
	return
}

func (ast: *ASTMethodCall) copy() (ret: own *ASTMethodCall)
{
	ret = new(ASTMethodCall)
	if ast.__receiver == null {
		ret.__receiver = null
	} else {
		ret.__receiver = ast.__receiver.copy()
	}
	ret.__method = ast.__method
	ret.__args = ast.copy_args()
	return
}

func (ast: *ASTMethodCall) copy_args() (ret: own *[]own *ASTExpression)
{
	ret = new[len(ast.__args)](own *ASTExpression)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__args[i].copy()
		i++
	}
	return
}

type ASTAssert = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTAssert(_expr: own *ASTExpression) (ret: own *ASTAssert)
{
	ret = new(ASTAssert)
	ret.__expr = @_expr
	return
}

func (ast: *ASTAssert) copy() (ret: own *ASTAssert)
{
	ret = new(ASTAssert)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTNew = struct {
	ASTBase
	__type: own *ASTType
}

func new_ASTNew(_type: own *ASTType) (ret: own *ASTNew)
{
	ret = new(ASTNew)
	ret.__type = @_type
	return
}

func (ast: *ASTNew) copy() (ret: own *ASTNew)
{
	ret = new(ASTNew)
	ret.__type = ast.__type.copy()
	return
}

type ASTIdentifier = struct {
	ASTBase
	__ident: string
}

func new_ASTIdentifier(_ident: string) (ret: own *ASTIdentifier)
{
	ret = new(ASTIdentifier)
	ret.__ident = _ident
	return
}

func (ast: *ASTIdentifier) copy() (ret: own *ASTIdentifier)
{
	ret = new(ASTIdentifier)
	ret.__ident = ast.__ident
	return
}

type ASTBinaryMinus = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel2Expression
}

func new_ASTBinaryMinus(_left: own *ASTLevel3Expression, _right: own *ASTLevel2Expression) (ret: own *ASTBinaryMinus)
{
	ret = new(ASTBinaryMinus)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTBinaryMinus) copy() (ret: own *ASTBinaryMinus)
{
	ret = new(ASTBinaryMinus)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTSwitchCase = struct {
	ASTBase
	__matches: own *[]own *ASTExpression
	__body: own *ASTBlock
}

func new_ASTSwitchCase(_matches: own *[]own *ASTExpression, _body: own *ASTBlock) (ret: own *ASTSwitchCase)
{
	ret = new(ASTSwitchCase)
	ret.__matches = @_matches
	ret.__body = @_body
	return
}

func (ast: *ASTSwitchCase) copy() (ret: own *ASTSwitchCase)
{
	ret = new(ASTSwitchCase)
	ret.__matches = ast.copy_matches()
	ret.__body = ast.__body.copy()
	return
}

func (ast: *ASTSwitchCase) copy_matches() (ret: own *[]own *ASTExpression)
{
	ret = new[len(ast.__matches)](own *ASTExpression)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__matches[i].copy()
		i++
	}
	return
}

type ASTRangeType = struct {
	ASTBase
	__low: own *ASTExpression
	__high: own *ASTExpression
}

func new_ASTRangeType(_low: own *ASTExpression, _high: own *ASTExpression) (ret: own *ASTRangeType)
{
	ret = new(ASTRangeType)
	ret.__low = @_low
	ret.__high = @_high
	return
}

func (ast: *ASTRangeType) copy() (ret: own *ASTRangeType)
{
	ret = new(ASTRangeType)
	ret.__low = ast.__low.copy()
	ret.__high = ast.__high.copy()
	return
}

type ASTStructType = struct {
	ASTBase
	__members: own *[]own *ASTStructMember
}

func new_ASTStructType(_members: own *[]own *ASTStructMember) (ret: own *ASTStructType)
{
	ret = new(ASTStructType)
	ret.__members = @_members
	return
}

func (ast: *ASTStructType) copy() (ret: own *ASTStructType)
{
	ret = new(ASTStructType)
	ret.__members = ast.copy_members()
	return
}

func (ast: *ASTStructType) copy_members() (ret: own *[]own *ASTStructMember)
{
	ret = new[len(ast.__members)](own *ASTStructMember)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__members[i].copy()
		i++
	}
	return
}

type ASTMethod = struct {
	ASTBase
	__receiver: own ?ASTParameter
	__name: string
	__signature: own *ASTMethodSignature
	__contracts: own *[]own *ASTMethodContract
	__body: own *ASTBlock
}

func new_ASTMethod(_receiver: own ?ASTParameter, _name: string, _signature: own *ASTMethodSignature, _contracts: own *[]own *ASTMethodContract, _body: own *ASTBlock) (ret: own *ASTMethod)
{
	ret = new(ASTMethod)
	ret.__receiver = @_receiver
	ret.__name = _name
	ret.__signature = @_signature
	ret.__contracts = @_contracts
	ret.__body = @_body
	return
}

func (ast: *ASTMethod) copy() (ret: own *ASTMethod)
{
	ret = new(ASTMethod)
	if ast.__receiver == null {
		ret.__receiver = null
	} else {
		ret.__receiver = ast.__receiver.copy()
	}
	ret.__name = ast.__name
	ret.__signature = ast.__signature.copy()
	ret.__contracts = ast.copy_contracts()
	ret.__body = ast.__body.copy()
	return
}

func (ast: *ASTMethod) copy_contracts() (ret: own *[]own *ASTMethodContract)
{
	ret = new[len(ast.__contracts)](own *ASTMethodContract)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__contracts[i].copy()
		i++
	}
	return
}

type ASTLess = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel3Expression
}

func new_ASTLess(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTLess)
{
	ret = new(ASTLess)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTLess) copy() (ret: own *ASTLess)
{
	ret = new(ASTLess)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTInequal = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel3Expression
}

func new_ASTInequal(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTInequal)
{
	ret = new(ASTInequal)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTInequal) copy() (ret: own *ASTInequal)
{
	ret = new(ASTInequal)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTString = struct {
	ASTBase
	__str: string
}

func new_ASTString(_str: string) (ret: own *ASTString)
{
	ret = new(ASTString)
	ret.__str = _str
	return
}

func (ast: *ASTString) copy() (ret: own *ASTString)
{
	ret = new(ASTString)
	ret.__str = ast.__str
	return
}

type ASTLevel2Expression = ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTNewArray = struct {
	ASTBase
	__length: own *ASTExpression
	__type: own *ASTType
}

func new_ASTNewArray(_length: own *ASTExpression, _type: own *ASTType) (ret: own *ASTNewArray)
{
	ret = new(ASTNewArray)
	ret.__length = @_length
	ret.__type = @_type
	return
}

func (ast: *ASTNewArray) copy() (ret: own *ASTNewArray)
{
	ret = new(ASTNewArray)
	ret.__length = ast.__length.copy()
	ret.__type = ast.__type.copy()
	return
}

type ASTVardeclTyped = struct {
	ASTBase
	__names: own *[]string
	__type: own *ASTType
}

func new_ASTVardeclTyped(_names: own *[]string, _type: own *ASTType) (ret: own *ASTVardeclTyped)
{
	ret = new(ASTVardeclTyped)
	ret.__names = @_names
	ret.__type = @_type
	return
}

func (ast: *ASTVardeclTyped) copy() (ret: own *ASTVardeclTyped)
{
	ret = new(ASTVardeclTyped)
	ret.__names = ast.copy_names()
	ret.__type = ast.__type.copy()
	return
}

func (ast: *ASTVardeclTyped) copy_names() (ret: own *[]string)
{
	ret = new[len(ast.__names)](string)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__names[i]
		i++
	}
	return
}

type ASTIf = struct {
	ASTBase
	__condition: own *ASTExpression
	__true_branch: own *ASTBlock
	__false_branch: own ?ASTElseBranch
}

func new_ASTIf(_condition: own *ASTExpression, _true_branch: own *ASTBlock, _false_branch: own ?ASTElseBranch) (ret: own *ASTIf)
{
	ret = new(ASTIf)
	ret.__condition = @_condition
	ret.__true_branch = @_true_branch
	ret.__false_branch = @_false_branch
	return
}

func (ast: *ASTIf) copy() (ret: own *ASTIf)
{
	ret = new(ASTIf)
	ret.__condition = ast.__condition.copy()
	ret.__true_branch = ast.__true_branch.copy()
	if ast.__false_branch == null {
		ret.__false_branch = null
	} else {
		ret.__false_branch = ast.__false_branch.copy()
	}
	return
}

type ASTInvariant = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTInvariant(_expr: own *ASTExpression) (ret: own *ASTInvariant)
{
	ret = new(ASTInvariant)
	ret.__expr = @_expr
	return
}

func (ast: *ASTInvariant) copy() (ret: own *ASTInvariant)
{
	ret = new(ASTInvariant)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTLevel4Expression = ASTLess | ASTLessEq | ASTGreater | ASTGreaterEq | ASTEqual | ASTInequal | ASTIs | ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTBitAnd = struct {
	ASTBase
	__left: own *ASTLevel2Expression
	__right: own *ASTLevel1Expression
}

func new_ASTBitAnd(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTBitAnd)
{
	ret = new(ASTBitAnd)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTBitAnd) copy() (ret: own *ASTBitAnd)
{
	ret = new(ASTBitAnd)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTBlock = struct {
	ASTBase
	__statements: own *[]own *ASTStatement
}

func new_ASTBlock(_statements: own *[]own *ASTStatement) (ret: own *ASTBlock)
{
	ret = new(ASTBlock)
	ret.__statements = @_statements
	return
}

func (ast: *ASTBlock) copy() (ret: own *ASTBlock)
{
	ret = new(ASTBlock)
	ret.__statements = ast.copy_statements()
	return
}

func (ast: *ASTBlock) copy_statements() (ret: own *[]own *ASTStatement)
{
	ret = new[len(ast.__statements)](own *ASTStatement)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__statements[i].copy()
		i++
	}
	return
}

type ASTVardecl = struct {
	ASTBase
	__name: string
	__initializer: own ?ASTExpression
}

func new_ASTVardecl(_name: string, _initializer: own ?ASTExpression) (ret: own *ASTVardecl)
{
	ret = new(ASTVardecl)
	ret.__name = _name
	ret.__initializer = @_initializer
	return
}

func (ast: *ASTVardecl) copy() (ret: own *ASTVardecl)
{
	ret = new(ASTVardecl)
	ret.__name = ast.__name
	if ast.__initializer == null {
		ret.__initializer = null
	} else {
		ret.__initializer = ast.__initializer.copy()
	}
	return
}

type ASTNot = struct {
	ASTBase
	__arg: own *ASTLevel1Expression
}

func new_ASTNot(_arg: own *ASTLevel1Expression) (ret: own *ASTNot)
{
	ret = new(ASTNot)
	ret.__arg = @_arg
	return
}

func (ast: *ASTNot) copy() (ret: own *ASTNot)
{
	ret = new(ASTNot)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTGreater = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel3Expression
}

func new_ASTGreater(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTGreater)
{
	ret = new(ASTGreater)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTGreater) copy() (ret: own *ASTGreater)
{
	ret = new(ASTGreater)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTLevel1Expression = ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTLiteral = ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTEnsures = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTEnsures(_expr: own *ASTExpression) (ret: own *ASTEnsures)
{
	ret = new(ASTEnsures)
	ret.__expr = @_expr
	return
}

func (ast: *ASTEnsures) copy() (ret: own *ASTEnsures)
{
	ret = new(ASTEnsures)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTParameter = struct {
	ASTBase
	__name: own ?string
	__type: own *ASTType
}

func new_ASTParameter(_name: own ?string, _type: own *ASTType) (ret: own *ASTParameter)
{
	ret = new(ASTParameter)
	ret.__name = @_name
	ret.__type = @_type
	return
}

func (ast: *ASTParameter) copy() (ret: own *ASTParameter)
{
	ret = new(ASTParameter)
	if ast.__name == null {
		ret.__name = null
	} else {
		ret.__name = new(string)
		*ret.__name = *ast.__name
	}
	ret.__type = ast.__type.copy()
	return
}

type ASTInvariantAll = struct {
	ASTBase
	__vars: own *[]string
	__expr: own *ASTExpression
}

func new_ASTInvariantAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTInvariantAll)
{
	ret = new(ASTInvariantAll)
	ret.__vars = @_vars
	ret.__expr = @_expr
	return
}

func (ast: *ASTInvariantAll) copy() (ret: own *ASTInvariantAll)
{
	ret = new(ASTInvariantAll)
	ret.__vars = ast.copy_vars()
	ret.__expr = ast.__expr.copy()
	return
}

func (ast: *ASTInvariantAll) copy_vars() (ret: own *[]string)
{
	ret = new[len(ast.__vars)](string)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__vars[i]
		i++
	}
	return
}

type ASTDecimal = struct {
	ASTBase
	__str: string
}

func new_ASTDecimal(_str: string) (ret: own *ASTDecimal)
{
	ret = new(ASTDecimal)
	ret.__str = _str
	return
}

func (ast: *ASTDecimal) copy() (ret: own *ASTDecimal)
{
	ret = new(ASTDecimal)
	ret.__str = ast.__str
	return
}

type ASTOctal = struct {
	ASTBase
	__str: string
}

func new_ASTOctal(_str: string) (ret: own *ASTOctal)
{
	ret = new(ASTOctal)
	ret.__str = _str
	return
}

func (ast: *ASTOctal) copy() (ret: own *ASTOctal)
{
	ret = new(ASTOctal)
	ret.__str = ast.__str
	return
}

type ASTLShift = struct {
	ASTBase
	__left: own *ASTLevel2Expression
	__right: own *ASTLevel1Expression
}

func new_ASTLShift(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTLShift)
{
	ret = new(ASTLShift)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTLShift) copy() (ret: own *ASTLShift)
{
	ret = new(ASTLShift)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTRef = struct {
	ASTBase
	__arg: own *ASTLevel1Expression
}

func new_ASTRef(_arg: own *ASTLevel1Expression) (ret: own *ASTRef)
{
	ret = new(ASTRef)
	ret.__arg = @_arg
	return
}

func (ast: *ASTRef) copy() (ret: own *ASTRef)
{
	ret = new(ASTRef)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTStatement = ASTVardecl | ASTVardeclTyped | ASTWhile | ASTReturn | ASTBreak | ASTContinue | ASTBlock | ASTIf | ASTAssignment | ASTIncrement | ASTDecrement | ASTDelete | ASTSwitch | ASTTypeSwitch | ASTAssert | ASTAssertAll | ASTAssume | ASTFail | ASTSanityCheck | ASTFailRecover | ASTOr | ASTAnd | ASTLess | ASTLessEq | ASTGreater | ASTGreaterEq | ASTEqual | ASTInequal | ASTIs | ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTContinue = struct {
	ASTBase
	__label: own ?string
}

func new_ASTContinue(_label: own ?string) (ret: own *ASTContinue)
{
	ret = new(ASTContinue)
	ret.__label = @_label
	return
}

func (ast: *ASTContinue) copy() (ret: own *ASTContinue)
{
	ret = new(ASTContinue)
	if ast.__label == null {
		ret.__label = null
	} else {
		ret.__label = new(string)
		*ret.__label = *ast.__label
	}
	return
}

type ASTAssignment = struct {
	ASTBase
	__rvalues: own *[]own *ASTExpression
	__lvalues: own *[]own *ASTExpression
}

func new_ASTAssignment(_rvalues: own *[]own *ASTExpression, _lvalues: own *[]own *ASTExpression) (ret: own *ASTAssignment)
{
	ret = new(ASTAssignment)
	ret.__rvalues = @_rvalues
	ret.__lvalues = @_lvalues
	return
}

func (ast: *ASTAssignment) copy() (ret: own *ASTAssignment)
{
	ret = new(ASTAssignment)
	ret.__rvalues = ast.copy_rvalues()
	ret.__lvalues = ast.copy_lvalues()
	return
}

func (ast: *ASTAssignment) copy_rvalues() (ret: own *[]own *ASTExpression)
{
	ret = new[len(ast.__rvalues)](own *ASTExpression)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__rvalues[i].copy()
		i++
	}
	return
}

func (ast: *ASTAssignment) copy_lvalues() (ret: own *[]own *ASTExpression)
{
	ret = new[len(ast.__lvalues)](own *ASTExpression)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__lvalues[i].copy()
		i++
	}
	return
}

type ASTIncrement = struct {
	ASTBase
	__lvalue: own *ASTExpression
}

func new_ASTIncrement(_lvalue: own *ASTExpression) (ret: own *ASTIncrement)
{
	ret = new(ASTIncrement)
	ret.__lvalue = @_lvalue
	return
}

func (ast: *ASTIncrement) copy() (ret: own *ASTIncrement)
{
	ret = new(ASTIncrement)
	ret.__lvalue = ast.__lvalue.copy()
	return
}

type ASTReturn = struct {
	ASTBase
	__retvals: own *[]own *ASTExpression
}

func new_ASTReturn(_retvals: own *[]own *ASTExpression) (ret: own *ASTReturn)
{
	ret = new(ASTReturn)
	ret.__retvals = @_retvals
	return
}

func (ast: *ASTReturn) copy() (ret: own *ASTReturn)
{
	ret = new(ASTReturn)
	ret.__retvals = ast.copy_retvals()
	return
}

func (ast: *ASTReturn) copy_retvals() (ret: own *[]own *ASTExpression)
{
	ret = new[len(ast.__retvals)](own *ASTExpression)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__retvals[i].copy()
		i++
	}
	return
}

type ASTUnaryPlus = struct {
	ASTBase
	__arg: own *ASTLevel1Expression
}

func new_ASTUnaryPlus(_arg: own *ASTLevel1Expression) (ret: own *ASTUnaryPlus)
{
	ret = new(ASTUnaryPlus)
	ret.__arg = @_arg
	return
}

func (ast: *ASTUnaryPlus) copy() (ret: own *ASTUnaryPlus)
{
	ret = new(ASTUnaryPlus)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTMethodContract = ASTRequires | ASTRequiresAll | ASTEnsures | ASTEnsuresAll | ASTMayFail | ASTRecursionBound

type ASTTypeSwitch = struct {
	ASTBase
	__discriminant: own *ASTExpression
	__cases: own *[]own *ASTTypeSwitchCase
	__default: own ?ASTDefaultCase
}

func new_ASTTypeSwitch(_discriminant: own *ASTExpression, _cases: own *[]own *ASTTypeSwitchCase, _default: own ?ASTDefaultCase) (ret: own *ASTTypeSwitch)
{
	ret = new(ASTTypeSwitch)
	ret.__discriminant = @_discriminant
	ret.__cases = @_cases
	ret.__default = @_default
	return
}

func (ast: *ASTTypeSwitch) copy() (ret: own *ASTTypeSwitch)
{
	ret = new(ASTTypeSwitch)
	ret.__discriminant = ast.__discriminant.copy()
	ret.__cases = ast.copy_cases()
	if ast.__default == null {
		ret.__default = null
	} else {
		ret.__default = ast.__default.copy()
	}
	return
}

func (ast: *ASTTypeSwitch) copy_cases() (ret: own *[]own *ASTTypeSwitchCase)
{
	ret = new[len(ast.__cases)](own *ASTTypeSwitchCase)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__cases[i].copy()
		i++
	}
	return
}

type ASTChar = struct {
	ASTBase
	__str: string
}

func new_ASTChar(_str: string) (ret: own *ASTChar)
{
	ret = new(ASTChar)
	ret.__str = _str
	return
}

func (ast: *ASTChar) copy() (ret: own *ASTChar)
{
	ret = new(ASTChar)
	ret.__str = ast.__str
	return
}

type ASTUnaryMinus = struct {
	ASTBase
	__arg: own *ASTLevel1Expression
}

func new_ASTUnaryMinus(_arg: own *ASTLevel1Expression) (ret: own *ASTUnaryMinus)
{
	ret = new(ASTUnaryMinus)
	ret.__arg = @_arg
	return
}

func (ast: *ASTUnaryMinus) copy() (ret: own *ASTUnaryMinus)
{
	ret = new(ASTUnaryMinus)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTPointerType = struct {
	ASTBase
	__inner_type: own *ASTType
	__nullable: bool
	__owned: bool
}

func new_ASTPointerType(_inner_type: own *ASTType, _nullable: bool, _owned: bool) (ret: own *ASTPointerType)
{
	ret = new(ASTPointerType)
	ret.__inner_type = @_inner_type
	ret.__nullable = _nullable
	ret.__owned = _owned
	return
}

func (ast: *ASTPointerType) copy() (ret: own *ASTPointerType)
{
	ret = new(ASTPointerType)
	ret.__inner_type = ast.__inner_type.copy()
	ret.__nullable = ast.__nullable
	ret.__owned = ast.__owned
	return
}

type ASTMayFail = struct {
	ASTBase
	__fail_list: own *[]string
}

func new_ASTMayFail(_fail_list: own *[]string) (ret: own *ASTMayFail)
{
	ret = new(ASTMayFail)
	ret.__fail_list = @_fail_list
	return
}

func (ast: *ASTMayFail) copy() (ret: own *ASTMayFail)
{
	ret = new(ASTMayFail)
	ret.__fail_list = ast.copy_fail_list()
	return
}

func (ast: *ASTMayFail) copy_fail_list() (ret: own *[]string)
{
	ret = new[len(ast.__fail_list)](string)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__fail_list[i]
		i++
	}
	return
}

type ASTMethodSignature = struct {
	ASTBase
	__in_params: own *[]own *ASTParameter
	__out_params: own *[]own *ASTParameter
}

func new_ASTMethodSignature(_in_params: own *[]own *ASTParameter, _out_params: own *[]own *ASTParameter) (ret: own *ASTMethodSignature)
{
	ret = new(ASTMethodSignature)
	ret.__in_params = @_in_params
	ret.__out_params = @_out_params
	return
}

func (ast: *ASTMethodSignature) copy() (ret: own *ASTMethodSignature)
{
	ret = new(ASTMethodSignature)
	ret.__in_params = ast.copy_in_params()
	ret.__out_params = ast.copy_out_params()
	return
}

func (ast: *ASTMethodSignature) copy_in_params() (ret: own *[]own *ASTParameter)
{
	ret = new[len(ast.__in_params)](own *ASTParameter)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__in_params[i].copy()
		i++
	}
	return
}

func (ast: *ASTMethodSignature) copy_out_params() (ret: own *[]own *ASTParameter)
{
	ret = new[len(ast.__out_params)](own *ASTParameter)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__out_params[i].copy()
		i++
	}
	return
}

type ASTAssertAll = struct {
	ASTBase
	__vars: own *[]string
	__expr: own *ASTExpression
}

func new_ASTAssertAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTAssertAll)
{
	ret = new(ASTAssertAll)
	ret.__vars = @_vars
	ret.__expr = @_expr
	return
}

func (ast: *ASTAssertAll) copy() (ret: own *ASTAssertAll)
{
	ret = new(ASTAssertAll)
	ret.__vars = ast.copy_vars()
	ret.__expr = ast.__expr.copy()
	return
}

func (ast: *ASTAssertAll) copy_vars() (ret: own *[]string)
{
	ret = new[len(ast.__vars)](string)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__vars[i]
		i++
	}
	return
}

type ASTAnd = struct {
	ASTBase
	__left: own *ASTLevel5Expression
	__right: own *ASTLevel4Expression
}

func new_ASTAnd(_left: own *ASTLevel5Expression, _right: own *ASTLevel4Expression) (ret: own *ASTAnd)
{
	ret = new(ASTAnd)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTAnd) copy() (ret: own *ASTAnd)
{
	ret = new(ASTAnd)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTSelector = struct {
	ASTBase
	__base: own *ASTLevel0Expression
	__selector: string
}

func new_ASTSelector(_base: own *ASTLevel0Expression, _selector: string) (ret: own *ASTSelector)
{
	ret = new(ASTSelector)
	ret.__base = @_base
	ret.__selector = _selector
	return
}

func (ast: *ASTSelector) copy() (ret: own *ASTSelector)
{
	ret = new(ASTSelector)
	ret.__base = ast.__base.copy()
	ret.__selector = ast.__selector
	return
}

type ASTEnsuresAll = struct {
	ASTBase
	__vars: own *[]string
	__expr: own *ASTExpression
}

func new_ASTEnsuresAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTEnsuresAll)
{
	ret = new(ASTEnsuresAll)
	ret.__vars = @_vars
	ret.__expr = @_expr
	return
}

func (ast: *ASTEnsuresAll) copy() (ret: own *ASTEnsuresAll)
{
	ret = new(ASTEnsuresAll)
	ret.__vars = ast.copy_vars()
	ret.__expr = ast.__expr.copy()
	return
}

func (ast: *ASTEnsuresAll) copy_vars() (ret: own *[]string)
{
	ret = new[len(ast.__vars)](string)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__vars[i]
		i++
	}
	return
}

type ASTLoopBound = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTLoopBound(_expr: own *ASTExpression) (ret: own *ASTLoopBound)
{
	ret = new(ASTLoopBound)
	ret.__expr = @_expr
	return
}

func (ast: *ASTLoopBound) copy() (ret: own *ASTLoopBound)
{
	ret = new(ASTLoopBound)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTLevel6Expression = ASTOr | ASTAnd | ASTLess | ASTLessEq | ASTGreater | ASTGreaterEq | ASTEqual | ASTInequal | ASTIs | ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTRequiresAll = struct {
	ASTBase
	__vars: own *[]string
	__expr: own *ASTExpression
}

func new_ASTRequiresAll(_vars: own *[]string, _expr: own *ASTExpression) (ret: own *ASTRequiresAll)
{
	ret = new(ASTRequiresAll)
	ret.__vars = @_vars
	ret.__expr = @_expr
	return
}

func (ast: *ASTRequiresAll) copy() (ret: own *ASTRequiresAll)
{
	ret = new(ASTRequiresAll)
	ret.__vars = ast.copy_vars()
	ret.__expr = ast.__expr.copy()
	return
}

func (ast: *ASTRequiresAll) copy_vars() (ret: own *[]string)
{
	ret = new[len(ast.__vars)](string)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__vars[i]
		i++
	}
	return
}

type ASTBreak = struct {
	ASTBase
	__label: own ?string
}

func new_ASTBreak(_label: own ?string) (ret: own *ASTBreak)
{
	ret = new(ASTBreak)
	ret.__label = @_label
	return
}

func (ast: *ASTBreak) copy() (ret: own *ASTBreak)
{
	ret = new(ASTBreak)
	if ast.__label == null {
		ret.__label = null
	} else {
		ret.__label = new(string)
		*ret.__label = *ast.__label
	}
	return
}

type ASTDelete = struct {
	ASTBase
	__arg: own *ASTExpression
}

func new_ASTDelete(_arg: own *ASTExpression) (ret: own *ASTDelete)
{
	ret = new(ASTDelete)
	ret.__arg = @_arg
	return
}

func (ast: *ASTDelete) copy() (ret: own *ASTDelete)
{
	ret = new(ASTDelete)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTTake = struct {
	ASTBase
	__arg: own *ASTLevel1Expression
}

func new_ASTTake(_arg: own *ASTLevel1Expression) (ret: own *ASTTake)
{
	ret = new(ASTTake)
	ret.__arg = @_arg
	return
}

func (ast: *ASTTake) copy() (ret: own *ASTTake)
{
	ret = new(ASTTake)
	ret.__arg = ast.__arg.copy()
	return
}

type ASTType = ASTTypeRef | ASTRangeType | ASTArrayType | ASTPointerType

type ASTRecoverable = ASTAssignment | ASTVardecl | ASTOr | ASTAnd | ASTLess | ASTLessEq | ASTGreater | ASTGreaterEq | ASTEqual | ASTInequal | ASTIs | ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTIs = struct {
	ASTBase
	__arg: own *ASTLevel3Expression
	__type: own *ASTType
}

func new_ASTIs(_arg: own *ASTLevel3Expression, _type: own *ASTType) (ret: own *ASTIs)
{
	ret = new(ASTIs)
	ret.__arg = @_arg
	ret.__type = @_type
	return
}

func (ast: *ASTIs) copy() (ret: own *ASTIs)
{
	ret = new(ASTIs)
	ret.__arg = ast.__arg.copy()
	ret.__type = ast.__type.copy()
	return
}

type ASTMod = struct {
	ASTBase
	__left: own *ASTLevel2Expression
	__right: own *ASTLevel1Expression
}

func new_ASTMod(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTMod)
{
	ret = new(ASTMod)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTMod) copy() (ret: own *ASTMod)
{
	ret = new(ASTMod)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTWhile = struct {
	ASTBase
	__label: own ?string
	__condition: own *ASTExpression
	__contracts: own *[]own *ASTWhileContract
	__body: own *ASTBlock
}

func new_ASTWhile(_label: own ?string, _condition: own *ASTExpression, _contracts: own *[]own *ASTWhileContract, _body: own *ASTBlock) (ret: own *ASTWhile)
{
	ret = new(ASTWhile)
	ret.__label = @_label
	ret.__condition = @_condition
	ret.__contracts = @_contracts
	ret.__body = @_body
	return
}

func (ast: *ASTWhile) copy() (ret: own *ASTWhile)
{
	ret = new(ASTWhile)
	if ast.__label == null {
		ret.__label = null
	} else {
		ret.__label = new(string)
		*ret.__label = *ast.__label
	}
	ret.__condition = ast.__condition.copy()
	ret.__contracts = ast.copy_contracts()
	ret.__body = ast.__body.copy()
	return
}

func (ast: *ASTWhile) copy_contracts() (ret: own *[]own *ASTWhileContract)
{
	ret = new[len(ast.__contracts)](own *ASTWhileContract)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__contracts[i].copy()
		i++
	}
	return
}

type ASTElseBranch = ASTBlock | ASTIf

type ASTTypeRef = struct {
	ASTBase
	__package: own ?string
	__name: string
}

func new_ASTTypeRef(_package: own ?string, _name: string) (ret: own *ASTTypeRef)
{
	ret = new(ASTTypeRef)
	ret.__package = @_package
	ret.__name = _name
	return
}

func (ast: *ASTTypeRef) copy() (ret: own *ASTTypeRef)
{
	ret = new(ASTTypeRef)
	if ast.__package == null {
		ret.__package = null
	} else {
		ret.__package = new(string)
		*ret.__package = *ast.__package
	}
	ret.__name = ast.__name
	return
}

type ASTArrayType = struct {
	ASTBase
	__length: own ?ASTExpression
	__element_type: own *ASTType
}

func new_ASTArrayType(_length: own ?ASTExpression, _element_type: own *ASTType) (ret: own *ASTArrayType)
{
	ret = new(ASTArrayType)
	ret.__length = @_length
	ret.__element_type = @_element_type
	return
}

func (ast: *ASTArrayType) copy() (ret: own *ASTArrayType)
{
	ret = new(ASTArrayType)
	if ast.__length == null {
		ret.__length = null
	} else {
		ret.__length = ast.__length.copy()
	}
	ret.__element_type = ast.__element_type.copy()
	return
}

type ASTSanityCheck = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTSanityCheck(_expr: own *ASTExpression) (ret: own *ASTSanityCheck)
{
	ret = new(ASTSanityCheck)
	ret.__expr = @_expr
	return
}

func (ast: *ASTSanityCheck) copy() (ret: own *ASTSanityCheck)
{
	ret = new(ASTSanityCheck)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTMult = struct {
	ASTBase
	__left: own *ASTLevel2Expression
	__right: own *ASTLevel1Expression
}

func new_ASTMult(_left: own *ASTLevel2Expression, _right: own *ASTLevel1Expression) (ret: own *ASTMult)
{
	ret = new(ASTMult)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTMult) copy() (ret: own *ASTMult)
{
	ret = new(ASTMult)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTPExpression = struct {
	ASTBase
	__expr: own *ASTExpression
}

func new_ASTPExpression(_expr: own *ASTExpression) (ret: own *ASTPExpression)
{
	ret = new(ASTPExpression)
	ret.__expr = @_expr
	return
}

func (ast: *ASTPExpression) copy() (ret: own *ASTPExpression)
{
	ret = new(ASTPExpression)
	ret.__expr = ast.__expr.copy()
	return
}

type ASTLevel5Expression = ASTAnd | ASTLess | ASTLessEq | ASTGreater | ASTGreaterEq | ASTEqual | ASTInequal | ASTIs | ASTBinaryPlus | ASTBinaryMinus | ASTBitOr | ASTBitXor | ASTMult | ASTDiv | ASTMod | ASTLShift | ASTRShift | ASTBitAnd | ASTUnaryPlus | ASTUnaryMinus | ASTDeref | ASTRef | ASTNot | ASTTake | ASTMethodCall | ASTSelector | ASTIndexed | ASTIdentifier | ASTNew | ASTNewArray | ASTPExpression | ASTDecimal | ASTOctal | ASTHexaDecimal | ASTString | ASTChar

type ASTLessEq = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel3Expression
}

func new_ASTLessEq(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTLessEq)
{
	ret = new(ASTLessEq)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTLessEq) copy() (ret: own *ASTLessEq)
{
	ret = new(ASTLessEq)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTHexaDecimal = struct {
	ASTBase
	__str: string
}

func new_ASTHexaDecimal(_str: string) (ret: own *ASTHexaDecimal)
{
	ret = new(ASTHexaDecimal)
	ret.__str = _str
	return
}

func (ast: *ASTHexaDecimal) copy() (ret: own *ASTHexaDecimal)
{
	ret = new(ASTHexaDecimal)
	ret.__str = ast.__str
	return
}

type ASTFailRecover = struct {
	ASTBase
	__stmt: own *ASTRecoverable
	__recover_block: own *ASTBlock
}

func new_ASTFailRecover(_stmt: own *ASTRecoverable, _recover_block: own *ASTBlock) (ret: own *ASTFailRecover)
{
	ret = new(ASTFailRecover)
	ret.__stmt = @_stmt
	ret.__recover_block = @_recover_block
	return
}

func (ast: *ASTFailRecover) copy() (ret: own *ASTFailRecover)
{
	ret = new(ASTFailRecover)
	ret.__stmt = ast.__stmt.copy()
	ret.__recover_block = ast.__recover_block.copy()
	return
}

type ASTSwitch = struct {
	ASTBase
	__discriminant: own ?ASTExpression
	__cases: own *[]own *ASTSwitchCase
	__default: own ?ASTDefaultCase
}

func new_ASTSwitch(_discriminant: own ?ASTExpression, _cases: own *[]own *ASTSwitchCase, _default: own ?ASTDefaultCase) (ret: own *ASTSwitch)
{
	ret = new(ASTSwitch)
	ret.__discriminant = @_discriminant
	ret.__cases = @_cases
	ret.__default = @_default
	return
}

func (ast: *ASTSwitch) copy() (ret: own *ASTSwitch)
{
	ret = new(ASTSwitch)
	if ast.__discriminant == null {
		ret.__discriminant = null
	} else {
		ret.__discriminant = ast.__discriminant.copy()
	}
	ret.__cases = ast.copy_cases()
	if ast.__default == null {
		ret.__default = null
	} else {
		ret.__default = ast.__default.copy()
	}
	return
}

func (ast: *ASTSwitch) copy_cases() (ret: own *[]own *ASTSwitchCase)
{
	ret = new[len(ast.__cases)](own *ASTSwitchCase)
	var i = 0
	while i < len(ret) {
		ret[i] = ast.__cases[i].copy()
		i++
	}
	return
}

type ASTEqual = struct {
	ASTBase
	__left: own *ASTLevel3Expression
	__right: own *ASTLevel3Expression
}

func new_ASTEqual(_left: own *ASTLevel3Expression, _right: own *ASTLevel3Expression) (ret: own *ASTEqual)
{
	ret = new(ASTEqual)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTEqual) copy() (ret: own *ASTEqual)
{
	ret = new(ASTEqual)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

type ASTInterfaceMember = struct {
	ASTBase
	__name: string
	__signature: own ?ASTMethodSignature
}

func new_ASTInterfaceMember(_name: string, _signature: own ?ASTMethodSignature) (ret: own *ASTInterfaceMember)
{
	ret = new(ASTInterfaceMember)
	ret.__name = _name
	ret.__signature = @_signature
	return
}

func (ast: *ASTInterfaceMember) copy() (ret: own *ASTInterfaceMember)
{
	ret = new(ASTInterfaceMember)
	ret.__name = ast.__name
	if ast.__signature == null {
		ret.__signature = null
	} else {
		ret.__signature = ast.__signature.copy()
	}
	return
}

type ASTDecrement = struct {
	ASTBase
	__lvalue: own *ASTExpression
}

func new_ASTDecrement(_lvalue: own *ASTExpression) (ret: own *ASTDecrement)
{
	ret = new(ASTDecrement)
	ret.__lvalue = @_lvalue
	return
}

func (ast: *ASTDecrement) copy() (ret: own *ASTDecrement)
{
	ret = new(ASTDecrement)
	ret.__lvalue = ast.__lvalue.copy()
	return
}

type ASTOr = struct {
	ASTBase
	__left: own *ASTLevel6Expression
	__right: own *ASTLevel5Expression
}

func new_ASTOr(_left: own *ASTLevel6Expression, _right: own *ASTLevel5Expression) (ret: own *ASTOr)
{
	ret = new(ASTOr)
	ret.__left = @_left
	ret.__right = @_right
	return
}

func (ast: *ASTOr) copy() (ret: own *ASTOr)
{
	ret = new(ASTOr)
	ret.__left = ast.__left.copy()
	ret.__right = ast.__right.copy()
	return
}

func parse_ASTVardeclTyped(data: *[]byte, start: int) (ret: own *ASTVardeclTyped)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTVardeclTyped)
	var idx = spl_down(data, start)
	ret.__names = parse_ASTVardeclTyped_names(data, idx)
	idx = spl_next(data, idx)
	ret.__type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTVardeclTyped_names(data: own *[]byte, start: int) (ret: own *[]string)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](string)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = spl_get_string(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTLevel1Expression(data: *[]byte, start: int) (ret: own *ASTLevel1Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTInequal(data: *[]byte, start: int) (ret: own *ASTInequal)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTInequal)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTAssume(data: *[]byte, start: int) (ret: own *ASTAssume)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTAssume)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTFailRecover(data: *[]byte, start: int) (ret: own *ASTFailRecover)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTFailRecover)
	var idx = spl_down(data, start)
	ret.__stmt = parse_ASTRecoverable(data, idx)
	idx = spl_next(data, idx)
	ret.__recover_block = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMult(data: *[]byte, start: int) (ret: own *ASTMult)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTMult)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTBreak(data: *[]byte, start: int) (ret: own *ASTBreak)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBreak)
	var idx = spl_down(data, start)
	ret.__label = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTContinue(data: *[]byte, start: int) (ret: own *ASTContinue)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTContinue)
	var idx = spl_down(data, start)
	ret.__label = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTRecursionBound(data: *[]byte, start: int) (ret: own *ASTRecursionBound)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTRecursionBound)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTFail(data: *[]byte, start: int) (ret: own *ASTFail)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTFail)
	var idx = spl_down(data, start)
	ret.__code = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	ret.__description = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTGreater(data: *[]byte, start: int) (ret: own *ASTGreater)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTGreater)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTNew(data: *[]byte, start: int) (ret: own *ASTNew)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTNew)
	var idx = spl_down(data, start)
	ret.__type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTVardecl(data: *[]byte, start: int) (ret: own *ASTVardecl)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTVardecl)
	var idx = spl_down(data, start)
	ret.__name = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if spl_is_empty(data, idx) {
		ret.__initializer = null
	} else {
		ret.__initializer = parse_ASTExpression(data, idx)
	}
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTWhile(data: *[]byte, start: int) (ret: own *ASTWhile)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTWhile)
	var idx = spl_down(data, start)
	ret.__label = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	ret.__condition = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	ret.__contracts = parse_ASTWhile_contracts(data, idx)
	idx = spl_next(data, idx)
	ret.__body = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTWhile_contracts(data: own *[]byte, start: int) (ret: own *[]own *ASTWhileContract)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTWhileContract)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTWhileContract(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTArrayType(data: *[]byte, start: int) (ret: own *ASTArrayType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTArrayType)
	var idx = spl_down(data, start)
	if spl_is_empty(data, idx) {
		ret.__length = null
	} else {
		ret.__length = parse_ASTExpression(data, idx)
	}
	idx = spl_next(data, idx)
	ret.__element_type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMethodContract(data: *[]byte, start: int) (ret: own *ASTMethodContract)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Requires" {
		return parse_ASTRequires(data, idx)
	}
	case "RequiresAll" {
		return parse_ASTRequiresAll(data, idx)
	}
	case "Ensures" {
		return parse_ASTEnsures(data, idx)
	}
	case "EnsuresAll" {
		return parse_ASTEnsuresAll(data, idx)
	}
	case "MayFail" {
		return parse_ASTMayFail(data, idx)
	}
	case "RecursionBound" {
		return parse_ASTRecursionBound(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTNewArray(data: *[]byte, start: int) (ret: own *ASTNewArray)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTNewArray)
	var idx = spl_down(data, start)
	ret.__length = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	ret.__type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTExpression(data: *[]byte, start: int) (ret: own *ASTExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Or" {
		return parse_ASTOr(data, idx)
	}
	case "And" {
		return parse_ASTAnd(data, idx)
	}
	case "Less" {
		return parse_ASTLess(data, idx)
	}
	case "LessEq" {
		return parse_ASTLessEq(data, idx)
	}
	case "Greater" {
		return parse_ASTGreater(data, idx)
	}
	case "GreaterEq" {
		return parse_ASTGreaterEq(data, idx)
	}
	case "Equal" {
		return parse_ASTEqual(data, idx)
	}
	case "Inequal" {
		return parse_ASTInequal(data, idx)
	}
	case "Is" {
		return parse_ASTIs(data, idx)
	}
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTLevel2Expression(data: *[]byte, start: int) (ret: own *ASTLevel2Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTBinaryMinus(data: *[]byte, start: int) (ret: own *ASTBinaryMinus)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBinaryMinus)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTUnaryMinus(data: *[]byte, start: int) (ret: own *ASTUnaryMinus)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTUnaryMinus)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTTypedef(data: *[]byte, start: int) (ret: own *ASTTypedef)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTTypedef)
	var idx = spl_down(data, start)
	ret.__name = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	ret.__type = parse_ASTNamedType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTRequiresAll(data: *[]byte, start: int) (ret: own *ASTRequiresAll)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTRequiresAll)
	var idx = spl_down(data, start)
	ret.__vars = parse_ASTRequiresAll_vars(data, idx)
	idx = spl_next(data, idx)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTRequiresAll_vars(data: own *[]byte, start: int) (ret: own *[]string)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](string)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = spl_get_string(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTInterfaceMember(data: *[]byte, start: int) (ret: own *ASTInterfaceMember)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTInterfaceMember)
	var idx = spl_down(data, start)
	ret.__name = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if spl_is_empty(data, idx) {
		ret.__signature = null
	} else {
		ret.__signature = parse_ASTMethodSignature(data, idx)
	}
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMethodSignature(data: *[]byte, start: int) (ret: own *ASTMethodSignature)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTMethodSignature)
	var idx = spl_down(data, start)
	ret.__in_params = parse_ASTMethodSignature_in_params(data, idx)
	idx = spl_next(data, idx)
	ret.__out_params = parse_ASTMethodSignature_out_params(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMethodSignature_in_params(data: own *[]byte, start: int) (ret: own *[]own *ASTParameter)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTParameter)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTParameter(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTMethodSignature_out_params(data: own *[]byte, start: int) (ret: own *[]own *ASTParameter)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTParameter)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTParameter(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTDefaultCase(data: *[]byte, start: int) (ret: own *ASTDefaultCase)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTDefaultCase)
	var idx = spl_down(data, start)
	ret.__body = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTDecrement(data: *[]byte, start: int) (ret: own *ASTDecrement)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTDecrement)
	var idx = spl_down(data, start)
	ret.__lvalue = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTIdentifier(data: *[]byte, start: int) (ret: own *ASTIdentifier)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTIdentifier)
	var idx = spl_down(data, start)
	ret.__ident = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTDeref(data: *[]byte, start: int) (ret: own *ASTDeref)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTDeref)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTEnsuresAll(data: *[]byte, start: int) (ret: own *ASTEnsuresAll)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTEnsuresAll)
	var idx = spl_down(data, start)
	ret.__vars = parse_ASTEnsuresAll_vars(data, idx)
	idx = spl_next(data, idx)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTEnsuresAll_vars(data: own *[]byte, start: int) (ret: own *[]string)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](string)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = spl_get_string(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTReturn(data: *[]byte, start: int) (ret: own *ASTReturn)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTReturn)
	var idx = spl_down(data, start)
	ret.__retvals = parse_ASTReturn_retvals(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTReturn_retvals(data: own *[]byte, start: int) (ret: own *[]own *ASTExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTExpression)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTExpression(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTSelector(data: *[]byte, start: int) (ret: own *ASTSelector)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTSelector)
	var idx = spl_down(data, start)
	ret.__base = parse_ASTLevel0Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__selector = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTInterfaceType(data: *[]byte, start: int) (ret: own *ASTInterfaceType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTInterfaceType)
	var idx = spl_down(data, start)
	ret.__members = parse_ASTInterfaceType_members(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTInterfaceType_members(data: own *[]byte, start: int) (ret: own *[]own *ASTInterfaceMember)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTInterfaceMember)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTInterfaceMember(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTLevel4Expression(data: *[]byte, start: int) (ret: own *ASTLevel4Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Less" {
		return parse_ASTLess(data, idx)
	}
	case "LessEq" {
		return parse_ASTLessEq(data, idx)
	}
	case "Greater" {
		return parse_ASTGreater(data, idx)
	}
	case "GreaterEq" {
		return parse_ASTGreaterEq(data, idx)
	}
	case "Equal" {
		return parse_ASTEqual(data, idx)
	}
	case "Inequal" {
		return parse_ASTInequal(data, idx)
	}
	case "Is" {
		return parse_ASTIs(data, idx)
	}
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTChar(data: *[]byte, start: int) (ret: own *ASTChar)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTChar)
	var idx = spl_down(data, start)
	ret.__str = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTAnd(data: *[]byte, start: int) (ret: own *ASTAnd)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTAnd)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel5Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel4Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTAssertAll(data: *[]byte, start: int) (ret: own *ASTAssertAll)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTAssertAll)
	var idx = spl_down(data, start)
	ret.__vars = parse_ASTAssertAll_vars(data, idx)
	idx = spl_next(data, idx)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTAssertAll_vars(data: own *[]byte, start: int) (ret: own *[]string)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](string)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = spl_get_string(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTIncrement(data: *[]byte, start: int) (ret: own *ASTIncrement)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTIncrement)
	var idx = spl_down(data, start)
	ret.__lvalue = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTInvariant(data: *[]byte, start: int) (ret: own *ASTInvariant)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTInvariant)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTEqual(data: *[]byte, start: int) (ret: own *ASTEqual)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTEqual)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTElseBranch(data: *[]byte, start: int) (ret: own *ASTElseBranch)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Block" {
		return parse_ASTBlock(data, idx)
	}
	case "If" {
		return parse_ASTIf(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTLess(data: *[]byte, start: int) (ret: own *ASTLess)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTLess)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTDecimal(data: *[]byte, start: int) (ret: own *ASTDecimal)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTDecimal)
	var idx = spl_down(data, start)
	ret.__str = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTOctal(data: *[]byte, start: int) (ret: own *ASTOctal)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTOctal)
	var idx = spl_down(data, start)
	ret.__str = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTString(data: *[]byte, start: int) (ret: own *ASTString)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTString)
	var idx = spl_down(data, start)
	ret.__str = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTLShift(data: *[]byte, start: int) (ret: own *ASTLShift)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTLShift)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTTypeSwitch(data: *[]byte, start: int) (ret: own *ASTTypeSwitch)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTTypeSwitch)
	var idx = spl_down(data, start)
	ret.__discriminant = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	ret.__cases = parse_ASTTypeSwitch_cases(data, idx)
	idx = spl_next(data, idx)
	if spl_is_empty(data, idx) {
		ret.__default = null
	} else {
		ret.__default = parse_ASTDefaultCase(data, idx)
	}
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTTypeSwitch_cases(data: own *[]byte, start: int) (ret: own *[]own *ASTTypeSwitchCase)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTTypeSwitchCase)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTTypeSwitchCase(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTIf(data: *[]byte, start: int) (ret: own *ASTIf)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTIf)
	var idx = spl_down(data, start)
	ret.__condition = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	ret.__true_branch = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if spl_is_empty(data, idx) {
		ret.__false_branch = null
	} else {
		ret.__false_branch = parse_ASTElseBranch(data, idx)
	}
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTRef(data: *[]byte, start: int) (ret: own *ASTRef)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTRef)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTNot(data: *[]byte, start: int) (ret: own *ASTNot)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTNot)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTIndexed(data: *[]byte, start: int) (ret: own *ASTIndexed)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTIndexed)
	var idx = spl_down(data, start)
	ret.__base = parse_ASTLevel0Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__index = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTRShift(data: *[]byte, start: int) (ret: own *ASTRShift)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTRShift)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTBinaryPlus(data: *[]byte, start: int) (ret: own *ASTBinaryPlus)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBinaryPlus)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTUnaryPlus(data: *[]byte, start: int) (ret: own *ASTUnaryPlus)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTUnaryPlus)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTLoopBound(data: *[]byte, start: int) (ret: own *ASTLoopBound)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTLoopBound)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTTypeSwitchCase(data: *[]byte, start: int) (ret: own *ASTTypeSwitchCase)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTTypeSwitchCase)
	var idx = spl_down(data, start)
	ret.__types = parse_ASTTypeSwitchCase_types(data, idx)
	idx = spl_next(data, idx)
	ret.__body = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTTypeSwitchCase_types(data: own *[]byte, start: int) (ret: own *[]own *ASTType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTType)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTType(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTPExpression(data: *[]byte, start: int) (ret: own *ASTPExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTPExpression)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMayFail(data: *[]byte, start: int) (ret: own *ASTMayFail)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTMayFail)
	var idx = spl_down(data, start)
	ret.__fail_list = parse_ASTMayFail_fail_list(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMayFail_fail_list(data: own *[]byte, start: int) (ret: own *[]string)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](string)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = spl_get_string(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTDelete(data: *[]byte, start: int) (ret: own *ASTDelete)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTDelete)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTNamedType(data: *[]byte, start: int) (ret: own *ASTNamedType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "StructType" {
		return parse_ASTStructType(data, idx)
	}
	case "InterfaceType" {
		return parse_ASTInterfaceType(data, idx)
	}
	case "SelectionType" {
		return parse_ASTSelectionType(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTStructMember(data: *[]byte, start: int) (ret: own *ASTStructMember)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTStructMember)
	var idx = spl_down(data, start)
	ret.__name = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	ret.__type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTLevel5Expression(data: *[]byte, start: int) (ret: own *ASTLevel5Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "And" {
		return parse_ASTAnd(data, idx)
	}
	case "Less" {
		return parse_ASTLess(data, idx)
	}
	case "LessEq" {
		return parse_ASTLessEq(data, idx)
	}
	case "Greater" {
		return parse_ASTGreater(data, idx)
	}
	case "GreaterEq" {
		return parse_ASTGreaterEq(data, idx)
	}
	case "Equal" {
		return parse_ASTEqual(data, idx)
	}
	case "Inequal" {
		return parse_ASTInequal(data, idx)
	}
	case "Is" {
		return parse_ASTIs(data, idx)
	}
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTRecoverable(data: *[]byte, start: int) (ret: own *ASTRecoverable)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Assignment" {
		return parse_ASTAssignment(data, idx)
	}
	case "Vardecl" {
		return parse_ASTVardecl(data, idx)
	}
	case "Or" {
		return parse_ASTOr(data, idx)
	}
	case "And" {
		return parse_ASTAnd(data, idx)
	}
	case "Less" {
		return parse_ASTLess(data, idx)
	}
	case "LessEq" {
		return parse_ASTLessEq(data, idx)
	}
	case "Greater" {
		return parse_ASTGreater(data, idx)
	}
	case "GreaterEq" {
		return parse_ASTGreaterEq(data, idx)
	}
	case "Equal" {
		return parse_ASTEqual(data, idx)
	}
	case "Inequal" {
		return parse_ASTInequal(data, idx)
	}
	case "Is" {
		return parse_ASTIs(data, idx)
	}
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTGreaterEq(data: *[]byte, start: int) (ret: own *ASTGreaterEq)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTGreaterEq)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTAssignment(data: *[]byte, start: int) (ret: own *ASTAssignment)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTAssignment)
	var idx = spl_down(data, start)
	ret.__rvalues = parse_ASTAssignment_rvalues(data, idx)
	idx = spl_next(data, idx)
	ret.__lvalues = parse_ASTAssignment_lvalues(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTAssignment_rvalues(data: own *[]byte, start: int) (ret: own *[]own *ASTExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTExpression)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTExpression(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTAssignment_lvalues(data: own *[]byte, start: int) (ret: own *[]own *ASTExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTExpression)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTExpression(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTLevel3Expression(data: *[]byte, start: int) (ret: own *ASTLevel3Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTStructType(data: *[]byte, start: int) (ret: own *ASTStructType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTStructType)
	var idx = spl_down(data, start)
	ret.__members = parse_ASTStructType_members(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTStructType_members(data: own *[]byte, start: int) (ret: own *[]own *ASTStructMember)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTStructMember)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTStructMember(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTEnsures(data: *[]byte, start: int) (ret: own *ASTEnsures)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTEnsures)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTSwitch(data: *[]byte, start: int) (ret: own *ASTSwitch)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTSwitch)
	var idx = spl_down(data, start)
	if spl_is_empty(data, idx) {
		ret.__discriminant = null
	} else {
		ret.__discriminant = parse_ASTExpression(data, idx)
	}
	idx = spl_next(data, idx)
	ret.__cases = parse_ASTSwitch_cases(data, idx)
	idx = spl_next(data, idx)
	if spl_is_empty(data, idx) {
		ret.__default = null
	} else {
		ret.__default = parse_ASTDefaultCase(data, idx)
	}
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTSwitch_cases(data: own *[]byte, start: int) (ret: own *[]own *ASTSwitchCase)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTSwitchCase)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTSwitchCase(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTLevel0Expression(data: *[]byte, start: int) (ret: own *ASTLevel0Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTBitAnd(data: *[]byte, start: int) (ret: own *ASTBitAnd)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBitAnd)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTPointerType(data: *[]byte, start: int) (ret: own *ASTPointerType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTPointerType)
	var idx = spl_down(data, start)
	ret.__inner_type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	ret.__nullable = !spl_is_empty(data, idx)
	idx = spl_next(data, idx)
	ret.__owned = !spl_is_empty(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTBlock(data: *[]byte, start: int) (ret: own *ASTBlock)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBlock)
	var idx = spl_down(data, start)
	ret.__statements = parse_ASTBlock_statements(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTBlock_statements(data: own *[]byte, start: int) (ret: own *[]own *ASTStatement)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTStatement)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTStatement(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTGlobal(data: *[]byte, start: int) (ret: own *ASTGlobal)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Method" {
		return parse_ASTMethod(data, idx)
	}
	case "Typedef" {
		return parse_ASTTypedef(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTTypeRef(data: *[]byte, start: int) (ret: own *ASTTypeRef)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTTypeRef)
	var idx = spl_down(data, start)
	ret.__package = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	ret.__name = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTRangeType(data: *[]byte, start: int) (ret: own *ASTRangeType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTRangeType)
	var idx = spl_down(data, start)
	ret.__low = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	ret.__high = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTTake(data: *[]byte, start: int) (ret: own *ASTTake)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTTake)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTLevel6Expression(data: *[]byte, start: int) (ret: own *ASTLevel6Expression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Or" {
		return parse_ASTOr(data, idx)
	}
	case "And" {
		return parse_ASTAnd(data, idx)
	}
	case "Less" {
		return parse_ASTLess(data, idx)
	}
	case "LessEq" {
		return parse_ASTLessEq(data, idx)
	}
	case "Greater" {
		return parse_ASTGreater(data, idx)
	}
	case "GreaterEq" {
		return parse_ASTGreaterEq(data, idx)
	}
	case "Equal" {
		return parse_ASTEqual(data, idx)
	}
	case "Inequal" {
		return parse_ASTInequal(data, idx)
	}
	case "Is" {
		return parse_ASTIs(data, idx)
	}
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTMod(data: *[]byte, start: int) (ret: own *ASTMod)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTMod)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTDiv(data: *[]byte, start: int) (ret: own *ASTDiv)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTDiv)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel1Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTHexaDecimal(data: *[]byte, start: int) (ret: own *ASTHexaDecimal)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTHexaDecimal)
	var idx = spl_down(data, start)
	ret.__str = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTParameter(data: *[]byte, start: int) (ret: own *ASTParameter)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTParameter)
	var idx = spl_down(data, start)
	ret.__name = spl_get_nullstring(data, idx)
	idx = spl_next(data, idx)
	ret.__type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTOr(data: *[]byte, start: int) (ret: own *ASTOr)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTOr)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel6Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel5Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTIs(data: *[]byte, start: int) (ret: own *ASTIs)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTIs)
	var idx = spl_down(data, start)
	ret.__arg = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__type = parse_ASTType(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTBitXor(data: *[]byte, start: int) (ret: own *ASTBitXor)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBitXor)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTType(data: *[]byte, start: int) (ret: own *ASTType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "TypeRef" {
		return parse_ASTTypeRef(data, idx)
	}
	case "RangeType" {
		return parse_ASTRangeType(data, idx)
	}
	case "ArrayType" {
		return parse_ASTArrayType(data, idx)
	}
	case "PointerType" {
		return parse_ASTPointerType(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTRequires(data: *[]byte, start: int) (ret: own *ASTRequires)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTRequires)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTSwitchCase(data: *[]byte, start: int) (ret: own *ASTSwitchCase)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTSwitchCase)
	var idx = spl_down(data, start)
	ret.__matches = parse_ASTSwitchCase_matches(data, idx)
	idx = spl_next(data, idx)
	ret.__body = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTSwitchCase_matches(data: own *[]byte, start: int) (ret: own *[]own *ASTExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTExpression)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTExpression(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTLessEq(data: *[]byte, start: int) (ret: own *ASTLessEq)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTLessEq)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTStatement(data: *[]byte, start: int) (ret: own *ASTStatement)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Vardecl" {
		return parse_ASTVardecl(data, idx)
	}
	case "VardeclTyped" {
		return parse_ASTVardeclTyped(data, idx)
	}
	case "While" {
		return parse_ASTWhile(data, idx)
	}
	case "Return" {
		return parse_ASTReturn(data, idx)
	}
	case "Break" {
		return parse_ASTBreak(data, idx)
	}
	case "Continue" {
		return parse_ASTContinue(data, idx)
	}
	case "Block" {
		return parse_ASTBlock(data, idx)
	}
	case "If" {
		return parse_ASTIf(data, idx)
	}
	case "Assignment" {
		return parse_ASTAssignment(data, idx)
	}
	case "Increment" {
		return parse_ASTIncrement(data, idx)
	}
	case "Decrement" {
		return parse_ASTDecrement(data, idx)
	}
	case "Delete" {
		return parse_ASTDelete(data, idx)
	}
	case "Switch" {
		return parse_ASTSwitch(data, idx)
	}
	case "TypeSwitch" {
		return parse_ASTTypeSwitch(data, idx)
	}
	case "Assert" {
		return parse_ASTAssert(data, idx)
	}
	case "AssertAll" {
		return parse_ASTAssertAll(data, idx)
	}
	case "Assume" {
		return parse_ASTAssume(data, idx)
	}
	case "Fail" {
		return parse_ASTFail(data, idx)
	}
	case "SanityCheck" {
		return parse_ASTSanityCheck(data, idx)
	}
	case "FailRecover" {
		return parse_ASTFailRecover(data, idx)
	}
	case "Or" {
		return parse_ASTOr(data, idx)
	}
	case "And" {
		return parse_ASTAnd(data, idx)
	}
	case "Less" {
		return parse_ASTLess(data, idx)
	}
	case "LessEq" {
		return parse_ASTLessEq(data, idx)
	}
	case "Greater" {
		return parse_ASTGreater(data, idx)
	}
	case "GreaterEq" {
		return parse_ASTGreaterEq(data, idx)
	}
	case "Equal" {
		return parse_ASTEqual(data, idx)
	}
	case "Inequal" {
		return parse_ASTInequal(data, idx)
	}
	case "Is" {
		return parse_ASTIs(data, idx)
	}
	case "BinaryPlus" {
		return parse_ASTBinaryPlus(data, idx)
	}
	case "BinaryMinus" {
		return parse_ASTBinaryMinus(data, idx)
	}
	case "BitOr" {
		return parse_ASTBitOr(data, idx)
	}
	case "BitXor" {
		return parse_ASTBitXor(data, idx)
	}
	case "Mult" {
		return parse_ASTMult(data, idx)
	}
	case "Div" {
		return parse_ASTDiv(data, idx)
	}
	case "Mod" {
		return parse_ASTMod(data, idx)
	}
	case "LShift" {
		return parse_ASTLShift(data, idx)
	}
	case "RShift" {
		return parse_ASTRShift(data, idx)
	}
	case "BitAnd" {
		return parse_ASTBitAnd(data, idx)
	}
	case "UnaryPlus" {
		return parse_ASTUnaryPlus(data, idx)
	}
	case "UnaryMinus" {
		return parse_ASTUnaryMinus(data, idx)
	}
	case "Deref" {
		return parse_ASTDeref(data, idx)
	}
	case "Ref" {
		return parse_ASTRef(data, idx)
	}
	case "Not" {
		return parse_ASTNot(data, idx)
	}
	case "Take" {
		return parse_ASTTake(data, idx)
	}
	case "MethodCall" {
		return parse_ASTMethodCall(data, idx)
	}
	case "Selector" {
		return parse_ASTSelector(data, idx)
	}
	case "Indexed" {
		return parse_ASTIndexed(data, idx)
	}
	case "Identifier" {
		return parse_ASTIdentifier(data, idx)
	}
	case "New" {
		return parse_ASTNew(data, idx)
	}
	case "NewArray" {
		return parse_ASTNewArray(data, idx)
	}
	case "PExpression" {
		return parse_ASTPExpression(data, idx)
	}
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTInvariantAll(data: *[]byte, start: int) (ret: own *ASTInvariantAll)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTInvariantAll)
	var idx = spl_down(data, start)
	ret.__vars = parse_ASTInvariantAll_vars(data, idx)
	idx = spl_next(data, idx)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTInvariantAll_vars(data: own *[]byte, start: int) (ret: own *[]string)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](string)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = spl_get_string(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTAssert(data: *[]byte, start: int) (ret: own *ASTAssert)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTAssert)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTWhileContract(data: *[]byte, start: int) (ret: own *ASTWhileContract)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Invariant" {
		return parse_ASTInvariant(data, idx)
	}
	case "InvariantAll" {
		return parse_ASTInvariantAll(data, idx)
	}
	case "LoopBound" {
		return parse_ASTLoopBound(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTMethodCall(data: *[]byte, start: int) (ret: own *ASTMethodCall)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTMethodCall)
	var idx = spl_down(data, start)
	if spl_is_empty(data, idx) {
		ret.__receiver = null
	} else {
		ret.__receiver = parse_ASTLevel0Expression(data, idx)
	}
	idx = spl_next(data, idx)
	ret.__method = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	ret.__args = parse_ASTMethodCall_args(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMethodCall_args(data: own *[]byte, start: int) (ret: own *[]own *ASTExpression)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTExpression)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTExpression(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTMethod(data: *[]byte, start: int) (ret: own *ASTMethod)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTMethod)
	var idx = spl_down(data, start)
	if spl_is_empty(data, idx) {
		ret.__receiver = null
	} else {
		ret.__receiver = parse_ASTParameter(data, idx)
	}
	idx = spl_next(data, idx)
	ret.__name = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	ret.__signature = parse_ASTMethodSignature(data, idx)
	idx = spl_next(data, idx)
	ret.__contracts = parse_ASTMethod_contracts(data, idx)
	idx = spl_next(data, idx)
	ret.__body = parse_ASTBlock(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTMethod_contracts(data: own *[]byte, start: int) (ret: own *[]own *ASTMethodContract)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTMethodContract)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTMethodContract(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTLiteral(data: *[]byte, start: int) (ret: own *ASTLiteral)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	var idx = spl_down(data, start)
	var typ = spl_get_string(data, idx)
	idx = spl_next(data, idx)
	if !spl_is_pexp(data, idx) {
		fail INVALID_INPUT, "Expected parenthesised expression."
	}

	switch typ
	case "Decimal" {
		return parse_ASTDecimal(data, idx)
	}
	case "Octal" {
		return parse_ASTOctal(data, idx)
	}
	case "HexaDecimal" {
		return parse_ASTHexaDecimal(data, idx)
	}
	case "String" {
		return parse_ASTString(data, idx)
	}
	case "Char" {
		return parse_ASTChar(data, idx)
	}
	default {
		fail INVALID_INPUT, "Unexpected union member."
	};;
}

func parse_ASTSelectionType(data: *[]byte, start: int) (ret: own *ASTSelectionType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTSelectionType)
	var idx = spl_down(data, start)
	ret.__types = parse_ASTSelectionType_types(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTSelectionType_types(data: own *[]byte, start: int) (ret: own *[]own *ASTType)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new[spl_length(data, start)](own *ASTType)
	var idx = spl_down(data, start)
	var i = 0
	while i < len(ret) {
		ret[i] = parse_ASTType(data, idx)
		idx = spl_next(data, idx)
		i++
	}
	sanity_check len(ret) == 0 || idx == -1
	return
}

func parse_ASTSanityCheck(data: *[]byte, start: int) (ret: own *ASTSanityCheck)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTSanityCheck)
	var idx = spl_down(data, start)
	ret.__expr = parse_ASTExpression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

func parse_ASTBitOr(data: *[]byte, start: int) (ret: own *ASTBitOr)
	may_fail INVALID_INPUT
	requires (0 <= start)
	requires (start < len(data))
	recursion_bound (len(data)-start)
{
	ret = new(ASTBitOr)
	var idx = spl_down(data, start)
	ret.__left = parse_ASTLevel3Expression(data, idx)
	idx = spl_next(data, idx)
	ret.__right = parse_ASTLevel2Expression(data, idx)
	idx = spl_next(data, idx)
	if idx != -1 {
		fail INVALID_INPUT, "Longer than expected"
	}
	return
}

