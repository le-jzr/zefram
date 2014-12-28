func box_string(s: string) (ret: own *string)
{
	ret = new(string)
	*ret = s
}
func parse_ASTAnd(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTAnd) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTAnd)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel5Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel4Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTArrayType(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTArrayType) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTArrayType)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._length = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._element_type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTAssert(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTAssert) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTAssert)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTAssertAll(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTAssertAll) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTAssertAll)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._vars = parse_ASTAssertAll_vars(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTAssertAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](string)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = p.string()
		
		count++
	}
	
	p.up()
	
	var n = new[count](string)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTAssignment(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTAssignment) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTAssignment)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._rvalues = parse_ASTAssignment_rvalues(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._lvalues = parse_ASTAssignment_lvalues(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTAssignment_rvalues(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTExpression)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTExpression)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTAssignment_lvalues(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTExpression)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTExpression)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTAssume(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTAssume) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTAssume)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBinaryMinus(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBinaryMinus) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBinaryMinus)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBinaryPlus(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBinaryPlus) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBinaryPlus)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBitAnd(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBitAnd) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBitAnd)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBitOr(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBitOr) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBitOr)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBitXor(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBitXor) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBitXor)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBlock(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBlock) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBlock)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._statements = parse_ASTBlock_statements(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTBlock_statements(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTStatement)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTStatement)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTStatement)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTStatement(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTStatement)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTBreak(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTBreak) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTBreak)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._label = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTChar(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTChar) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTChar)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._str = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTContinue(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTContinue) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTContinue)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._label = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTDecimal(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTDecimal) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTDecimal)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._str = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTDecrement(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTDecrement) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTDecrement)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._lvalue = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTDefaultCase(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTDefaultCase) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTDefaultCase)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTDelete(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTDelete) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTDelete)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTDeref(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTDeref) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTDeref)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTDiv(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTDiv) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTDiv)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTElseBranch(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTElseBranch)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Block" {
		ret = parse_ASTBlock(p, r)
	}
	case "If" {
		ret = parse_ASTIf(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTEnsures(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTEnsures) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTEnsures)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTEnsuresAll(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTEnsuresAll) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTEnsuresAll)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._vars = parse_ASTEnsuresAll_vars(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTEnsuresAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](string)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = p.string()
		
		count++
	}
	
	p.up()
	
	var n = new[count](string)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTEqual(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTEqual) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTEqual)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTExpression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTExpression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Or" {
		ret = parse_ASTOr(p, r)
	}
	case "And" {
		ret = parse_ASTAnd(p, r)
	}
	case "Less" {
		ret = parse_ASTLess(p, r)
	}
	case "LessEq" {
		ret = parse_ASTLessEq(p, r)
	}
	case "Greater" {
		ret = parse_ASTGreater(p, r)
	}
	case "GreaterEq" {
		ret = parse_ASTGreaterEq(p, r)
	}
	case "Equal" {
		ret = parse_ASTEqual(p, r)
	}
	case "Inequal" {
		ret = parse_ASTInequal(p, r)
	}
	case "Is" {
		ret = parse_ASTIs(p, r)
	}
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTFail(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTFail) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTFail)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._code = p.string()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._description = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTFailRecover(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTFailRecover) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTFailRecover)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._stmt = parse_ASTRecoverable(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._recover_block = parse_ASTBlock(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTGlobal(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTGlobal)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Method" {
		ret = parse_ASTMethod(p, r)
	}
	case "Typedef" {
		ret = parse_ASTTypedef(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTGreater(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTGreater) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTGreater)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTGreaterEq(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTGreaterEq) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTGreaterEq)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTHexaDecimal(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTHexaDecimal) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTHexaDecimal)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._str = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTIdentifier(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTIdentifier) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTIdentifier)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._ident = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTIf(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTIf) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTIf)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._condition = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._true_branch = parse_ASTBlock(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._false_branch = parse_ASTElseBranch(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTIncrement(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTIncrement) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTIncrement)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._lvalue = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTIndexed(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTIndexed) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTIndexed)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._base = parse_ASTLevel0Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._index = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTInequal(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTInequal) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTInequal)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTInterfaceMember(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTInterfaceMember) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTInterfaceMember)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._name = p.string()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._signature = parse_ASTMethodSignature(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTInterfaceType(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTInterfaceType) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTInterfaceType)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._members = parse_ASTInterfaceType_members(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTInterfaceType_members(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTInterfaceMember)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTInterfaceMember)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTInterfaceMember)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTInterfaceMember(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTInterfaceMember)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTInvariant(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTInvariant) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTInvariant)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTInvariantAll(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTInvariantAll) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTInvariantAll)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._vars = parse_ASTInvariantAll_vars(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTInvariantAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](string)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = p.string()
		
		count++
	}
	
	p.up()
	
	var n = new[count](string)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTIs(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTIs) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTIs)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTLShift(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTLShift) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTLShift)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTLess(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTLess) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTLess)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTLessEq(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTLessEq) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTLessEq)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTLevel0Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel0Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLevel1Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel1Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLevel2Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel2Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLevel3Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel3Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLevel4Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel4Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Less" {
		ret = parse_ASTLess(p, r)
	}
	case "LessEq" {
		ret = parse_ASTLessEq(p, r)
	}
	case "Greater" {
		ret = parse_ASTGreater(p, r)
	}
	case "GreaterEq" {
		ret = parse_ASTGreaterEq(p, r)
	}
	case "Equal" {
		ret = parse_ASTEqual(p, r)
	}
	case "Inequal" {
		ret = parse_ASTInequal(p, r)
	}
	case "Is" {
		ret = parse_ASTIs(p, r)
	}
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLevel5Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel5Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "And" {
		ret = parse_ASTAnd(p, r)
	}
	case "Less" {
		ret = parse_ASTLess(p, r)
	}
	case "LessEq" {
		ret = parse_ASTLessEq(p, r)
	}
	case "Greater" {
		ret = parse_ASTGreater(p, r)
	}
	case "GreaterEq" {
		ret = parse_ASTGreaterEq(p, r)
	}
	case "Equal" {
		ret = parse_ASTEqual(p, r)
	}
	case "Inequal" {
		ret = parse_ASTInequal(p, r)
	}
	case "Is" {
		ret = parse_ASTIs(p, r)
	}
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLevel6Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel6Expression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Or" {
		ret = parse_ASTOr(p, r)
	}
	case "And" {
		ret = parse_ASTAnd(p, r)
	}
	case "Less" {
		ret = parse_ASTLess(p, r)
	}
	case "LessEq" {
		ret = parse_ASTLessEq(p, r)
	}
	case "Greater" {
		ret = parse_ASTGreater(p, r)
	}
	case "GreaterEq" {
		ret = parse_ASTGreaterEq(p, r)
	}
	case "Equal" {
		ret = parse_ASTEqual(p, r)
	}
	case "Inequal" {
		ret = parse_ASTInequal(p, r)
	}
	case "Is" {
		ret = parse_ASTIs(p, r)
	}
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLiteral(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLiteral)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTLoopBound(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTLoopBound) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTLoopBound)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTMayFail(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTMayFail) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTMayFail)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._fail_list = parse_ASTMayFail_fail_list(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTMayFail_fail_list(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](string)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = p.string()
		
		count++
	}
	
	p.up()
	
	var n = new[count](string)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTMethod(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTMethod) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTMethod)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._receiver = parse_ASTParameter(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._name = p.string()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._signature = parse_ASTMethodSignature(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._contracts = parse_ASTMethod_contracts(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTMethod_contracts(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTMethodContract)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTMethodContract)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTMethodContract)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTMethodContract(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTMethodContract)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTMethodCall(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTMethodCall) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTMethodCall)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._receiver = parse_ASTLevel0Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._method = p.string()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._args = parse_ASTMethodCall_args(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTMethodCall_args(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTExpression)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTExpression)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTMethodContract(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTMethodContract)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Requires" {
		ret = parse_ASTRequires(p, r)
	}
	case "RequiresAll" {
		ret = parse_ASTRequiresAll(p, r)
	}
	case "Ensures" {
		ret = parse_ASTEnsures(p, r)
	}
	case "EnsuresAll" {
		ret = parse_ASTEnsuresAll(p, r)
	}
	case "MayFail" {
		ret = parse_ASTMayFail(p, r)
	}
	case "RecursionBound" {
		ret = parse_ASTRecursionBound(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTMethodSignature(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTMethodSignature) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTMethodSignature)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._in_params = parse_ASTMethodSignature_in_params(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._out_params = parse_ASTMethodSignature_out_params(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTMethodSignature_in_params(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTParameter)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTParameter)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTParameter)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTParameter(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTParameter)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTMethodSignature_out_params(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTParameter)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTParameter)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTParameter)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTParameter(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTParameter)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTMod(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTMod) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTMod)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTMult(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTMult) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTMult)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTNamedType(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTNamedType)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "StructType" {
		ret = parse_ASTStructType(p, r)
	}
	case "InterfaceType" {
		ret = parse_ASTInterfaceType(p, r)
	}
	case "SelectionType" {
		ret = parse_ASTSelectionType(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTNew(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTNew) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTNew)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTNewArray(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTNewArray) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTNewArray)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._length = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTNot(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTNot) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTNot)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTOctal(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTOctal) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTOctal)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._str = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTOr(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTOr) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTOr)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel6Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel5Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTPExpression(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTPExpression) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTPExpression)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTParameter(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTParameter) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTParameter)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._name = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTPointerType(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTPointerType) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTPointerType)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._inner_type = parse_ASTType(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._nullable = p.is_string()
	p.skip()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._owned = p.is_string()
	p.skip()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRShift(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTRShift) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTRShift)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRangeType(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTRangeType) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTRangeType)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._low = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._high = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRecoverable(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTRecoverable)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Assignment" {
		ret = parse_ASTAssignment(p, r)
	}
	case "Vardecl" {
		ret = parse_ASTVardecl(p, r)
	}
	case "Or" {
		ret = parse_ASTOr(p, r)
	}
	case "And" {
		ret = parse_ASTAnd(p, r)
	}
	case "Less" {
		ret = parse_ASTLess(p, r)
	}
	case "LessEq" {
		ret = parse_ASTLessEq(p, r)
	}
	case "Greater" {
		ret = parse_ASTGreater(p, r)
	}
	case "GreaterEq" {
		ret = parse_ASTGreaterEq(p, r)
	}
	case "Equal" {
		ret = parse_ASTEqual(p, r)
	}
	case "Inequal" {
		ret = parse_ASTInequal(p, r)
	}
	case "Is" {
		ret = parse_ASTIs(p, r)
	}
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTRecursionBound(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTRecursionBound) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTRecursionBound)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRef(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTRef) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTRef)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRequires(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTRequires) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTRequires)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRequiresAll(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTRequiresAll) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTRequiresAll)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._vars = parse_ASTRequiresAll_vars(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTRequiresAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](string)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = p.string()
		
		count++
	}
	
	p.up()
	
	var n = new[count](string)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTReturn(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTReturn) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTReturn)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._retvals = parse_ASTReturn_retvals(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTReturn_retvals(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTExpression)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTExpression)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTSanityCheck(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTSanityCheck) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTSanityCheck)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTSelectionType(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTSelectionType) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTSelectionType)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._types = parse_ASTSelectionType_types(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTSelectionType_types(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTType)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTType)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTType)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTType(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTType)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTSelector(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTSelector) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTSelector)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._base = parse_ASTLevel0Expression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._selector = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTStatement(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTStatement)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Vardecl" {
		ret = parse_ASTVardecl(p, r)
	}
	case "VardeclTyped" {
		ret = parse_ASTVardeclTyped(p, r)
	}
	case "While" {
		ret = parse_ASTWhile(p, r)
	}
	case "Return" {
		ret = parse_ASTReturn(p, r)
	}
	case "Break" {
		ret = parse_ASTBreak(p, r)
	}
	case "Continue" {
		ret = parse_ASTContinue(p, r)
	}
	case "Block" {
		ret = parse_ASTBlock(p, r)
	}
	case "If" {
		ret = parse_ASTIf(p, r)
	}
	case "Assignment" {
		ret = parse_ASTAssignment(p, r)
	}
	case "Increment" {
		ret = parse_ASTIncrement(p, r)
	}
	case "Decrement" {
		ret = parse_ASTDecrement(p, r)
	}
	case "Delete" {
		ret = parse_ASTDelete(p, r)
	}
	case "Switch" {
		ret = parse_ASTSwitch(p, r)
	}
	case "TypeSwitch" {
		ret = parse_ASTTypeSwitch(p, r)
	}
	case "Assert" {
		ret = parse_ASTAssert(p, r)
	}
	case "AssertAll" {
		ret = parse_ASTAssertAll(p, r)
	}
	case "Assume" {
		ret = parse_ASTAssume(p, r)
	}
	case "Fail" {
		ret = parse_ASTFail(p, r)
	}
	case "SanityCheck" {
		ret = parse_ASTSanityCheck(p, r)
	}
	case "FailRecover" {
		ret = parse_ASTFailRecover(p, r)
	}
	case "Or" {
		ret = parse_ASTOr(p, r)
	}
	case "And" {
		ret = parse_ASTAnd(p, r)
	}
	case "Less" {
		ret = parse_ASTLess(p, r)
	}
	case "LessEq" {
		ret = parse_ASTLessEq(p, r)
	}
	case "Greater" {
		ret = parse_ASTGreater(p, r)
	}
	case "GreaterEq" {
		ret = parse_ASTGreaterEq(p, r)
	}
	case "Equal" {
		ret = parse_ASTEqual(p, r)
	}
	case "Inequal" {
		ret = parse_ASTInequal(p, r)
	}
	case "Is" {
		ret = parse_ASTIs(p, r)
	}
	case "BinaryPlus" {
		ret = parse_ASTBinaryPlus(p, r)
	}
	case "BinaryMinus" {
		ret = parse_ASTBinaryMinus(p, r)
	}
	case "BitOr" {
		ret = parse_ASTBitOr(p, r)
	}
	case "BitXor" {
		ret = parse_ASTBitXor(p, r)
	}
	case "Mult" {
		ret = parse_ASTMult(p, r)
	}
	case "Div" {
		ret = parse_ASTDiv(p, r)
	}
	case "Mod" {
		ret = parse_ASTMod(p, r)
	}
	case "LShift" {
		ret = parse_ASTLShift(p, r)
	}
	case "RShift" {
		ret = parse_ASTRShift(p, r)
	}
	case "BitAnd" {
		ret = parse_ASTBitAnd(p, r)
	}
	case "UnaryPlus" {
		ret = parse_ASTUnaryPlus(p, r)
	}
	case "UnaryMinus" {
		ret = parse_ASTUnaryMinus(p, r)
	}
	case "Deref" {
		ret = parse_ASTDeref(p, r)
	}
	case "Ref" {
		ret = parse_ASTRef(p, r)
	}
	case "Not" {
		ret = parse_ASTNot(p, r)
	}
	case "Take" {
		ret = parse_ASTTake(p, r)
	}
	case "MethodCall" {
		ret = parse_ASTMethodCall(p, r)
	}
	case "Selector" {
		ret = parse_ASTSelector(p, r)
	}
	case "Indexed" {
		ret = parse_ASTIndexed(p, r)
	}
	case "Identifier" {
		ret = parse_ASTIdentifier(p, r)
	}
	case "New" {
		ret = parse_ASTNew(p, r)
	}
	case "NewArray" {
		ret = parse_ASTNewArray(p, r)
	}
	case "PExpression" {
		ret = parse_ASTPExpression(p, r)
	}
	case "Decimal" {
		ret = parse_ASTDecimal(p, r)
	}
	case "Octal" {
		ret = parse_ASTOctal(p, r)
	}
	case "HexaDecimal" {
		ret = parse_ASTHexaDecimal(p, r)
	}
	case "String" {
		ret = parse_ASTString(p, r)
	}
	case "Char" {
		ret = parse_ASTChar(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTString(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTString) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTString)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._str = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTStructMember(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTStructMember) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTStructMember)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._name = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTStructType(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTStructType) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTStructType)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._members = parse_ASTStructType_members(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTStructType_members(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTStructMember)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTStructMember)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTStructMember)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTStructMember(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTStructMember)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTSwitch(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTSwitch) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTSwitch)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._discriminant = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._cases = parse_ASTSwitch_cases(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._default = parse_ASTDefaultCase(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTSwitch_cases(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTSwitchCase)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTSwitchCase)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTSwitchCase)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTSwitchCase(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTSwitchCase)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTSwitchCase(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTSwitchCase) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTSwitchCase)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._matches = parse_ASTSwitchCase_matches(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTSwitchCase_matches(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTExpression)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTExpression)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTTake(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTTake) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTTake)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTType(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTType)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "TypeRef" {
		ret = parse_ASTTypeRef(p, r)
	}
	case "RangeType" {
		ret = parse_ASTRangeType(p, r)
	}
	case "ArrayType" {
		ret = parse_ASTArrayType(p, r)
	}
	case "PointerType" {
		ret = parse_ASTPointerType(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
func parse_ASTTypeRef(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTTypeRef) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTTypeRef)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._package = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._name = p.string()
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTTypeSwitch(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTTypeSwitch) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTTypeSwitch)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._discriminant = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._cases = parse_ASTTypeSwitch_cases(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._default = parse_ASTDefaultCase(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTTypeSwitch_cases(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTTypeSwitchCase)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTTypeSwitchCase)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTTypeSwitchCase)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTTypeSwitchCase(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTTypeSwitchCase)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTTypeSwitchCase(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTTypeSwitchCase) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTTypeSwitchCase)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._types = parse_ASTTypeSwitchCase_types(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTTypeSwitchCase_types(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTType)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTType)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTType)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTType(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTType)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTTypedef(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTTypedef) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTTypedef)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._name = p.string()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTNamedType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTUnaryMinus(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTUnaryMinus) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTUnaryMinus)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTUnaryPlus(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTUnaryPlus) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTUnaryPlus)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTVardecl(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTVardecl) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTVardecl)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._name = p.string()
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._initializer = parse_ASTExpression(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTVardeclTyped(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTVardeclTyped) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTVardeclTyped)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._names = parse_ASTVardeclTyped_names(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTVardeclTyped_names(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](string)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = p.string()
		
		count++
	}
	
	p.up()
	
	var n = new[count](string)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTWhile(p: *spl.SeqParser, r: *spl.Reader) (ret *ASTWhile) {
	if !p.IsList() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	ret = new(ASTWhile)
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	if p.is_string() {
		ret._label = box_string(p.string())
	} else {
		p.skip()
	}
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._condition = parse_ASTExpression(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._contracts = parse_ASTWhile_contracts(p, r)
	
	
	if p.IsEnd() {
		fail BAD_INPUT
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	p.up()
	
	return
}
func parse_ASTWhile_contracts(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTWhileContract)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	var count = 0
	ret = new[1](own *ASTWhileContract)
	
	p.down()
	
	while !p.is_end() {
		if count == len(ret) {
			var old = @ret
			ret = new[2*len(old)](own *ASTWhileContract)
			copy(ret, old, len(old))
			delete @old
		}
	
		ret[count] = parse_ASTWhileContract(p, r)
		
		count++
	}
	
	p.up()
	
	var n = new[count](own *ASTWhileContract)
	copy(n, ret, count)
	delete @ret
	
	return @n
}
func parse_ASTWhileContract(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTWhileContract)
{
	if !p.is_list() {
		fail BAD_INPUT
	}
	
	p.down()
	
	if p.is_end() {
		p.up()
		return null
	}
	
	if !p.is_string() {
		fail BAD_INPUT
	}
	
	var tag = p.string()
	
	if p.is_end() {
		fail BAD_INPUT
	}
	
	switch tag
	case "Invariant" {
		ret = parse_ASTInvariant(p, r)
	}
	case "InvariantAll" {
		ret = parse_ASTInvariantAll(p, r)
	}
	case "LoopBound" {
		ret = parse_ASTLoopBound(p, r)
	}
	default {
		fail BAD_INPUT
	};;
	
	if !p.is_end() {
		fail BAD_INPUT
	}
	
	p.up()
	
	return
}
