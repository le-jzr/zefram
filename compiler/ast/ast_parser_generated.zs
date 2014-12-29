func box_string(s: string) (ret: own *string)
{
	ret = new(string)
	*ret = s
}
func parse_ASTAnd(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTAnd)
{
	if !p.is_list(r) {
		env.print("parse_ASTAnd: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAnd: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTAnd)
	
	if p.is_end(r) {
		env.print("parse_ASTAnd: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAnd: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel5Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTAnd: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAnd: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel4Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTAnd: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAnd: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTArrayType(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTArrayType)
{
	if !p.is_list(r) {
		env.print("parse_ASTArrayType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTArrayType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTArrayType)
	
	if p.is_end(r) {
		env.print("parse_ASTArrayType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTArrayType: Unexpected list end."
	}
	
	ret._length = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTArrayType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTArrayType: Unexpected list end."
	}
	
	ret._element_type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTArrayType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTArrayType: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTAssert(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTAssert)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssert: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssert: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTAssert)
	
	if p.is_end(r) {
		env.print("parse_ASTAssert: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssert: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTAssert: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssert: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTAssertAll(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTAssertAll)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssertAll: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssertAll: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTAssertAll)
	
	if p.is_end(r) {
		env.print("parse_ASTAssertAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssertAll: Unexpected list end."
	}
	
	ret._vars = parse_ASTAssertAll_vars(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTAssertAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssertAll: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTAssertAll: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssertAll: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTAssertAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssertAll_vars: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssertAll_vars: Expected list start."
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = p.string(r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTAssignment(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTAssignment)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssignment: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssignment: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTAssignment)
	
	if p.is_end(r) {
		env.print("parse_ASTAssignment: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssignment: Unexpected list end."
	}
	
	ret._rvalues = parse_ASTAssignment_rvalues(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTAssignment: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssignment: Unexpected list end."
	}
	
	ret._lvalues = parse_ASTAssignment_lvalues(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTAssignment: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssignment: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTAssignment_rvalues(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssignment_rvalues: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssignment_rvalues: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTAssignment_lvalues(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssignment_lvalues: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssignment_lvalues: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTAssume(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTAssume)
{
	if !p.is_list(r) {
		env.print("parse_ASTAssume: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssume: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTAssume)
	
	if p.is_end(r) {
		env.print("parse_ASTAssume: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssume: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTAssume: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTAssume: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBinaryMinus(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBinaryMinus)
{
	if !p.is_list(r) {
		env.print("parse_ASTBinaryMinus: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryMinus: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBinaryMinus)
	
	if p.is_end(r) {
		env.print("parse_ASTBinaryMinus: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryMinus: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTBinaryMinus: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryMinus: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBinaryMinus: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryMinus: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBinaryPlus(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBinaryPlus)
{
	if !p.is_list(r) {
		env.print("parse_ASTBinaryPlus: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryPlus: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBinaryPlus)
	
	if p.is_end(r) {
		env.print("parse_ASTBinaryPlus: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryPlus: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTBinaryPlus: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryPlus: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBinaryPlus: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBinaryPlus: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBitAnd(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBitAnd)
{
	if !p.is_list(r) {
		env.print("parse_ASTBitAnd: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitAnd: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBitAnd)
	
	if p.is_end(r) {
		env.print("parse_ASTBitAnd: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitAnd: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTBitAnd: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitAnd: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBitAnd: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitAnd: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBitOr(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBitOr)
{
	if !p.is_list(r) {
		env.print("parse_ASTBitOr: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitOr: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBitOr)
	
	if p.is_end(r) {
		env.print("parse_ASTBitOr: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitOr: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTBitOr: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitOr: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBitOr: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitOr: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBitXor(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBitXor)
{
	if !p.is_list(r) {
		env.print("parse_ASTBitXor: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitXor: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBitXor)
	
	if p.is_end(r) {
		env.print("parse_ASTBitXor: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitXor: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTBitXor: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitXor: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel2Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBitXor: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBitXor: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBlock(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBlock)
{
	if !p.is_list(r) {
		env.print("parse_ASTBlock: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBlock: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBlock)
	
	if p.is_end(r) {
		env.print("parse_ASTBlock: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBlock: Unexpected list end."
	}
	
	ret._statements = parse_ASTBlock_statements(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBlock: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBlock: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTBlock_statements(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTStatement)
{
	if !p.is_list(r) {
		env.print("parse_ASTBlock_statements: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBlock_statements: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTStatement)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTStatement(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTBreak(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTBreak)
{
	if !p.is_list(r) {
		env.print("parse_ASTBreak: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBreak: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTBreak)
	
	if p.is_end(r) {
		env.print("parse_ASTBreak: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBreak: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._label = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if !p.is_end(r) {
		env.print("parse_ASTBreak: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTBreak: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTChar(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTChar)
{
	if !p.is_list(r) {
		env.print("parse_ASTChar: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTChar: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTChar)
	
	if p.is_end(r) {
		env.print("parse_ASTChar: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTChar: Unexpected list end."
	}
	
	ret._str = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTChar: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTChar: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTContinue(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTContinue)
{
	if !p.is_list(r) {
		env.print("parse_ASTContinue: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTContinue: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTContinue)
	
	if p.is_end(r) {
		env.print("parse_ASTContinue: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTContinue: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._label = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if !p.is_end(r) {
		env.print("parse_ASTContinue: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTContinue: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTDecimal(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTDecimal)
{
	if !p.is_list(r) {
		env.print("parse_ASTDecimal: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDecimal: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTDecimal)
	
	if p.is_end(r) {
		env.print("parse_ASTDecimal: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDecimal: Unexpected list end."
	}
	
	ret._str = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTDecimal: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDecimal: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTDecrement(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTDecrement)
{
	if !p.is_list(r) {
		env.print("parse_ASTDecrement: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDecrement: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTDecrement)
	
	if p.is_end(r) {
		env.print("parse_ASTDecrement: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDecrement: Unexpected list end."
	}
	
	ret._lvalue = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTDecrement: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDecrement: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTDefaultCase(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTDefaultCase)
{
	if !p.is_list(r) {
		env.print("parse_ASTDefaultCase: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDefaultCase: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTDefaultCase)
	
	if p.is_end(r) {
		env.print("parse_ASTDefaultCase: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDefaultCase: Unexpected list end."
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTDefaultCase: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDefaultCase: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTDelete(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTDelete)
{
	if !p.is_list(r) {
		env.print("parse_ASTDelete: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDelete: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTDelete)
	
	if p.is_end(r) {
		env.print("parse_ASTDelete: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDelete: Unexpected list end."
	}
	
	ret._arg = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTDelete: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDelete: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTDeref(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTDeref)
{
	if !p.is_list(r) {
		env.print("parse_ASTDeref: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDeref: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTDeref)
	
	if p.is_end(r) {
		env.print("parse_ASTDeref: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDeref: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTDeref: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDeref: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTDiv(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTDiv)
{
	if !p.is_list(r) {
		env.print("parse_ASTDiv: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDiv: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTDiv)
	
	if p.is_end(r) {
		env.print("parse_ASTDiv: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDiv: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTDiv: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDiv: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTDiv: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTDiv: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTElseBranch(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTElseBranch)
{
	if !p.is_list(r) {
		env.print("parse_ASTElseBranch: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTElseBranch: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTElseBranch: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTElseBranch: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTElseBranch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTElseBranch: Unexpected list end."
	}
	
	switch tag
	case "Block" {
		ret = parse_ASTBlock(p, r)
	}
	case "If" {
		ret = parse_ASTIf(p, r)
	}
	default {
		env.print("parse_ASTElseBranch: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTElseBranch: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTElseBranch: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTElseBranch: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTEnsures(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTEnsures)
{
	if !p.is_list(r) {
		env.print("parse_ASTEnsures: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsures: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTEnsures)
	
	if p.is_end(r) {
		env.print("parse_ASTEnsures: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsures: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTEnsures: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsures: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTEnsuresAll(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTEnsuresAll)
{
	if !p.is_list(r) {
		env.print("parse_ASTEnsuresAll: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsuresAll: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTEnsuresAll)
	
	if p.is_end(r) {
		env.print("parse_ASTEnsuresAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsuresAll: Unexpected list end."
	}
	
	ret._vars = parse_ASTEnsuresAll_vars(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTEnsuresAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsuresAll: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTEnsuresAll: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsuresAll: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTEnsuresAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list(r) {
		env.print("parse_ASTEnsuresAll_vars: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEnsuresAll_vars: Expected list start."
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = p.string(r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTEqual(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTEqual)
{
	if !p.is_list(r) {
		env.print("parse_ASTEqual: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEqual: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTEqual)
	
	if p.is_end(r) {
		env.print("parse_ASTEqual: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEqual: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTEqual: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEqual: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTEqual: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTEqual: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTExpression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTExpression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTExpression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTExpression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTExpression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTExpression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTExpression: Unexpected list end."
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
		env.print("parse_ASTExpression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTExpression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTExpression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTExpression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTFail(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTFail)
{
	if !p.is_list(r) {
		env.print("parse_ASTFail: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFail: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTFail)
	
	if p.is_end(r) {
		env.print("parse_ASTFail: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFail: Unexpected list end."
	}
	
	ret._code = p.string(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTFail: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFail: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._description = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if !p.is_end(r) {
		env.print("parse_ASTFail: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFail: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTFailRecover(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTFailRecover)
{
	if !p.is_list(r) {
		env.print("parse_ASTFailRecover: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFailRecover: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTFailRecover)
	
	if p.is_end(r) {
		env.print("parse_ASTFailRecover: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFailRecover: Unexpected list end."
	}
	
	ret._stmt = parse_ASTRecoverable(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTFailRecover: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFailRecover: Unexpected list end."
	}
	
	ret._recover_block = parse_ASTBlock(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTFailRecover: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFailRecover: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTFile(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTFile)
{
	if !p.is_list(r) {
		env.print("parse_ASTFile: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFile: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTFile)
	
	if p.is_end(r) {
		env.print("parse_ASTFile: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFile: Unexpected list end."
	}
	
	ret._globals = parse_ASTFile_globals(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTFile: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFile: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTFile_globals(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTGlobal)
{
	if !p.is_list(r) {
		env.print("parse_ASTFile_globals: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTFile_globals: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTGlobal)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTGlobal(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTGlobal(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTGlobal)
{
	if !p.is_list(r) {
		env.print("parse_ASTGlobal: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGlobal: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTGlobal: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGlobal: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTGlobal: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGlobal: Unexpected list end."
	}
	
	switch tag
	case "Method" {
		ret = parse_ASTMethod(p, r)
	}
	case "Typedef" {
		ret = parse_ASTTypedef(p, r)
	}
	default {
		env.print("parse_ASTGlobal: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGlobal: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTGlobal: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGlobal: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTGreater(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTGreater)
{
	if !p.is_list(r) {
		env.print("parse_ASTGreater: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreater: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTGreater)
	
	if p.is_end(r) {
		env.print("parse_ASTGreater: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreater: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTGreater: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreater: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTGreater: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreater: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTGreaterEq(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTGreaterEq)
{
	if !p.is_list(r) {
		env.print("parse_ASTGreaterEq: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreaterEq: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTGreaterEq)
	
	if p.is_end(r) {
		env.print("parse_ASTGreaterEq: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreaterEq: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTGreaterEq: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreaterEq: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTGreaterEq: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTGreaterEq: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTHexaDecimal(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTHexaDecimal)
{
	if !p.is_list(r) {
		env.print("parse_ASTHexaDecimal: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTHexaDecimal: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTHexaDecimal)
	
	if p.is_end(r) {
		env.print("parse_ASTHexaDecimal: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTHexaDecimal: Unexpected list end."
	}
	
	ret._str = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTHexaDecimal: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTHexaDecimal: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTIdentifier(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTIdentifier)
{
	if !p.is_list(r) {
		env.print("parse_ASTIdentifier: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIdentifier: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTIdentifier)
	
	if p.is_end(r) {
		env.print("parse_ASTIdentifier: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIdentifier: Unexpected list end."
	}
	
	ret._ident = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTIdentifier: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIdentifier: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTIf(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTIf)
{
	if !p.is_list(r) {
		env.print("parse_ASTIf: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIf: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTIf)
	
	if p.is_end(r) {
		env.print("parse_ASTIf: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIf: Unexpected list end."
	}
	
	ret._condition = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTIf: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIf: Unexpected list end."
	}
	
	ret._true_branch = parse_ASTBlock(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTIf: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIf: Unexpected list end."
	}
	
	ret._false_branch = parse_ASTElseBranch(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTIf: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIf: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTIncrement(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTIncrement)
{
	if !p.is_list(r) {
		env.print("parse_ASTIncrement: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIncrement: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTIncrement)
	
	if p.is_end(r) {
		env.print("parse_ASTIncrement: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIncrement: Unexpected list end."
	}
	
	ret._lvalue = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTIncrement: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIncrement: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTIndexed(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTIndexed)
{
	if !p.is_list(r) {
		env.print("parse_ASTIndexed: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIndexed: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTIndexed)
	
	if p.is_end(r) {
		env.print("parse_ASTIndexed: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIndexed: Unexpected list end."
	}
	
	ret._base = parse_ASTLevel0Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTIndexed: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIndexed: Unexpected list end."
	}
	
	ret._index = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTIndexed: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIndexed: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTInequal(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTInequal)
{
	if !p.is_list(r) {
		env.print("parse_ASTInequal: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInequal: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTInequal)
	
	if p.is_end(r) {
		env.print("parse_ASTInequal: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInequal: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTInequal: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInequal: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTInequal: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInequal: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTInterfaceMember(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTInterfaceMember)
{
	if !p.is_list(r) {
		env.print("parse_ASTInterfaceMember: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceMember: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTInterfaceMember)
	
	if p.is_end(r) {
		env.print("parse_ASTInterfaceMember: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceMember: Unexpected list end."
	}
	
	ret._name = p.string(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTInterfaceMember: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceMember: Unexpected list end."
	}
	
	ret._signature = parse_ASTMethodSignature(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTInterfaceMember: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceMember: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTInterfaceType(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTInterfaceType)
{
	if !p.is_list(r) {
		env.print("parse_ASTInterfaceType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTInterfaceType)
	
	if p.is_end(r) {
		env.print("parse_ASTInterfaceType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceType: Unexpected list end."
	}
	
	ret._members = parse_ASTInterfaceType_members(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTInterfaceType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceType: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTInterfaceType_members(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTInterfaceMember)
{
	if !p.is_list(r) {
		env.print("parse_ASTInterfaceType_members: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInterfaceType_members: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTInterfaceMember)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTInterfaceMember(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTInvariant(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTInvariant)
{
	if !p.is_list(r) {
		env.print("parse_ASTInvariant: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariant: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTInvariant)
	
	if p.is_end(r) {
		env.print("parse_ASTInvariant: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariant: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTInvariant: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariant: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTInvariantAll(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTInvariantAll)
{
	if !p.is_list(r) {
		env.print("parse_ASTInvariantAll: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariantAll: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTInvariantAll)
	
	if p.is_end(r) {
		env.print("parse_ASTInvariantAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariantAll: Unexpected list end."
	}
	
	ret._vars = parse_ASTInvariantAll_vars(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTInvariantAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariantAll: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTInvariantAll: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariantAll: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTInvariantAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list(r) {
		env.print("parse_ASTInvariantAll_vars: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTInvariantAll_vars: Expected list start."
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = p.string(r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTIs(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTIs)
{
	if !p.is_list(r) {
		env.print("parse_ASTIs: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIs: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTIs)
	
	if p.is_end(r) {
		env.print("parse_ASTIs: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIs: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTIs: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIs: Unexpected list end."
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTIs: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTIs: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTLShift(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTLShift)
{
	if !p.is_list(r) {
		env.print("parse_ASTLShift: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLShift: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTLShift)
	
	if p.is_end(r) {
		env.print("parse_ASTLShift: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLShift: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTLShift: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLShift: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTLShift: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLShift: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTLess(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTLess)
{
	if !p.is_list(r) {
		env.print("parse_ASTLess: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLess: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTLess)
	
	if p.is_end(r) {
		env.print("parse_ASTLess: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLess: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTLess: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLess: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTLess: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLess: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTLessEq(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTLessEq)
{
	if !p.is_list(r) {
		env.print("parse_ASTLessEq: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLessEq: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTLessEq)
	
	if p.is_end(r) {
		env.print("parse_ASTLessEq: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLessEq: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel3Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTLessEq: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLessEq: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel3Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTLessEq: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLessEq: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTLevel0Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel0Expression)
{
	if !p.is_list(r) {
		env.print("parse_ASTLevel0Expression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel0Expression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLevel0Expression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel0Expression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLevel0Expression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel0Expression: Unexpected list end."
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
		env.print("parse_ASTLevel0Expression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel0Expression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLevel0Expression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel0Expression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLevel1Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel1Expression)
{
	if !p.is_list(r) {
		env.print("parse_ASTLevel1Expression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel1Expression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLevel1Expression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel1Expression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLevel1Expression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel1Expression: Unexpected list end."
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
		env.print("parse_ASTLevel1Expression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel1Expression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLevel1Expression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel1Expression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLevel2Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel2Expression)
{
	if !p.is_list(r) {
		env.print("parse_ASTLevel2Expression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel2Expression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLevel2Expression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel2Expression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLevel2Expression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel2Expression: Unexpected list end."
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
		env.print("parse_ASTLevel2Expression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel2Expression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLevel2Expression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel2Expression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLevel3Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel3Expression)
{
	if !p.is_list(r) {
		env.print("parse_ASTLevel3Expression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel3Expression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLevel3Expression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel3Expression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLevel3Expression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel3Expression: Unexpected list end."
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
		env.print("parse_ASTLevel3Expression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel3Expression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLevel3Expression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel3Expression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLevel4Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel4Expression)
{
	if !p.is_list(r) {
		env.print("parse_ASTLevel4Expression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel4Expression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLevel4Expression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel4Expression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLevel4Expression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel4Expression: Unexpected list end."
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
		env.print("parse_ASTLevel4Expression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel4Expression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLevel4Expression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel4Expression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLevel5Expression(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLevel5Expression)
{
	if !p.is_list(r) {
		env.print("parse_ASTLevel5Expression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel5Expression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLevel5Expression: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel5Expression: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLevel5Expression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel5Expression: Unexpected list end."
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
		env.print("parse_ASTLevel5Expression: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel5Expression: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLevel5Expression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLevel5Expression: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLiteral(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTLiteral)
{
	if !p.is_list(r) {
		env.print("parse_ASTLiteral: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLiteral: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTLiteral: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLiteral: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTLiteral: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLiteral: Unexpected list end."
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
		env.print("parse_ASTLiteral: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLiteral: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTLiteral: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLiteral: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTLoopBound(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTLoopBound)
{
	if !p.is_list(r) {
		env.print("parse_ASTLoopBound: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLoopBound: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTLoopBound)
	
	if p.is_end(r) {
		env.print("parse_ASTLoopBound: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLoopBound: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTLoopBound: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTLoopBound: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTMayFail(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTMayFail)
{
	if !p.is_list(r) {
		env.print("parse_ASTMayFail: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMayFail: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTMayFail)
	
	if p.is_end(r) {
		env.print("parse_ASTMayFail: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMayFail: Unexpected list end."
	}
	
	ret._fail_list = parse_ASTMayFail_fail_list(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTMayFail: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMayFail: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTMayFail_fail_list(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list(r) {
		env.print("parse_ASTMayFail_fail_list: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMayFail_fail_list: Expected list start."
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = p.string(r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTMethod(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTMethod)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethod: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTMethod)
	
	if p.is_end(r) {
		env.print("parse_ASTMethod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Unexpected list end."
	}
	
	ret._receiver = parse_ASTParameter(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Unexpected list end."
	}
	
	ret._name = p.string(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Unexpected list end."
	}
	
	ret._signature = parse_ASTMethodSignature(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Unexpected list end."
	}
	
	ret._contracts = parse_ASTMethod_contracts(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Unexpected list end."
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTMethod: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTMethod_contracts(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTMethodContract)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethod_contracts: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethod_contracts: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTMethodContract)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTMethodContract(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTMethodCall(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTMethodCall)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethodCall: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodCall: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTMethodCall)
	
	if p.is_end(r) {
		env.print("parse_ASTMethodCall: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodCall: Unexpected list end."
	}
	
	ret._receiver = parse_ASTLevel0Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethodCall: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodCall: Unexpected list end."
	}
	
	ret._method = p.string(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethodCall: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodCall: Unexpected list end."
	}
	
	ret._args = parse_ASTMethodCall_args(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTMethodCall: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodCall: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTMethodCall_args(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethodCall_args: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodCall_args: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTMethodContract(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTMethodContract)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethodContract: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodContract: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTMethodContract: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodContract: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTMethodContract: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodContract: Unexpected list end."
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
		env.print("parse_ASTMethodContract: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodContract: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTMethodContract: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodContract: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTMethodSignature(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTMethodSignature)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethodSignature: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodSignature: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTMethodSignature)
	
	if p.is_end(r) {
		env.print("parse_ASTMethodSignature: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodSignature: Unexpected list end."
	}
	
	ret._in_params = parse_ASTMethodSignature_in_params(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMethodSignature: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodSignature: Unexpected list end."
	}
	
	ret._out_params = parse_ASTMethodSignature_out_params(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTMethodSignature: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodSignature: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTMethodSignature_in_params(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTParameter)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethodSignature_in_params: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodSignature_in_params: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTParameter)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTParameter(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTMethodSignature_out_params(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTParameter)
{
	if !p.is_list(r) {
		env.print("parse_ASTMethodSignature_out_params: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMethodSignature_out_params: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTParameter)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTParameter(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTMod(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTMod)
{
	if !p.is_list(r) {
		env.print("parse_ASTMod: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMod: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTMod)
	
	if p.is_end(r) {
		env.print("parse_ASTMod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMod: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMod: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMod: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTMod: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMod: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTMult(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTMult)
{
	if !p.is_list(r) {
		env.print("parse_ASTMult: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMult: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTMult)
	
	if p.is_end(r) {
		env.print("parse_ASTMult: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMult: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTMult: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMult: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTMult: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTMult: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTNamedType(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTNamedType)
{
	if !p.is_list(r) {
		env.print("parse_ASTNamedType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNamedType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTNamedType: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNamedType: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTNamedType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNamedType: Unexpected list end."
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
		env.print("parse_ASTNamedType: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNamedType: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTNamedType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNamedType: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTNew(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTNew)
{
	if !p.is_list(r) {
		env.print("parse_ASTNew: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNew: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTNew)
	
	if p.is_end(r) {
		env.print("parse_ASTNew: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNew: Unexpected list end."
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTNew: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNew: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTNewArray(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTNewArray)
{
	if !p.is_list(r) {
		env.print("parse_ASTNewArray: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNewArray: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTNewArray)
	
	if p.is_end(r) {
		env.print("parse_ASTNewArray: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNewArray: Unexpected list end."
	}
	
	ret._length = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTNewArray: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNewArray: Unexpected list end."
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTNewArray: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNewArray: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTNot(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTNot)
{
	if !p.is_list(r) {
		env.print("parse_ASTNot: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNot: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTNot)
	
	if p.is_end(r) {
		env.print("parse_ASTNot: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNot: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTNot: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTNot: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTOctal(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTOctal)
{
	if !p.is_list(r) {
		env.print("parse_ASTOctal: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOctal: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTOctal)
	
	if p.is_end(r) {
		env.print("parse_ASTOctal: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOctal: Unexpected list end."
	}
	
	ret._str = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTOctal: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOctal: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTOr(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTOr)
{
	if !p.is_list(r) {
		env.print("parse_ASTOr: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOr: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTOr)
	
	if p.is_end(r) {
		env.print("parse_ASTOr: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOr: Unexpected list end."
	}
	
	ret._left = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTOr: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOr: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel5Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTOr: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTOr: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTPExpression(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTPExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTPExpression: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPExpression: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTPExpression)
	
	if p.is_end(r) {
		env.print("parse_ASTPExpression: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPExpression: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTPExpression: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPExpression: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTParameter(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTParameter)
{
	if !p.is_list(r) {
		env.print("parse_ASTParameter: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTParameter: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTParameter)
	
	if p.is_end(r) {
		env.print("parse_ASTParameter: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTParameter: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._name = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if p.is_end(r) {
		env.print("parse_ASTParameter: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTParameter: Unexpected list end."
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTParameter: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTParameter: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTPointerType(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTPointerType)
{
	if !p.is_list(r) {
		env.print("parse_ASTPointerType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPointerType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTPointerType)
	
	if p.is_end(r) {
		env.print("parse_ASTPointerType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPointerType: Unexpected list end."
	}
	
	ret._inner_type = parse_ASTType(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTPointerType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPointerType: Unexpected list end."
	}
	
	ret._nullable = p.is_string(r)
	p.skip(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTPointerType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPointerType: Unexpected list end."
	}
	
	ret._owned = p.is_string(r)
	p.skip(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTPointerType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTPointerType: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRShift(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTRShift)
{
	if !p.is_list(r) {
		env.print("parse_ASTRShift: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRShift: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTRShift)
	
	if p.is_end(r) {
		env.print("parse_ASTRShift: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRShift: Unexpected list end."
	}
	
	ret._left = parse_ASTLevel2Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTRShift: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRShift: Unexpected list end."
	}
	
	ret._right = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTRShift: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRShift: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRangeType(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTRangeType)
{
	if !p.is_list(r) {
		env.print("parse_ASTRangeType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRangeType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTRangeType)
	
	if p.is_end(r) {
		env.print("parse_ASTRangeType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRangeType: Unexpected list end."
	}
	
	ret._low = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTRangeType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRangeType: Unexpected list end."
	}
	
	ret._high = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTRangeType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRangeType: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRecoverable(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTRecoverable)
{
	if !p.is_list(r) {
		env.print("parse_ASTRecoverable: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecoverable: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTRecoverable: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecoverable: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTRecoverable: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecoverable: Unexpected list end."
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
		env.print("parse_ASTRecoverable: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecoverable: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTRecoverable: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecoverable: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTRecursionBound(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTRecursionBound)
{
	if !p.is_list(r) {
		env.print("parse_ASTRecursionBound: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecursionBound: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTRecursionBound)
	
	if p.is_end(r) {
		env.print("parse_ASTRecursionBound: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecursionBound: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTRecursionBound: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRecursionBound: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRef(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTRef)
{
	if !p.is_list(r) {
		env.print("parse_ASTRef: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRef: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTRef)
	
	if p.is_end(r) {
		env.print("parse_ASTRef: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRef: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTRef: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRef: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRequires(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTRequires)
{
	if !p.is_list(r) {
		env.print("parse_ASTRequires: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequires: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTRequires)
	
	if p.is_end(r) {
		env.print("parse_ASTRequires: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequires: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTRequires: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequires: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRequiresAll(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTRequiresAll)
{
	if !p.is_list(r) {
		env.print("parse_ASTRequiresAll: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequiresAll: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTRequiresAll)
	
	if p.is_end(r) {
		env.print("parse_ASTRequiresAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequiresAll: Unexpected list end."
	}
	
	ret._vars = parse_ASTRequiresAll_vars(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTRequiresAll: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequiresAll: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTRequiresAll: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequiresAll: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTRequiresAll_vars(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list(r) {
		env.print("parse_ASTRequiresAll_vars: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTRequiresAll_vars: Expected list start."
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = p.string(r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTReturn(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTReturn)
{
	if !p.is_list(r) {
		env.print("parse_ASTReturn: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTReturn: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTReturn)
	
	if p.is_end(r) {
		env.print("parse_ASTReturn: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTReturn: Unexpected list end."
	}
	
	ret._retvals = parse_ASTReturn_retvals(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTReturn: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTReturn: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTReturn_retvals(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTReturn_retvals: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTReturn_retvals: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTSanityCheck(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTSanityCheck)
{
	if !p.is_list(r) {
		env.print("parse_ASTSanityCheck: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSanityCheck: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTSanityCheck)
	
	if p.is_end(r) {
		env.print("parse_ASTSanityCheck: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSanityCheck: Unexpected list end."
	}
	
	ret._expr = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTSanityCheck: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSanityCheck: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTSelectionType(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTSelectionType)
{
	if !p.is_list(r) {
		env.print("parse_ASTSelectionType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelectionType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTSelectionType)
	
	if p.is_end(r) {
		env.print("parse_ASTSelectionType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelectionType: Unexpected list end."
	}
	
	ret._types = parse_ASTSelectionType_types(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTSelectionType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelectionType: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTSelectionType_types(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTType)
{
	if !p.is_list(r) {
		env.print("parse_ASTSelectionType_types: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelectionType_types: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTType)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTType(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTSelector(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTSelector)
{
	if !p.is_list(r) {
		env.print("parse_ASTSelector: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelector: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTSelector)
	
	if p.is_end(r) {
		env.print("parse_ASTSelector: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelector: Unexpected list end."
	}
	
	ret._base = parse_ASTLevel0Expression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTSelector: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelector: Unexpected list end."
	}
	
	ret._selector = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTSelector: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSelector: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTStatement(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTStatement)
{
	if !p.is_list(r) {
		env.print("parse_ASTStatement: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStatement: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTStatement: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStatement: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTStatement: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStatement: Unexpected list end."
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
		env.print("parse_ASTStatement: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStatement: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTStatement: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStatement: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTString(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTString)
{
	if !p.is_list(r) {
		env.print("parse_ASTString: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTString: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTString)
	
	if p.is_end(r) {
		env.print("parse_ASTString: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTString: Unexpected list end."
	}
	
	ret._str = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTString: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTString: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTStructMember(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTStructMember)
{
	if !p.is_list(r) {
		env.print("parse_ASTStructMember: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructMember: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTStructMember)
	
	if p.is_end(r) {
		env.print("parse_ASTStructMember: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructMember: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._name = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if p.is_end(r) {
		env.print("parse_ASTStructMember: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructMember: Unexpected list end."
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTStructMember: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructMember: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTStructType(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTStructType)
{
	if !p.is_list(r) {
		env.print("parse_ASTStructType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTStructType)
	
	if p.is_end(r) {
		env.print("parse_ASTStructType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructType: Unexpected list end."
	}
	
	ret._members = parse_ASTStructType_members(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTStructType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructType: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTStructType_members(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTStructMember)
{
	if !p.is_list(r) {
		env.print("parse_ASTStructType_members: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTStructType_members: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTStructMember)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTStructMember(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTSwitch(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTSwitch)
{
	if !p.is_list(r) {
		env.print("parse_ASTSwitch: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitch: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTSwitch)
	
	if p.is_end(r) {
		env.print("parse_ASTSwitch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitch: Unexpected list end."
	}
	
	ret._discriminant = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTSwitch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitch: Unexpected list end."
	}
	
	ret._cases = parse_ASTSwitch_cases(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTSwitch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitch: Unexpected list end."
	}
	
	ret._default = parse_ASTDefaultCase(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTSwitch: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitch: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTSwitch_cases(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTSwitchCase)
{
	if !p.is_list(r) {
		env.print("parse_ASTSwitch_cases: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitch_cases: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTSwitchCase)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTSwitchCase(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTSwitchCase(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTSwitchCase)
{
	if !p.is_list(r) {
		env.print("parse_ASTSwitchCase: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitchCase: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTSwitchCase)
	
	if p.is_end(r) {
		env.print("parse_ASTSwitchCase: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitchCase: Unexpected list end."
	}
	
	ret._matches = parse_ASTSwitchCase_matches(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTSwitchCase: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitchCase: Unexpected list end."
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTSwitchCase: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitchCase: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTSwitchCase_matches(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTExpression)
{
	if !p.is_list(r) {
		env.print("parse_ASTSwitchCase_matches: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTSwitchCase_matches: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTExpression)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTExpression(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTTake(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTTake)
{
	if !p.is_list(r) {
		env.print("parse_ASTTake: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTake: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTTake)
	
	if p.is_end(r) {
		env.print("parse_ASTTake: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTake: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTTake: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTake: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTType(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTType)
{
	if !p.is_list(r) {
		env.print("parse_ASTType: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTType: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTType: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTType: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTType: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTType: Unexpected list end."
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
		env.print("parse_ASTType: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTType: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTType: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTType: Expected list end."
	}
	
	p.up(r)
	
	return
}
func parse_ASTTypeRef(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTTypeRef)
{
	if !p.is_list(r) {
		env.print("parse_ASTTypeRef: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeRef: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTTypeRef)
	
	if p.is_end(r) {
		env.print("parse_ASTTypeRef: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeRef: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._package = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if p.is_end(r) {
		env.print("parse_ASTTypeRef: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeRef: Unexpected list end."
	}
	
	ret._name = p.string(r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTTypeRef: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeRef: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTTypeSwitch(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTTypeSwitch)
{
	if !p.is_list(r) {
		env.print("parse_ASTTypeSwitch: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitch: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTTypeSwitch)
	
	if p.is_end(r) {
		env.print("parse_ASTTypeSwitch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitch: Unexpected list end."
	}
	
	ret._discriminant = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTTypeSwitch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitch: Unexpected list end."
	}
	
	ret._cases = parse_ASTTypeSwitch_cases(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTTypeSwitch: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitch: Unexpected list end."
	}
	
	ret._default = parse_ASTDefaultCase(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTTypeSwitch: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitch: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTTypeSwitch_cases(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTTypeSwitchCase)
{
	if !p.is_list(r) {
		env.print("parse_ASTTypeSwitch_cases: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitch_cases: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTTypeSwitchCase)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTTypeSwitchCase(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTTypeSwitchCase(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTTypeSwitchCase)
{
	if !p.is_list(r) {
		env.print("parse_ASTTypeSwitchCase: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitchCase: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTTypeSwitchCase)
	
	if p.is_end(r) {
		env.print("parse_ASTTypeSwitchCase: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitchCase: Unexpected list end."
	}
	
	ret._types = parse_ASTTypeSwitchCase_types(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTTypeSwitchCase: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitchCase: Unexpected list end."
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTTypeSwitchCase: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitchCase: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTTypeSwitchCase_types(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTType)
{
	if !p.is_list(r) {
		env.print("parse_ASTTypeSwitchCase_types: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypeSwitchCase_types: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTType)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTType(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTTypedef(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTTypedef)
{
	if !p.is_list(r) {
		env.print("parse_ASTTypedef: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypedef: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTTypedef)
	
	if p.is_end(r) {
		env.print("parse_ASTTypedef: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypedef: Unexpected list end."
	}
	
	ret._name = p.string(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTTypedef: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypedef: Unexpected list end."
	}
	
	ret._type = parse_ASTNamedType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTTypedef: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTTypedef: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTUnaryMinus(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTUnaryMinus)
{
	if !p.is_list(r) {
		env.print("parse_ASTUnaryMinus: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTUnaryMinus: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTUnaryMinus)
	
	if p.is_end(r) {
		env.print("parse_ASTUnaryMinus: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTUnaryMinus: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTUnaryMinus: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTUnaryMinus: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTUnaryPlus(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTUnaryPlus)
{
	if !p.is_list(r) {
		env.print("parse_ASTUnaryPlus: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTUnaryPlus: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTUnaryPlus)
	
	if p.is_end(r) {
		env.print("parse_ASTUnaryPlus: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTUnaryPlus: Unexpected list end."
	}
	
	ret._arg = parse_ASTLevel1Expression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTUnaryPlus: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTUnaryPlus: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTVardecl(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTVardecl)
{
	if !p.is_list(r) {
		env.print("parse_ASTVardecl: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardecl: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTVardecl)
	
	if p.is_end(r) {
		env.print("parse_ASTVardecl: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardecl: Unexpected list end."
	}
	
	ret._name = p.string(r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTVardecl: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardecl: Unexpected list end."
	}
	
	ret._initializer = parse_ASTExpression(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTVardecl: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardecl: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTVardeclTyped(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTVardeclTyped)
{
	if !p.is_list(r) {
		env.print("parse_ASTVardeclTyped: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardeclTyped: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTVardeclTyped)
	
	if p.is_end(r) {
		env.print("parse_ASTVardeclTyped: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardeclTyped: Unexpected list end."
	}
	
	ret._names = parse_ASTVardeclTyped_names(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTVardeclTyped: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardeclTyped: Unexpected list end."
	}
	
	ret._type = parse_ASTType(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTVardeclTyped: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardeclTyped: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTVardeclTyped_names(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]string)
{
	if !p.is_list(r) {
		env.print("parse_ASTVardeclTyped_names: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTVardeclTyped_names: Expected list start."
	}
	
	var count = 0
	ret = new[1](string)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = p.string(r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTWhile(p: *spl.SeqParser, r: *spl.Reader) (ret: *ASTWhile)
{
	if !p.is_list(r) {
		env.print("parse_ASTWhile: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	ret = new(ASTWhile)
	
	if p.is_end(r) {
		env.print("parse_ASTWhile: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile: Unexpected list end."
	}
	
	if p.is_string(r) {
		ret._label = box_string(p.string(r))
	} else {
		p.skip(r)
	}
	
	
	if p.is_end(r) {
		env.print("parse_ASTWhile: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile: Unexpected list end."
	}
	
	ret._condition = parse_ASTExpression(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTWhile: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile: Unexpected list end."
	}
	
	ret._contracts = parse_ASTWhile_contracts(p, r)
	
	
	if p.is_end(r) {
		env.print("parse_ASTWhile: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile: Unexpected list end."
	}
	
	ret._body = parse_ASTBlock(p, r)
	
	
	if !p.is_end(r) {
		env.print("parse_ASTWhile: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile: Expected list end."
	}
	p.up(r)
	
	return
}
func parse_ASTWhile_contracts(p: *spl.SeqParser, r: *spl.Reader) (ret: own *[]own *ASTWhileContract)
{
	if !p.is_list(r) {
		env.print("parse_ASTWhile_contracts: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhile_contracts: Expected list start."
	}
	
	var count = 0
	ret = new[1](own *ASTWhileContract)
	
	p.down(r)
	
	while !p.is_end(r) {
		if count == len(ret) {
			var new_size = 2*len(ret)
			ret = resize(@ret, new_size)
		}
	
		ret[count] = parse_ASTWhileContract(p, r)
		
		count++
	}
	
	p.up(r)
	
	return resize(@ret, count)
}
func parse_ASTWhileContract(p: *spl.SeqParser, r: *spl.Reader) (ret: own *ASTWhileContract)
{
	if !p.is_list(r) {
		env.print("parse_ASTWhileContract: Expected list start at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhileContract: Expected list start."
	}
	
	p.down(r)
	
	if p.is_end(r) {
		p.up(r)
		return null
	}
	
	if !p.is_string(r) {
		env.print("parse_ASTWhileContract: Expected string at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhileContract: Expected string."
	}
	
	var tag = p.string(r)
	
	if p.is_end(r) {
		env.print("parse_ASTWhileContract: Unexpected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhileContract: Unexpected list end."
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
		env.print("parse_ASTWhileContract: Unknown tag '", tag, "' before ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhileContract: Unknown tag."
	};;
	
	if !p.is_end(r) {
		env.print("parse_ASTWhileContract: Expected list end at ", p.line(), ":", p.column(), ".\n")
		fail BAD_INPUT, "parse_ASTWhileContract: Expected list end."
	}
	
	p.up(r)
	
	return
}
