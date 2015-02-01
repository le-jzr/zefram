// This file is generated from ../spec/ast.def; DO NOT MODIFY.

package main

import "fmt"
import "github.com/zarevucky/spl"

type ASTAnd struct {
	ASTBase

	_left  ASTLevel5Expression
	_right ASTLevel4Expression
}

func NewASTAnd(_left ASTLevel5Expression, _right ASTLevel4Expression) *ASTAnd {
	__retval := new(ASTAnd)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTAnd) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTAnd)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel5Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel4Expression)
		}
	}

	return __retval
}

type ASTArrayType struct {
	ASTBase

	_length       ASTExpression
	_element_type ASTType
}

func NewASTArrayType(_length ASTExpression, _element_type ASTType) *ASTArrayType {
	__retval := new(ASTArrayType)

	__retval._length = _length
	__retval._element_type = _element_type
	return __retval
}
func (node *ASTArrayType) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTArrayType)

	if node._length != nil {
		cp := node._length.Copy()
		if cp != nil {
			__retval._length = cp.(ASTExpression)
		}
	}
	if node._element_type != nil {
		cp := node._element_type.Copy()
		if cp != nil {
			__retval._element_type = cp.(ASTType)
		}
	}

	return __retval
}

type ASTAssert struct {
	ASTBase

	_expr ASTExpression
}

func NewASTAssert(_expr ASTExpression) *ASTAssert {
	__retval := new(ASTAssert)

	__retval._expr = _expr
	return __retval
}
func (node *ASTAssert) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTAssert)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTAssertAll struct {
	ASTBase

	_vars []string
	_expr ASTExpression
}

func NewASTAssertAll(_vars []string, _expr ASTExpression) *ASTAssertAll {
	__retval := new(ASTAssertAll)

	__retval._vars = _vars
	__retval._expr = _expr
	return __retval
}
func (node *ASTAssertAll) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTAssertAll)

	__retval._vars = node.Copy_vars()
	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}
func (node *ASTAssertAll) Copy_vars() (ret []string) {

	ret = make([]string, len(node._vars))

	copy(ret, node._vars)

	return
}

type ASTAssignment struct {
	ASTBase

	_rvalues []ASTExpression
	_lvalues []ASTExpression
}

func NewASTAssignment(_rvalues []ASTExpression, _lvalues []ASTExpression) *ASTAssignment {
	__retval := new(ASTAssignment)

	__retval._rvalues = _rvalues
	__retval._lvalues = _lvalues
	return __retval
}
func (node *ASTAssignment) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTAssignment)

	__retval._rvalues = node.Copy_rvalues()
	__retval._lvalues = node.Copy_lvalues()

	return __retval
}
func (node *ASTAssignment) Copy_rvalues() (ret []ASTExpression) {

	ret = make([]ASTExpression, len(node._rvalues))

	for i := range node._rvalues {
		if node._rvalues[i] == nil {
			continue
		}
		cp := node._rvalues[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTExpression)
	}

	return
}
func (node *ASTAssignment) Copy_lvalues() (ret []ASTExpression) {

	ret = make([]ASTExpression, len(node._lvalues))

	for i := range node._lvalues {
		if node._lvalues[i] == nil {
			continue
		}
		cp := node._lvalues[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTExpression)
	}

	return
}

type ASTAssume struct {
	ASTBase

	_expr ASTExpression
}

func NewASTAssume(_expr ASTExpression) *ASTAssume {
	__retval := new(ASTAssume)

	__retval._expr = _expr
	return __retval
}
func (node *ASTAssume) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTAssume)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTBinaryMinus struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel2Expression
}

func NewASTBinaryMinus(_left ASTLevel3Expression, _right ASTLevel2Expression) *ASTBinaryMinus {
	__retval := new(ASTBinaryMinus)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTBinaryMinus) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBinaryMinus)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel2Expression)
		}
	}

	return __retval
}

type ASTBinaryPlus struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel2Expression
}

func NewASTBinaryPlus(_left ASTLevel3Expression, _right ASTLevel2Expression) *ASTBinaryPlus {
	__retval := new(ASTBinaryPlus)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTBinaryPlus) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBinaryPlus)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel2Expression)
		}
	}

	return __retval
}

type ASTBitAnd struct {
	ASTBase

	_left  ASTLevel2Expression
	_right ASTLevel1Expression
}

func NewASTBitAnd(_left ASTLevel2Expression, _right ASTLevel1Expression) *ASTBitAnd {
	__retval := new(ASTBitAnd)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTBitAnd) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBitAnd)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel2Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTBitOr struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel2Expression
}

func NewASTBitOr(_left ASTLevel3Expression, _right ASTLevel2Expression) *ASTBitOr {
	__retval := new(ASTBitOr)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTBitOr) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBitOr)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel2Expression)
		}
	}

	return __retval
}

type ASTBitXor struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel2Expression
}

func NewASTBitXor(_left ASTLevel3Expression, _right ASTLevel2Expression) *ASTBitXor {
	__retval := new(ASTBitXor)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTBitXor) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBitXor)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel2Expression)
		}
	}

	return __retval
}

type ASTBlock struct {
	ASTBase

	_statements []ASTStatement
}

func NewASTBlock(_statements []ASTStatement) *ASTBlock {
	__retval := new(ASTBlock)

	__retval._statements = _statements
	return __retval
}
func (node *ASTBlock) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBlock)

	__retval._statements = node.Copy_statements()

	return __retval
}
func (node *ASTBlock) Copy_statements() (ret []ASTStatement) {

	ret = make([]ASTStatement, len(node._statements))

	for i := range node._statements {
		if node._statements[i] == nil {
			continue
		}
		cp := node._statements[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTStatement)
	}

	return
}

type ASTBreak struct {
	ASTBase

	_label *string
}

func NewASTBreak(_label *string) *ASTBreak {
	__retval := new(ASTBreak)

	__retval._label = _label
	return __retval
}
func (node *ASTBreak) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTBreak)

	__retval._label = new(string)
	*__retval._label = *node._label

	return __retval
}

type ASTChar struct {
	ASTBase

	_str string
}

func NewASTChar(_str string) *ASTChar {
	__retval := new(ASTChar)

	__retval._str = _str
	return __retval
}
func (node *ASTChar) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTChar)

	__retval._str = node._str

	return __retval
}

type ASTContinue struct {
	ASTBase

	_label *string
}

func NewASTContinue(_label *string) *ASTContinue {
	__retval := new(ASTContinue)

	__retval._label = _label
	return __retval
}
func (node *ASTContinue) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTContinue)

	__retval._label = new(string)
	*__retval._label = *node._label

	return __retval
}

type ASTDecimal struct {
	ASTBase

	_str string
}

func NewASTDecimal(_str string) *ASTDecimal {
	__retval := new(ASTDecimal)

	__retval._str = _str
	return __retval
}
func (node *ASTDecimal) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTDecimal)

	__retval._str = node._str

	return __retval
}

type ASTDecrement struct {
	ASTBase

	_lvalue ASTExpression
}

func NewASTDecrement(_lvalue ASTExpression) *ASTDecrement {
	__retval := new(ASTDecrement)

	__retval._lvalue = _lvalue
	return __retval
}
func (node *ASTDecrement) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTDecrement)

	if node._lvalue != nil {
		cp := node._lvalue.Copy()
		if cp != nil {
			__retval._lvalue = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTDefaultCase struct {
	ASTBase

	_body *ASTBlock
}

func NewASTDefaultCase(_body *ASTBlock) *ASTDefaultCase {
	__retval := new(ASTDefaultCase)

	__retval._body = _body
	return __retval
}
func (node *ASTDefaultCase) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTDefaultCase)

	if node._body != nil {
		cp := node._body.Copy()
		if cp != nil {
			__retval._body = cp.(*ASTBlock)
		}
	}

	return __retval
}

type ASTDelete struct {
	ASTBase

	_arg ASTExpression
}

func NewASTDelete(_arg ASTExpression) *ASTDelete {
	__retval := new(ASTDelete)

	__retval._arg = _arg
	return __retval
}
func (node *ASTDelete) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTDelete)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTDeref struct {
	ASTBase

	_arg ASTLevel1Expression
}

func NewASTDeref(_arg ASTLevel1Expression) *ASTDeref {
	__retval := new(ASTDeref)

	__retval._arg = _arg
	return __retval
}
func (node *ASTDeref) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTDeref)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTDiv struct {
	ASTBase

	_left  ASTLevel2Expression
	_right ASTLevel1Expression
}

func NewASTDiv(_left ASTLevel2Expression, _right ASTLevel1Expression) *ASTDiv {
	__retval := new(ASTDiv)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTDiv) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTDiv)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel2Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTElseBranch interface {
	ASTBaseInterface
}
type ASTEnsures struct {
	ASTBase

	_expr ASTExpression
}

func NewASTEnsures(_expr ASTExpression) *ASTEnsures {
	__retval := new(ASTEnsures)

	__retval._expr = _expr
	return __retval
}
func (node *ASTEnsures) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTEnsures)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTEnsuresAll struct {
	ASTBase

	_vars []string
	_expr ASTExpression
}

func NewASTEnsuresAll(_vars []string, _expr ASTExpression) *ASTEnsuresAll {
	__retval := new(ASTEnsuresAll)

	__retval._vars = _vars
	__retval._expr = _expr
	return __retval
}
func (node *ASTEnsuresAll) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTEnsuresAll)

	__retval._vars = node.Copy_vars()
	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}
func (node *ASTEnsuresAll) Copy_vars() (ret []string) {

	ret = make([]string, len(node._vars))

	copy(ret, node._vars)

	return
}

type ASTEqual struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel3Expression
}

func NewASTEqual(_left ASTLevel3Expression, _right ASTLevel3Expression) *ASTEqual {
	__retval := new(ASTEqual)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTEqual) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTEqual)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel3Expression)
		}
	}

	return __retval
}

type ASTExpression interface {
	ASTBaseInterface
}
type ASTFail struct {
	ASTBase

	_code        string
	_description *string
}

func NewASTFail(_code string, _description *string) *ASTFail {
	__retval := new(ASTFail)

	__retval._code = _code
	__retval._description = _description
	return __retval
}
func (node *ASTFail) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTFail)

	__retval._code = node._code
	__retval._description = new(string)
	*__retval._description = *node._description

	return __retval
}

type ASTFailRecover struct {
	ASTBase

	_stmt          ASTRecoverable
	_recover_block *ASTBlock
}

func NewASTFailRecover(_stmt ASTRecoverable, _recover_block *ASTBlock) *ASTFailRecover {
	__retval := new(ASTFailRecover)

	__retval._stmt = _stmt
	__retval._recover_block = _recover_block
	return __retval
}
func (node *ASTFailRecover) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTFailRecover)

	if node._stmt != nil {
		cp := node._stmt.Copy()
		if cp != nil {
			__retval._stmt = cp.(ASTRecoverable)
		}
	}
	if node._recover_block != nil {
		cp := node._recover_block.Copy()
		if cp != nil {
			__retval._recover_block = cp.(*ASTBlock)
		}
	}

	return __retval
}

type ASTFile struct {
	ASTBase

	_globals []ASTGlobal
}

func NewASTFile(_globals []ASTGlobal) *ASTFile {
	__retval := new(ASTFile)

	__retval._globals = _globals
	return __retval
}
func (node *ASTFile) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTFile)

	__retval._globals = node.Copy_globals()

	return __retval
}
func (node *ASTFile) Copy_globals() (ret []ASTGlobal) {

	ret = make([]ASTGlobal, len(node._globals))

	for i := range node._globals {
		if node._globals[i] == nil {
			continue
		}
		cp := node._globals[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTGlobal)
	}

	return
}

type ASTGlobal interface {
	ASTBaseInterface
}
type ASTGreater struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel3Expression
}

func NewASTGreater(_left ASTLevel3Expression, _right ASTLevel3Expression) *ASTGreater {
	__retval := new(ASTGreater)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTGreater) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTGreater)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel3Expression)
		}
	}

	return __retval
}

type ASTGreaterEq struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel3Expression
}

func NewASTGreaterEq(_left ASTLevel3Expression, _right ASTLevel3Expression) *ASTGreaterEq {
	__retval := new(ASTGreaterEq)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTGreaterEq) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTGreaterEq)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel3Expression)
		}
	}

	return __retval
}

type ASTHexaDecimal struct {
	ASTBase

	_str string
}

func NewASTHexaDecimal(_str string) *ASTHexaDecimal {
	__retval := new(ASTHexaDecimal)

	__retval._str = _str
	return __retval
}
func (node *ASTHexaDecimal) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTHexaDecimal)

	__retval._str = node._str

	return __retval
}

type ASTIdentifier struct {
	ASTBase

	_ident string
}

func NewASTIdentifier(_ident string) *ASTIdentifier {
	__retval := new(ASTIdentifier)

	__retval._ident = _ident
	return __retval
}
func (node *ASTIdentifier) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTIdentifier)

	__retval._ident = node._ident

	return __retval
}

type ASTIf struct {
	ASTBase

	_condition    ASTExpression
	_true_branch  *ASTBlock
	_false_branch ASTElseBranch
}

func NewASTIf(_condition ASTExpression, _true_branch *ASTBlock, _false_branch ASTElseBranch) *ASTIf {
	__retval := new(ASTIf)

	__retval._condition = _condition
	__retval._true_branch = _true_branch
	__retval._false_branch = _false_branch
	return __retval
}
func (node *ASTIf) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTIf)

	if node._condition != nil {
		cp := node._condition.Copy()
		if cp != nil {
			__retval._condition = cp.(ASTExpression)
		}
	}
	if node._true_branch != nil {
		cp := node._true_branch.Copy()
		if cp != nil {
			__retval._true_branch = cp.(*ASTBlock)
		}
	}
	if node._false_branch != nil {
		cp := node._false_branch.Copy()
		if cp != nil {
			__retval._false_branch = cp.(ASTElseBranch)
		}
	}

	return __retval
}

type ASTIncrement struct {
	ASTBase

	_lvalue ASTExpression
}

func NewASTIncrement(_lvalue ASTExpression) *ASTIncrement {
	__retval := new(ASTIncrement)

	__retval._lvalue = _lvalue
	return __retval
}
func (node *ASTIncrement) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTIncrement)

	if node._lvalue != nil {
		cp := node._lvalue.Copy()
		if cp != nil {
			__retval._lvalue = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTIndexed struct {
	ASTBase

	_base  ASTLevel0Expression
	_index ASTExpression
}

func NewASTIndexed(_base ASTLevel0Expression, _index ASTExpression) *ASTIndexed {
	__retval := new(ASTIndexed)

	__retval._base = _base
	__retval._index = _index
	return __retval
}
func (node *ASTIndexed) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTIndexed)

	if node._base != nil {
		cp := node._base.Copy()
		if cp != nil {
			__retval._base = cp.(ASTLevel0Expression)
		}
	}
	if node._index != nil {
		cp := node._index.Copy()
		if cp != nil {
			__retval._index = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTInequal struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel3Expression
}

func NewASTInequal(_left ASTLevel3Expression, _right ASTLevel3Expression) *ASTInequal {
	__retval := new(ASTInequal)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTInequal) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTInequal)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel3Expression)
		}
	}

	return __retval
}

type ASTInterfaceMember struct {
	ASTBase

	_name      string
	_signature *ASTMethodSignature
}

func NewASTInterfaceMember(_name string, _signature *ASTMethodSignature) *ASTInterfaceMember {
	__retval := new(ASTInterfaceMember)

	__retval._name = _name
	__retval._signature = _signature
	return __retval
}
func (node *ASTInterfaceMember) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTInterfaceMember)

	__retval._name = node._name
	if node._signature != nil {
		cp := node._signature.Copy()
		if cp != nil {
			__retval._signature = cp.(*ASTMethodSignature)
		}
	}

	return __retval
}

type ASTInterfaceType struct {
	ASTBase

	_members []*ASTInterfaceMember
}

func NewASTInterfaceType(_members []*ASTInterfaceMember) *ASTInterfaceType {
	__retval := new(ASTInterfaceType)

	__retval._members = _members
	return __retval
}
func (node *ASTInterfaceType) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTInterfaceType)

	__retval._members = node.Copy_members()

	return __retval
}
func (node *ASTInterfaceType) Copy_members() (ret []*ASTInterfaceMember) {

	ret = make([]*ASTInterfaceMember, len(node._members))

	for i := range node._members {
		if node._members[i] == nil {
			continue
		}
		cp := node._members[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(*ASTInterfaceMember)
	}

	return
}

type ASTInvariant struct {
	ASTBase

	_expr ASTExpression
}

func NewASTInvariant(_expr ASTExpression) *ASTInvariant {
	__retval := new(ASTInvariant)

	__retval._expr = _expr
	return __retval
}
func (node *ASTInvariant) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTInvariant)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTInvariantAll struct {
	ASTBase

	_vars []string
	_expr ASTExpression
}

func NewASTInvariantAll(_vars []string, _expr ASTExpression) *ASTInvariantAll {
	__retval := new(ASTInvariantAll)

	__retval._vars = _vars
	__retval._expr = _expr
	return __retval
}
func (node *ASTInvariantAll) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTInvariantAll)

	__retval._vars = node.Copy_vars()
	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}
func (node *ASTInvariantAll) Copy_vars() (ret []string) {

	ret = make([]string, len(node._vars))

	copy(ret, node._vars)

	return
}

type ASTIs struct {
	ASTBase

	_arg  ASTLevel3Expression
	_type ASTType
}

func NewASTIs(_arg ASTLevel3Expression, _type ASTType) *ASTIs {
	__retval := new(ASTIs)

	__retval._arg = _arg
	__retval._type = _type
	return __retval
}
func (node *ASTIs) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTIs)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel3Expression)
		}
	}
	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTType)
		}
	}

	return __retval
}

type ASTLShift struct {
	ASTBase

	_left  ASTLevel2Expression
	_right ASTLevel1Expression
}

func NewASTLShift(_left ASTLevel2Expression, _right ASTLevel1Expression) *ASTLShift {
	__retval := new(ASTLShift)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTLShift) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTLShift)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel2Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTLess struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel3Expression
}

func NewASTLess(_left ASTLevel3Expression, _right ASTLevel3Expression) *ASTLess {
	__retval := new(ASTLess)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTLess) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTLess)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel3Expression)
		}
	}

	return __retval
}

type ASTLessEq struct {
	ASTBase

	_left  ASTLevel3Expression
	_right ASTLevel3Expression
}

func NewASTLessEq(_left ASTLevel3Expression, _right ASTLevel3Expression) *ASTLessEq {
	__retval := new(ASTLessEq)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTLessEq) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTLessEq)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel3Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel3Expression)
		}
	}

	return __retval
}

type ASTLevel0Expression interface {
	ASTBaseInterface
}
type ASTLevel1Expression interface {
	ASTBaseInterface
}
type ASTLevel2Expression interface {
	ASTBaseInterface
}
type ASTLevel3Expression interface {
	ASTBaseInterface
}
type ASTLevel4Expression interface {
	ASTBaseInterface
}
type ASTLevel5Expression interface {
	ASTBaseInterface
}
type ASTLiteral interface {
	ASTBaseInterface
}
type ASTLoopBound struct {
	ASTBase

	_expr ASTExpression
}

func NewASTLoopBound(_expr ASTExpression) *ASTLoopBound {
	__retval := new(ASTLoopBound)

	__retval._expr = _expr
	return __retval
}
func (node *ASTLoopBound) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTLoopBound)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTMayFail struct {
	ASTBase

	_fail_list []string
}

func NewASTMayFail(_fail_list []string) *ASTMayFail {
	__retval := new(ASTMayFail)

	__retval._fail_list = _fail_list
	return __retval
}
func (node *ASTMayFail) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTMayFail)

	__retval._fail_list = node.Copy_fail_list()

	return __retval
}
func (node *ASTMayFail) Copy_fail_list() (ret []string) {

	ret = make([]string, len(node._fail_list))

	copy(ret, node._fail_list)

	return
}

type ASTMethod struct {
	ASTBase

	_receiver  *ASTParameter
	_name      string
	_signature *ASTMethodSignature
	_contracts []ASTMethodContract
	_body      *ASTBlock
}

func NewASTMethod(_receiver *ASTParameter, _name string, _signature *ASTMethodSignature, _contracts []ASTMethodContract, _body *ASTBlock) *ASTMethod {
	__retval := new(ASTMethod)

	__retval._receiver = _receiver
	__retval._name = _name
	__retval._signature = _signature
	__retval._contracts = _contracts
	__retval._body = _body
	return __retval
}
func (node *ASTMethod) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTMethod)

	if node._receiver != nil {
		cp := node._receiver.Copy()
		if cp != nil {
			__retval._receiver = cp.(*ASTParameter)
		}
	}
	__retval._name = node._name
	if node._signature != nil {
		cp := node._signature.Copy()
		if cp != nil {
			__retval._signature = cp.(*ASTMethodSignature)
		}
	}
	__retval._contracts = node.Copy_contracts()
	if node._body != nil {
		cp := node._body.Copy()
		if cp != nil {
			__retval._body = cp.(*ASTBlock)
		}
	}

	return __retval
}
func (node *ASTMethod) Copy_contracts() (ret []ASTMethodContract) {

	ret = make([]ASTMethodContract, len(node._contracts))

	for i := range node._contracts {
		if node._contracts[i] == nil {
			continue
		}
		cp := node._contracts[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTMethodContract)
	}

	return
}

type ASTMethodCall struct {
	ASTBase

	_receiver ASTLevel0Expression
	_method   string
	_args     []ASTExpression
}

func NewASTMethodCall(_receiver ASTLevel0Expression, _method string, _args []ASTExpression) *ASTMethodCall {
	__retval := new(ASTMethodCall)

	__retval._receiver = _receiver
	__retval._method = _method
	__retval._args = _args
	return __retval
}
func (node *ASTMethodCall) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTMethodCall)

	if node._receiver != nil {
		cp := node._receiver.Copy()
		if cp != nil {
			__retval._receiver = cp.(ASTLevel0Expression)
		}
	}
	__retval._method = node._method
	__retval._args = node.Copy_args()

	return __retval
}
func (node *ASTMethodCall) Copy_args() (ret []ASTExpression) {

	ret = make([]ASTExpression, len(node._args))

	for i := range node._args {
		if node._args[i] == nil {
			continue
		}
		cp := node._args[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTExpression)
	}

	return
}

type ASTMethodContract interface {
	ASTBaseInterface
}
type ASTMethodSignature struct {
	ASTBase

	_in_params  []*ASTParameter
	_out_params []*ASTParameter
}

func NewASTMethodSignature(_in_params []*ASTParameter, _out_params []*ASTParameter) *ASTMethodSignature {
	__retval := new(ASTMethodSignature)

	__retval._in_params = _in_params
	__retval._out_params = _out_params
	return __retval
}
func (node *ASTMethodSignature) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTMethodSignature)

	__retval._in_params = node.Copy_in_params()
	__retval._out_params = node.Copy_out_params()

	return __retval
}
func (node *ASTMethodSignature) Copy_in_params() (ret []*ASTParameter) {

	ret = make([]*ASTParameter, len(node._in_params))

	for i := range node._in_params {
		if node._in_params[i] == nil {
			continue
		}
		cp := node._in_params[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(*ASTParameter)
	}

	return
}
func (node *ASTMethodSignature) Copy_out_params() (ret []*ASTParameter) {

	ret = make([]*ASTParameter, len(node._out_params))

	for i := range node._out_params {
		if node._out_params[i] == nil {
			continue
		}
		cp := node._out_params[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(*ASTParameter)
	}

	return
}

type ASTMod struct {
	ASTBase

	_left  ASTLevel2Expression
	_right ASTLevel1Expression
}

func NewASTMod(_left ASTLevel2Expression, _right ASTLevel1Expression) *ASTMod {
	__retval := new(ASTMod)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTMod) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTMod)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel2Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTMult struct {
	ASTBase

	_left  ASTLevel2Expression
	_right ASTLevel1Expression
}

func NewASTMult(_left ASTLevel2Expression, _right ASTLevel1Expression) *ASTMult {
	__retval := new(ASTMult)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTMult) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTMult)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel2Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTNamedType interface {
	ASTBaseInterface
}
type ASTNew struct {
	ASTBase

	_type ASTType
}

func NewASTNew(_type ASTType) *ASTNew {
	__retval := new(ASTNew)

	__retval._type = _type
	return __retval
}
func (node *ASTNew) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTNew)

	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTType)
		}
	}

	return __retval
}

type ASTNewArray struct {
	ASTBase

	_length ASTExpression
	_type   ASTType
}

func NewASTNewArray(_length ASTExpression, _type ASTType) *ASTNewArray {
	__retval := new(ASTNewArray)

	__retval._length = _length
	__retval._type = _type
	return __retval
}
func (node *ASTNewArray) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTNewArray)

	if node._length != nil {
		cp := node._length.Copy()
		if cp != nil {
			__retval._length = cp.(ASTExpression)
		}
	}
	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTType)
		}
	}

	return __retval
}

type ASTNot struct {
	ASTBase

	_arg ASTLevel1Expression
}

func NewASTNot(_arg ASTLevel1Expression) *ASTNot {
	__retval := new(ASTNot)

	__retval._arg = _arg
	return __retval
}
func (node *ASTNot) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTNot)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTOctal struct {
	ASTBase

	_str string
}

func NewASTOctal(_str string) *ASTOctal {
	__retval := new(ASTOctal)

	__retval._str = _str
	return __retval
}
func (node *ASTOctal) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTOctal)

	__retval._str = node._str

	return __retval
}

type ASTOr struct {
	ASTBase

	_left  ASTExpression
	_right ASTLevel5Expression
}

func NewASTOr(_left ASTExpression, _right ASTLevel5Expression) *ASTOr {
	__retval := new(ASTOr)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTOr) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTOr)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTExpression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel5Expression)
		}
	}

	return __retval
}

type ASTPExpression struct {
	ASTBase

	_expr ASTExpression
}

func NewASTPExpression(_expr ASTExpression) *ASTPExpression {
	__retval := new(ASTPExpression)

	__retval._expr = _expr
	return __retval
}
func (node *ASTPExpression) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTPExpression)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTParameter struct {
	ASTBase

	_name *string
	_type ASTType
}

func NewASTParameter(_name *string, _type ASTType) *ASTParameter {
	__retval := new(ASTParameter)

	__retval._name = _name
	__retval._type = _type
	return __retval
}
func (node *ASTParameter) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTParameter)

	__retval._name = new(string)
	*__retval._name = *node._name
	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTType)
		}
	}

	return __retval
}

type ASTPointerType struct {
	ASTBase

	_inner_type ASTType
	_nullable   bool
	_owned      bool
}

func NewASTPointerType(_inner_type ASTType, _nullable bool, _owned bool) *ASTPointerType {
	__retval := new(ASTPointerType)

	__retval._inner_type = _inner_type
	__retval._nullable = _nullable
	__retval._owned = _owned
	return __retval
}
func (node *ASTPointerType) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTPointerType)

	if node._inner_type != nil {
		cp := node._inner_type.Copy()
		if cp != nil {
			__retval._inner_type = cp.(ASTType)
		}
	}
	__retval._nullable = node._nullable
	__retval._owned = node._owned

	return __retval
}

type ASTRShift struct {
	ASTBase

	_left  ASTLevel2Expression
	_right ASTLevel1Expression
}

func NewASTRShift(_left ASTLevel2Expression, _right ASTLevel1Expression) *ASTRShift {
	__retval := new(ASTRShift)

	__retval._left = _left
	__retval._right = _right
	return __retval
}
func (node *ASTRShift) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTRShift)

	if node._left != nil {
		cp := node._left.Copy()
		if cp != nil {
			__retval._left = cp.(ASTLevel2Expression)
		}
	}
	if node._right != nil {
		cp := node._right.Copy()
		if cp != nil {
			__retval._right = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTRangeType struct {
	ASTBase

	_low  ASTExpression
	_high ASTExpression
}

func NewASTRangeType(_low ASTExpression, _high ASTExpression) *ASTRangeType {
	__retval := new(ASTRangeType)

	__retval._low = _low
	__retval._high = _high
	return __retval
}
func (node *ASTRangeType) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTRangeType)

	if node._low != nil {
		cp := node._low.Copy()
		if cp != nil {
			__retval._low = cp.(ASTExpression)
		}
	}
	if node._high != nil {
		cp := node._high.Copy()
		if cp != nil {
			__retval._high = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTRecoverable interface {
	ASTBaseInterface
}
type ASTRecursionBound struct {
	ASTBase

	_expr ASTExpression
}

func NewASTRecursionBound(_expr ASTExpression) *ASTRecursionBound {
	__retval := new(ASTRecursionBound)

	__retval._expr = _expr
	return __retval
}
func (node *ASTRecursionBound) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTRecursionBound)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTRef struct {
	ASTBase

	_arg ASTLevel1Expression
}

func NewASTRef(_arg ASTLevel1Expression) *ASTRef {
	__retval := new(ASTRef)

	__retval._arg = _arg
	return __retval
}
func (node *ASTRef) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTRef)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTRequires struct {
	ASTBase

	_expr ASTExpression
}

func NewASTRequires(_expr ASTExpression) *ASTRequires {
	__retval := new(ASTRequires)

	__retval._expr = _expr
	return __retval
}
func (node *ASTRequires) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTRequires)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTRequiresAll struct {
	ASTBase

	_vars []string
	_expr ASTExpression
}

func NewASTRequiresAll(_vars []string, _expr ASTExpression) *ASTRequiresAll {
	__retval := new(ASTRequiresAll)

	__retval._vars = _vars
	__retval._expr = _expr
	return __retval
}
func (node *ASTRequiresAll) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTRequiresAll)

	__retval._vars = node.Copy_vars()
	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}
func (node *ASTRequiresAll) Copy_vars() (ret []string) {

	ret = make([]string, len(node._vars))

	copy(ret, node._vars)

	return
}

type ASTReturn struct {
	ASTBase

	_retvals []ASTExpression
}

func NewASTReturn(_retvals []ASTExpression) *ASTReturn {
	__retval := new(ASTReturn)

	__retval._retvals = _retvals
	return __retval
}
func (node *ASTReturn) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTReturn)

	__retval._retvals = node.Copy_retvals()

	return __retval
}
func (node *ASTReturn) Copy_retvals() (ret []ASTExpression) {

	ret = make([]ASTExpression, len(node._retvals))

	for i := range node._retvals {
		if node._retvals[i] == nil {
			continue
		}
		cp := node._retvals[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTExpression)
	}

	return
}

type ASTSanityCheck struct {
	ASTBase

	_expr ASTExpression
}

func NewASTSanityCheck(_expr ASTExpression) *ASTSanityCheck {
	__retval := new(ASTSanityCheck)

	__retval._expr = _expr
	return __retval
}
func (node *ASTSanityCheck) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTSanityCheck)

	if node._expr != nil {
		cp := node._expr.Copy()
		if cp != nil {
			__retval._expr = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTSelectionType struct {
	ASTBase

	_types []ASTType
}

func NewASTSelectionType(_types []ASTType) *ASTSelectionType {
	__retval := new(ASTSelectionType)

	__retval._types = _types
	return __retval
}
func (node *ASTSelectionType) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTSelectionType)

	__retval._types = node.Copy_types()

	return __retval
}
func (node *ASTSelectionType) Copy_types() (ret []ASTType) {

	ret = make([]ASTType, len(node._types))

	for i := range node._types {
		if node._types[i] == nil {
			continue
		}
		cp := node._types[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTType)
	}

	return
}

type ASTSelector struct {
	ASTBase

	_base     ASTLevel0Expression
	_selector string
}

func NewASTSelector(_base ASTLevel0Expression, _selector string) *ASTSelector {
	__retval := new(ASTSelector)

	__retval._base = _base
	__retval._selector = _selector
	return __retval
}
func (node *ASTSelector) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTSelector)

	if node._base != nil {
		cp := node._base.Copy()
		if cp != nil {
			__retval._base = cp.(ASTLevel0Expression)
		}
	}
	__retval._selector = node._selector

	return __retval
}

type ASTStatement interface {
	ASTBaseInterface
}
type ASTString struct {
	ASTBase

	_str string
}

func NewASTString(_str string) *ASTString {
	__retval := new(ASTString)

	__retval._str = _str
	return __retval
}
func (node *ASTString) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTString)

	__retval._str = node._str

	return __retval
}

type ASTStructMember struct {
	ASTBase

	_name *string
	_type ASTType
}

func NewASTStructMember(_name *string, _type ASTType) *ASTStructMember {
	__retval := new(ASTStructMember)

	__retval._name = _name
	__retval._type = _type
	return __retval
}
func (node *ASTStructMember) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTStructMember)

	__retval._name = new(string)
	*__retval._name = *node._name
	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTType)
		}
	}

	return __retval
}

type ASTStructType struct {
	ASTBase

	_members []*ASTStructMember
}

func NewASTStructType(_members []*ASTStructMember) *ASTStructType {
	__retval := new(ASTStructType)

	__retval._members = _members
	return __retval
}
func (node *ASTStructType) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTStructType)

	__retval._members = node.Copy_members()

	return __retval
}
func (node *ASTStructType) Copy_members() (ret []*ASTStructMember) {

	ret = make([]*ASTStructMember, len(node._members))

	for i := range node._members {
		if node._members[i] == nil {
			continue
		}
		cp := node._members[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(*ASTStructMember)
	}

	return
}

type ASTSwitch struct {
	ASTBase

	_discriminant ASTExpression
	_cases        []*ASTSwitchCase
	_default      *ASTDefaultCase
}

func NewASTSwitch(_discriminant ASTExpression, _cases []*ASTSwitchCase, _default *ASTDefaultCase) *ASTSwitch {
	__retval := new(ASTSwitch)

	__retval._discriminant = _discriminant
	__retval._cases = _cases
	__retval._default = _default
	return __retval
}
func (node *ASTSwitch) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTSwitch)

	if node._discriminant != nil {
		cp := node._discriminant.Copy()
		if cp != nil {
			__retval._discriminant = cp.(ASTExpression)
		}
	}
	__retval._cases = node.Copy_cases()
	if node._default != nil {
		cp := node._default.Copy()
		if cp != nil {
			__retval._default = cp.(*ASTDefaultCase)
		}
	}

	return __retval
}
func (node *ASTSwitch) Copy_cases() (ret []*ASTSwitchCase) {

	ret = make([]*ASTSwitchCase, len(node._cases))

	for i := range node._cases {
		if node._cases[i] == nil {
			continue
		}
		cp := node._cases[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(*ASTSwitchCase)
	}

	return
}

type ASTSwitchCase struct {
	ASTBase

	_matches []ASTExpression
	_body    *ASTBlock
}

func NewASTSwitchCase(_matches []ASTExpression, _body *ASTBlock) *ASTSwitchCase {
	__retval := new(ASTSwitchCase)

	__retval._matches = _matches
	__retval._body = _body
	return __retval
}
func (node *ASTSwitchCase) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTSwitchCase)

	__retval._matches = node.Copy_matches()
	if node._body != nil {
		cp := node._body.Copy()
		if cp != nil {
			__retval._body = cp.(*ASTBlock)
		}
	}

	return __retval
}
func (node *ASTSwitchCase) Copy_matches() (ret []ASTExpression) {

	ret = make([]ASTExpression, len(node._matches))

	for i := range node._matches {
		if node._matches[i] == nil {
			continue
		}
		cp := node._matches[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTExpression)
	}

	return
}

type ASTTake struct {
	ASTBase

	_arg ASTLevel1Expression
}

func NewASTTake(_arg ASTLevel1Expression) *ASTTake {
	__retval := new(ASTTake)

	__retval._arg = _arg
	return __retval
}
func (node *ASTTake) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTTake)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTType interface {
	ASTBaseInterface
}
type ASTTypeRef struct {
	ASTBase

	_package *string
	_name    string
}

func NewASTTypeRef(_package *string, _name string) *ASTTypeRef {
	__retval := new(ASTTypeRef)

	__retval._package = _package
	__retval._name = _name
	return __retval
}
func (node *ASTTypeRef) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTTypeRef)

	__retval._package = new(string)
	*__retval._package = *node._package
	__retval._name = node._name

	return __retval
}

type ASTTypeSwitch struct {
	ASTBase

	_discriminant ASTExpression
	_cases        []*ASTTypeSwitchCase
	_default      *ASTDefaultCase
}

func NewASTTypeSwitch(_discriminant ASTExpression, _cases []*ASTTypeSwitchCase, _default *ASTDefaultCase) *ASTTypeSwitch {
	__retval := new(ASTTypeSwitch)

	__retval._discriminant = _discriminant
	__retval._cases = _cases
	__retval._default = _default
	return __retval
}
func (node *ASTTypeSwitch) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTTypeSwitch)

	if node._discriminant != nil {
		cp := node._discriminant.Copy()
		if cp != nil {
			__retval._discriminant = cp.(ASTExpression)
		}
	}
	__retval._cases = node.Copy_cases()
	if node._default != nil {
		cp := node._default.Copy()
		if cp != nil {
			__retval._default = cp.(*ASTDefaultCase)
		}
	}

	return __retval
}
func (node *ASTTypeSwitch) Copy_cases() (ret []*ASTTypeSwitchCase) {

	ret = make([]*ASTTypeSwitchCase, len(node._cases))

	for i := range node._cases {
		if node._cases[i] == nil {
			continue
		}
		cp := node._cases[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(*ASTTypeSwitchCase)
	}

	return
}

type ASTTypeSwitchCase struct {
	ASTBase

	_types []ASTType
	_body  *ASTBlock
}

func NewASTTypeSwitchCase(_types []ASTType, _body *ASTBlock) *ASTTypeSwitchCase {
	__retval := new(ASTTypeSwitchCase)

	__retval._types = _types
	__retval._body = _body
	return __retval
}
func (node *ASTTypeSwitchCase) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTTypeSwitchCase)

	__retval._types = node.Copy_types()
	if node._body != nil {
		cp := node._body.Copy()
		if cp != nil {
			__retval._body = cp.(*ASTBlock)
		}
	}

	return __retval
}
func (node *ASTTypeSwitchCase) Copy_types() (ret []ASTType) {

	ret = make([]ASTType, len(node._types))

	for i := range node._types {
		if node._types[i] == nil {
			continue
		}
		cp := node._types[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTType)
	}

	return
}

type ASTTypedef struct {
	ASTBase

	_name string
	_type ASTNamedType
}

func NewASTTypedef(_name string, _type ASTNamedType) *ASTTypedef {
	__retval := new(ASTTypedef)

	__retval._name = _name
	__retval._type = _type
	return __retval
}
func (node *ASTTypedef) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTTypedef)

	__retval._name = node._name
	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTNamedType)
		}
	}

	return __retval
}

type ASTUnaryMinus struct {
	ASTBase

	_arg ASTLevel1Expression
}

func NewASTUnaryMinus(_arg ASTLevel1Expression) *ASTUnaryMinus {
	__retval := new(ASTUnaryMinus)

	__retval._arg = _arg
	return __retval
}
func (node *ASTUnaryMinus) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTUnaryMinus)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTUnaryPlus struct {
	ASTBase

	_arg ASTLevel1Expression
}

func NewASTUnaryPlus(_arg ASTLevel1Expression) *ASTUnaryPlus {
	__retval := new(ASTUnaryPlus)

	__retval._arg = _arg
	return __retval
}
func (node *ASTUnaryPlus) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTUnaryPlus)

	if node._arg != nil {
		cp := node._arg.Copy()
		if cp != nil {
			__retval._arg = cp.(ASTLevel1Expression)
		}
	}

	return __retval
}

type ASTVardecl struct {
	ASTBase

	_name        string
	_initializer ASTExpression
}

func NewASTVardecl(_name string, _initializer ASTExpression) *ASTVardecl {
	__retval := new(ASTVardecl)

	__retval._name = _name
	__retval._initializer = _initializer
	return __retval
}
func (node *ASTVardecl) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTVardecl)

	__retval._name = node._name
	if node._initializer != nil {
		cp := node._initializer.Copy()
		if cp != nil {
			__retval._initializer = cp.(ASTExpression)
		}
	}

	return __retval
}

type ASTVardeclTyped struct {
	ASTBase

	_names []string
	_type  ASTType
}

func NewASTVardeclTyped(_names []string, _type ASTType) *ASTVardeclTyped {
	__retval := new(ASTVardeclTyped)

	__retval._names = _names
	__retval._type = _type
	return __retval
}
func (node *ASTVardeclTyped) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTVardeclTyped)

	__retval._names = node.Copy_names()
	if node._type != nil {
		cp := node._type.Copy()
		if cp != nil {
			__retval._type = cp.(ASTType)
		}
	}

	return __retval
}
func (node *ASTVardeclTyped) Copy_names() (ret []string) {

	ret = make([]string, len(node._names))

	copy(ret, node._names)

	return
}

type ASTWhile struct {
	ASTBase

	_label     *string
	_condition ASTExpression
	_contracts []ASTWhileContract
	_body      *ASTBlock
}

func NewASTWhile(_label *string, _condition ASTExpression, _contracts []ASTWhileContract, _body *ASTBlock) *ASTWhile {
	__retval := new(ASTWhile)

	__retval._label = _label
	__retval._condition = _condition
	__retval._contracts = _contracts
	__retval._body = _body
	return __retval
}
func (node *ASTWhile) Copy() ASTBaseInterface {

	if node == nil {
		return nil
	}

	__retval := new(ASTWhile)

	__retval._label = new(string)
	*__retval._label = *node._label
	if node._condition != nil {
		cp := node._condition.Copy()
		if cp != nil {
			__retval._condition = cp.(ASTExpression)
		}
	}
	__retval._contracts = node.Copy_contracts()
	if node._body != nil {
		cp := node._body.Copy()
		if cp != nil {
			__retval._body = cp.(*ASTBlock)
		}
	}

	return __retval
}
func (node *ASTWhile) Copy_contracts() (ret []ASTWhileContract) {

	ret = make([]ASTWhileContract, len(node._contracts))

	for i := range node._contracts {
		if node._contracts[i] == nil {
			continue
		}
		cp := node._contracts[i].Copy()
		if cp == nil {
			continue
		}
		ret[i] = cp.(ASTWhileContract)
	}

	return
}

type ASTWhileContract interface {
	ASTBaseInterface
}

func ParseASTAnd(p *spl.SeqParser) (ret *ASTAnd, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAnd: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTAnd)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAnd: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel5Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAnd: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel4Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTAnd: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTArrayType(p *spl.SeqParser) (ret *ASTArrayType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTArrayType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTArrayType)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTArrayType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._length, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTArrayType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._element_type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTArrayType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTAssert(p *spl.SeqParser) (ret *ASTAssert, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssert: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTAssert)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAssert: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTAssert: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTAssertAll(p *spl.SeqParser) (ret *ASTAssertAll, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssertAll: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTAssertAll)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAssertAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._vars, err = ParseASTAssertAll_vars(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAssertAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTAssertAll: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTAssertAll_vars(p *spl.SeqParser) (ret []string, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssertAll_vars: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		ret = append(ret, p.String())
	}

	p.Up()

	return
}
func ParseASTAssignment(p *spl.SeqParser) (ret *ASTAssignment, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssignment: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTAssignment)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAssignment: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._rvalues, err = ParseASTAssignment_rvalues(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAssignment: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._lvalues, err = ParseASTAssignment_lvalues(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTAssignment: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTAssignment_rvalues(p *spl.SeqParser) (ret []ASTExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssignment_rvalues: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTExpression(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTAssignment_lvalues(p *spl.SeqParser) (ret []ASTExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssignment_lvalues: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTExpression(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTAssume(p *spl.SeqParser) (ret *ASTAssume, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTAssume: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTAssume)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTAssume: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTAssume: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBinaryMinus(p *spl.SeqParser) (ret *ASTBinaryMinus, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBinaryMinus: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBinaryMinus)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBinaryMinus: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBinaryMinus: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBinaryMinus: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBinaryPlus(p *spl.SeqParser) (ret *ASTBinaryPlus, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBinaryPlus: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBinaryPlus)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBinaryPlus: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBinaryPlus: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBinaryPlus: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBitAnd(p *spl.SeqParser) (ret *ASTBitAnd, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBitAnd: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBitAnd)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBitAnd: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBitAnd: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBitAnd: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBitOr(p *spl.SeqParser) (ret *ASTBitOr, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBitOr: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBitOr)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBitOr: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBitOr: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBitOr: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBitXor(p *spl.SeqParser) (ret *ASTBitXor, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBitXor: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBitXor)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBitXor: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBitXor: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBitXor: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBlock(p *spl.SeqParser) (ret *ASTBlock, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBlock: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBlock)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBlock: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._statements, err = ParseASTBlock_statements(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBlock: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTBlock_statements(p *spl.SeqParser) (ret []ASTStatement, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBlock_statements: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTStatement(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTBreak(p *spl.SeqParser) (ret *ASTBreak, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTBreak: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTBreak)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTBreak: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._label = &s
	} else {
		p.Skip()
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTBreak: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTChar(p *spl.SeqParser) (ret *ASTChar, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTChar: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTChar)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTChar: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._str = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTChar: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTContinue(p *spl.SeqParser) (ret *ASTContinue, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTContinue: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTContinue)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTContinue: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._label = &s
	} else {
		p.Skip()
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTContinue: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTDecimal(p *spl.SeqParser) (ret *ASTDecimal, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTDecimal: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTDecimal)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDecimal: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._str = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTDecimal: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTDecrement(p *spl.SeqParser) (ret *ASTDecrement, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTDecrement: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTDecrement)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDecrement: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._lvalue, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTDecrement: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTDefaultCase(p *spl.SeqParser) (ret *ASTDefaultCase, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTDefaultCase: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTDefaultCase)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDefaultCase: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._body, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTDefaultCase: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTDelete(p *spl.SeqParser) (ret *ASTDelete, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTDelete: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTDelete)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDelete: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTDelete: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTDeref(p *spl.SeqParser) (ret *ASTDeref, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTDeref: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTDeref)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDeref: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTDeref: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTDiv(p *spl.SeqParser) (ret *ASTDiv, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTDiv: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTDiv)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDiv: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTDiv: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTDiv: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTElseBranch(p *spl.SeqParser) (ret ASTElseBranch, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTElseBranch: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTElseBranch: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTElseBranch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Block":
		ret, err = ParseASTBlock(p)
	case "If":
		ret, err = ParseASTIf(p)
	default:
		err = fmt.Errorf("ParseASTElseBranch: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTElseBranch: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTEnsures(p *spl.SeqParser) (ret *ASTEnsures, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTEnsures: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTEnsures)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTEnsures: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTEnsures: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTEnsuresAll(p *spl.SeqParser) (ret *ASTEnsuresAll, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTEnsuresAll: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTEnsuresAll)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTEnsuresAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._vars, err = ParseASTEnsuresAll_vars(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTEnsuresAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTEnsuresAll: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTEnsuresAll_vars(p *spl.SeqParser) (ret []string, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTEnsuresAll_vars: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		ret = append(ret, p.String())
	}

	p.Up()

	return
}
func ParseASTEqual(p *spl.SeqParser) (ret *ASTEqual, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTEqual: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTEqual)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTEqual: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTEqual: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTEqual: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTExpression(p *spl.SeqParser) (ret ASTExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTExpression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTExpression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTExpression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Or":
		ret, err = ParseASTOr(p)
	case "And":
		ret, err = ParseASTAnd(p)
	case "Less":
		ret, err = ParseASTLess(p)
	case "LessEq":
		ret, err = ParseASTLessEq(p)
	case "Greater":
		ret, err = ParseASTGreater(p)
	case "GreaterEq":
		ret, err = ParseASTGreaterEq(p)
	case "Equal":
		ret, err = ParseASTEqual(p)
	case "Inequal":
		ret, err = ParseASTInequal(p)
	case "Is":
		ret, err = ParseASTIs(p)
	case "BinaryPlus":
		ret, err = ParseASTBinaryPlus(p)
	case "BinaryMinus":
		ret, err = ParseASTBinaryMinus(p)
	case "BitOr":
		ret, err = ParseASTBitOr(p)
	case "BitXor":
		ret, err = ParseASTBitXor(p)
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTExpression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTExpression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTFail(p *spl.SeqParser) (ret *ASTFail, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTFail: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTFail)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTFail: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._code = p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTFail: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._description = &s
	} else {
		p.Skip()
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTFail: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTFailRecover(p *spl.SeqParser) (ret *ASTFailRecover, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTFailRecover: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTFailRecover)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTFailRecover: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._stmt, err = ParseASTRecoverable(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTFailRecover: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._recover_block, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTFailRecover: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTFile(p *spl.SeqParser) (ret *ASTFile, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTFile: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTFile)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTFile: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._globals, err = ParseASTFile_globals(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTFile: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTFile_globals(p *spl.SeqParser) (ret []ASTGlobal, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTFile_globals: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTGlobal(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTGlobal(p *spl.SeqParser) (ret ASTGlobal, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTGlobal: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTGlobal: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTGlobal: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Method":
		ret, err = ParseASTMethod(p)
	case "Typedef":
		ret, err = ParseASTTypedef(p)
	default:
		err = fmt.Errorf("ParseASTGlobal: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTGlobal: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTGreater(p *spl.SeqParser) (ret *ASTGreater, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTGreater: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTGreater)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTGreater: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTGreater: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTGreater: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTGreaterEq(p *spl.SeqParser) (ret *ASTGreaterEq, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTGreaterEq: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTGreaterEq)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTGreaterEq: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTGreaterEq: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTGreaterEq: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTHexaDecimal(p *spl.SeqParser) (ret *ASTHexaDecimal, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTHexaDecimal: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTHexaDecimal)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTHexaDecimal: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._str = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTHexaDecimal: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTIdentifier(p *spl.SeqParser) (ret *ASTIdentifier, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTIdentifier: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTIdentifier)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIdentifier: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._ident = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTIdentifier: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTIf(p *spl.SeqParser) (ret *ASTIf, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTIf: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTIf)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIf: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._condition, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIf: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._true_branch, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIf: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._false_branch, err = ParseASTElseBranch(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTIf: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTIncrement(p *spl.SeqParser) (ret *ASTIncrement, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTIncrement: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTIncrement)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIncrement: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._lvalue, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTIncrement: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTIndexed(p *spl.SeqParser) (ret *ASTIndexed, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTIndexed: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTIndexed)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIndexed: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._base, err = ParseASTLevel0Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIndexed: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._index, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTIndexed: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTInequal(p *spl.SeqParser) (ret *ASTInequal, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInequal: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTInequal)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInequal: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInequal: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTInequal: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTInterfaceMember(p *spl.SeqParser) (ret *ASTInterfaceMember, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInterfaceMember: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTInterfaceMember)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInterfaceMember: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._name = p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInterfaceMember: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._signature, err = ParseASTMethodSignature(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTInterfaceMember: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTInterfaceType(p *spl.SeqParser) (ret *ASTInterfaceType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInterfaceType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTInterfaceType)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInterfaceType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._members, err = ParseASTInterfaceType_members(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTInterfaceType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTInterfaceType_members(p *spl.SeqParser) (ret []*ASTInterfaceMember, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInterfaceType_members: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTInterfaceMember(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTInvariant(p *spl.SeqParser) (ret *ASTInvariant, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInvariant: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTInvariant)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInvariant: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTInvariant: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTInvariantAll(p *spl.SeqParser) (ret *ASTInvariantAll, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInvariantAll: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTInvariantAll)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInvariantAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._vars, err = ParseASTInvariantAll_vars(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTInvariantAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTInvariantAll: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTInvariantAll_vars(p *spl.SeqParser) (ret []string, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTInvariantAll_vars: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		ret = append(ret, p.String())
	}

	p.Up()

	return
}
func ParseASTIs(p *spl.SeqParser) (ret *ASTIs, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTIs: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTIs)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIs: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTIs: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTIs: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTLShift(p *spl.SeqParser) (ret *ASTLShift, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLShift: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTLShift)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLShift: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLShift: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLShift: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTLess(p *spl.SeqParser) (ret *ASTLess, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLess: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTLess)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLess: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLess: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLess: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTLessEq(p *spl.SeqParser) (ret *ASTLessEq, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLessEq: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTLessEq)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLessEq: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLessEq: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel3Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLessEq: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTLevel0Expression(p *spl.SeqParser) (ret ASTLevel0Expression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLevel0Expression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLevel0Expression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel0Expression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLevel0Expression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel0Expression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLevel1Expression(p *spl.SeqParser) (ret ASTLevel1Expression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLevel1Expression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLevel1Expression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel1Expression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLevel1Expression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel1Expression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLevel2Expression(p *spl.SeqParser) (ret ASTLevel2Expression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLevel2Expression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLevel2Expression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel2Expression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLevel2Expression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel2Expression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLevel3Expression(p *spl.SeqParser) (ret ASTLevel3Expression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLevel3Expression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLevel3Expression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel3Expression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "BinaryPlus":
		ret, err = ParseASTBinaryPlus(p)
	case "BinaryMinus":
		ret, err = ParseASTBinaryMinus(p)
	case "BitOr":
		ret, err = ParseASTBitOr(p)
	case "BitXor":
		ret, err = ParseASTBitXor(p)
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLevel3Expression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel3Expression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLevel4Expression(p *spl.SeqParser) (ret ASTLevel4Expression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLevel4Expression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLevel4Expression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel4Expression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Less":
		ret, err = ParseASTLess(p)
	case "LessEq":
		ret, err = ParseASTLessEq(p)
	case "Greater":
		ret, err = ParseASTGreater(p)
	case "GreaterEq":
		ret, err = ParseASTGreaterEq(p)
	case "Equal":
		ret, err = ParseASTEqual(p)
	case "Inequal":
		ret, err = ParseASTInequal(p)
	case "Is":
		ret, err = ParseASTIs(p)
	case "BinaryPlus":
		ret, err = ParseASTBinaryPlus(p)
	case "BinaryMinus":
		ret, err = ParseASTBinaryMinus(p)
	case "BitOr":
		ret, err = ParseASTBitOr(p)
	case "BitXor":
		ret, err = ParseASTBitXor(p)
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLevel4Expression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel4Expression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLevel5Expression(p *spl.SeqParser) (ret ASTLevel5Expression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLevel5Expression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLevel5Expression: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel5Expression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "And":
		ret, err = ParseASTAnd(p)
	case "Less":
		ret, err = ParseASTLess(p)
	case "LessEq":
		ret, err = ParseASTLessEq(p)
	case "Greater":
		ret, err = ParseASTGreater(p)
	case "GreaterEq":
		ret, err = ParseASTGreaterEq(p)
	case "Equal":
		ret, err = ParseASTEqual(p)
	case "Inequal":
		ret, err = ParseASTInequal(p)
	case "Is":
		ret, err = ParseASTIs(p)
	case "BinaryPlus":
		ret, err = ParseASTBinaryPlus(p)
	case "BinaryMinus":
		ret, err = ParseASTBinaryMinus(p)
	case "BitOr":
		ret, err = ParseASTBitOr(p)
	case "BitXor":
		ret, err = ParseASTBitXor(p)
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLevel5Expression: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLevel5Expression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLiteral(p *spl.SeqParser) (ret ASTLiteral, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLiteral: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTLiteral: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLiteral: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTLiteral: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLiteral: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTLoopBound(p *spl.SeqParser) (ret *ASTLoopBound, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTLoopBound: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTLoopBound)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTLoopBound: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTLoopBound: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTMayFail(p *spl.SeqParser) (ret *ASTMayFail, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMayFail: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTMayFail)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMayFail: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._fail_list, err = ParseASTMayFail_fail_list(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMayFail: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTMayFail_fail_list(p *spl.SeqParser) (ret []string, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMayFail_fail_list: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		ret = append(ret, p.String())
	}

	p.Up()

	return
}
func ParseASTMethod(p *spl.SeqParser) (ret *ASTMethod, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethod: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTMethod)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._receiver, err = ParseASTParameter(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._name = p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._signature, err = ParseASTMethodSignature(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._contracts, err = ParseASTMethod_contracts(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._body, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMethod: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTMethod_contracts(p *spl.SeqParser) (ret []ASTMethodContract, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethod_contracts: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTMethodContract(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTMethodCall(p *spl.SeqParser) (ret *ASTMethodCall, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethodCall: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTMethodCall)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodCall: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._receiver, err = ParseASTLevel0Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodCall: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._method = p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodCall: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._args, err = ParseASTMethodCall_args(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodCall: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTMethodCall_args(p *spl.SeqParser) (ret []ASTExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethodCall_args: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTExpression(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTMethodContract(p *spl.SeqParser) (ret ASTMethodContract, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethodContract: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTMethodContract: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodContract: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Requires":
		ret, err = ParseASTRequires(p)
	case "RequiresAll":
		ret, err = ParseASTRequiresAll(p)
	case "Ensures":
		ret, err = ParseASTEnsures(p)
	case "EnsuresAll":
		ret, err = ParseASTEnsuresAll(p)
	case "MayFail":
		ret, err = ParseASTMayFail(p)
	case "RecursionBound":
		ret, err = ParseASTRecursionBound(p)
	default:
		err = fmt.Errorf("ParseASTMethodContract: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodContract: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTMethodSignature(p *spl.SeqParser) (ret *ASTMethodSignature, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethodSignature: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTMethodSignature)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodSignature: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._in_params, err = ParseASTMethodSignature_in_params(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodSignature: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._out_params, err = ParseASTMethodSignature_out_params(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMethodSignature: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTMethodSignature_in_params(p *spl.SeqParser) (ret []*ASTParameter, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethodSignature_in_params: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTParameter(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTMethodSignature_out_params(p *spl.SeqParser) (ret []*ASTParameter, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMethodSignature_out_params: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTParameter(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTMod(p *spl.SeqParser) (ret *ASTMod, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMod: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTMod)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMod: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMod: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTMult(p *spl.SeqParser) (ret *ASTMult, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTMult: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTMult)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMult: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTMult: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTMult: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTNamedType(p *spl.SeqParser) (ret ASTNamedType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTNamedType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTNamedType: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTNamedType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "StructType":
		ret, err = ParseASTStructType(p)
	case "InterfaceType":
		ret, err = ParseASTInterfaceType(p)
	case "SelectionType":
		ret, err = ParseASTSelectionType(p)
	default:
		err = fmt.Errorf("ParseASTNamedType: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTNamedType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTNew(p *spl.SeqParser) (ret *ASTNew, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTNew: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTNew)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTNew: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTNew: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTNewArray(p *spl.SeqParser) (ret *ASTNewArray, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTNewArray: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTNewArray)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTNewArray: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._length, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTNewArray: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTNewArray: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTNot(p *spl.SeqParser) (ret *ASTNot, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTNot: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTNot)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTNot: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTNot: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTOctal(p *spl.SeqParser) (ret *ASTOctal, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTOctal: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTOctal)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTOctal: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._str = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTOctal: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTOr(p *spl.SeqParser) (ret *ASTOr, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTOr: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTOr)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTOr: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTOr: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel5Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTOr: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTPExpression(p *spl.SeqParser) (ret *ASTPExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTPExpression: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTPExpression)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTPExpression: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTPExpression: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTParameter(p *spl.SeqParser) (ret *ASTParameter, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTParameter: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTParameter)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTParameter: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._name = &s
	} else {
		p.Skip()
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTParameter: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTParameter: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTPointerType(p *spl.SeqParser) (ret *ASTPointerType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTPointerType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTPointerType)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTPointerType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._inner_type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTPointerType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._nullable = p.IsString()
	p.Skip()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTPointerType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._owned = p.IsString()
	p.Skip()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTPointerType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRShift(p *spl.SeqParser) (ret *ASTRShift, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRShift: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTRShift)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRShift: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._left, err = ParseASTLevel2Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRShift: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._right, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRShift: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRangeType(p *spl.SeqParser) (ret *ASTRangeType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRangeType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTRangeType)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRangeType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._low, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRangeType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._high, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRangeType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRecoverable(p *spl.SeqParser) (ret ASTRecoverable, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRecoverable: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTRecoverable: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRecoverable: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Assignment":
		ret, err = ParseASTAssignment(p)
	case "Vardecl":
		ret, err = ParseASTVardecl(p)
	case "Or":
		ret, err = ParseASTOr(p)
	case "And":
		ret, err = ParseASTAnd(p)
	case "Less":
		ret, err = ParseASTLess(p)
	case "LessEq":
		ret, err = ParseASTLessEq(p)
	case "Greater":
		ret, err = ParseASTGreater(p)
	case "GreaterEq":
		ret, err = ParseASTGreaterEq(p)
	case "Equal":
		ret, err = ParseASTEqual(p)
	case "Inequal":
		ret, err = ParseASTInequal(p)
	case "Is":
		ret, err = ParseASTIs(p)
	case "BinaryPlus":
		ret, err = ParseASTBinaryPlus(p)
	case "BinaryMinus":
		ret, err = ParseASTBinaryMinus(p)
	case "BitOr":
		ret, err = ParseASTBitOr(p)
	case "BitXor":
		ret, err = ParseASTBitXor(p)
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTRecoverable: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRecoverable: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTRecursionBound(p *spl.SeqParser) (ret *ASTRecursionBound, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRecursionBound: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTRecursionBound)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRecursionBound: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRecursionBound: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRef(p *spl.SeqParser) (ret *ASTRef, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRef: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTRef)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRef: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRef: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRequires(p *spl.SeqParser) (ret *ASTRequires, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRequires: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTRequires)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRequires: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRequires: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRequiresAll(p *spl.SeqParser) (ret *ASTRequiresAll, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRequiresAll: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTRequiresAll)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRequiresAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._vars, err = ParseASTRequiresAll_vars(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTRequiresAll: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTRequiresAll: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTRequiresAll_vars(p *spl.SeqParser) (ret []string, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTRequiresAll_vars: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		ret = append(ret, p.String())
	}

	p.Up()

	return
}
func ParseASTReturn(p *spl.SeqParser) (ret *ASTReturn, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTReturn: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTReturn)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTReturn: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._retvals, err = ParseASTReturn_retvals(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTReturn: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTReturn_retvals(p *spl.SeqParser) (ret []ASTExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTReturn_retvals: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTExpression(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTSanityCheck(p *spl.SeqParser) (ret *ASTSanityCheck, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSanityCheck: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTSanityCheck)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSanityCheck: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._expr, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTSanityCheck: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTSelectionType(p *spl.SeqParser) (ret *ASTSelectionType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSelectionType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTSelectionType)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSelectionType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._types, err = ParseASTSelectionType_types(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTSelectionType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTSelectionType_types(p *spl.SeqParser) (ret []ASTType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSelectionType_types: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTType(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTSelector(p *spl.SeqParser) (ret *ASTSelector, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSelector: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTSelector)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSelector: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._base, err = ParseASTLevel0Expression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSelector: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._selector = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTSelector: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTStatement(p *spl.SeqParser) (ret ASTStatement, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTStatement: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTStatement: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTStatement: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Vardecl":
		ret, err = ParseASTVardecl(p)
	case "VardeclTyped":
		ret, err = ParseASTVardeclTyped(p)
	case "While":
		ret, err = ParseASTWhile(p)
	case "Return":
		ret, err = ParseASTReturn(p)
	case "Break":
		ret, err = ParseASTBreak(p)
	case "Continue":
		ret, err = ParseASTContinue(p)
	case "Block":
		ret, err = ParseASTBlock(p)
	case "If":
		ret, err = ParseASTIf(p)
	case "Assignment":
		ret, err = ParseASTAssignment(p)
	case "Increment":
		ret, err = ParseASTIncrement(p)
	case "Decrement":
		ret, err = ParseASTDecrement(p)
	case "Delete":
		ret, err = ParseASTDelete(p)
	case "Switch":
		ret, err = ParseASTSwitch(p)
	case "TypeSwitch":
		ret, err = ParseASTTypeSwitch(p)
	case "Assert":
		ret, err = ParseASTAssert(p)
	case "AssertAll":
		ret, err = ParseASTAssertAll(p)
	case "Assume":
		ret, err = ParseASTAssume(p)
	case "Fail":
		ret, err = ParseASTFail(p)
	case "SanityCheck":
		ret, err = ParseASTSanityCheck(p)
	case "FailRecover":
		ret, err = ParseASTFailRecover(p)
	case "Or":
		ret, err = ParseASTOr(p)
	case "And":
		ret, err = ParseASTAnd(p)
	case "Less":
		ret, err = ParseASTLess(p)
	case "LessEq":
		ret, err = ParseASTLessEq(p)
	case "Greater":
		ret, err = ParseASTGreater(p)
	case "GreaterEq":
		ret, err = ParseASTGreaterEq(p)
	case "Equal":
		ret, err = ParseASTEqual(p)
	case "Inequal":
		ret, err = ParseASTInequal(p)
	case "Is":
		ret, err = ParseASTIs(p)
	case "BinaryPlus":
		ret, err = ParseASTBinaryPlus(p)
	case "BinaryMinus":
		ret, err = ParseASTBinaryMinus(p)
	case "BitOr":
		ret, err = ParseASTBitOr(p)
	case "BitXor":
		ret, err = ParseASTBitXor(p)
	case "Mult":
		ret, err = ParseASTMult(p)
	case "Div":
		ret, err = ParseASTDiv(p)
	case "Mod":
		ret, err = ParseASTMod(p)
	case "LShift":
		ret, err = ParseASTLShift(p)
	case "RShift":
		ret, err = ParseASTRShift(p)
	case "BitAnd":
		ret, err = ParseASTBitAnd(p)
	case "UnaryPlus":
		ret, err = ParseASTUnaryPlus(p)
	case "UnaryMinus":
		ret, err = ParseASTUnaryMinus(p)
	case "Deref":
		ret, err = ParseASTDeref(p)
	case "Ref":
		ret, err = ParseASTRef(p)
	case "Not":
		ret, err = ParseASTNot(p)
	case "Take":
		ret, err = ParseASTTake(p)
	case "MethodCall":
		ret, err = ParseASTMethodCall(p)
	case "Selector":
		ret, err = ParseASTSelector(p)
	case "Indexed":
		ret, err = ParseASTIndexed(p)
	case "Identifier":
		ret, err = ParseASTIdentifier(p)
	case "New":
		ret, err = ParseASTNew(p)
	case "NewArray":
		ret, err = ParseASTNewArray(p)
	case "PExpression":
		ret, err = ParseASTPExpression(p)
	case "Decimal":
		ret, err = ParseASTDecimal(p)
	case "Octal":
		ret, err = ParseASTOctal(p)
	case "HexaDecimal":
		ret, err = ParseASTHexaDecimal(p)
	case "String":
		ret, err = ParseASTString(p)
	case "Char":
		ret, err = ParseASTChar(p)
	default:
		err = fmt.Errorf("ParseASTStatement: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTStatement: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTString(p *spl.SeqParser) (ret *ASTString, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTString: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTString)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTString: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._str = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTString: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTStructMember(p *spl.SeqParser) (ret *ASTStructMember, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTStructMember: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTStructMember)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTStructMember: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._name = &s
	} else {
		p.Skip()
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTStructMember: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTStructMember: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTStructType(p *spl.SeqParser) (ret *ASTStructType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTStructType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTStructType)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTStructType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._members, err = ParseASTStructType_members(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTStructType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTStructType_members(p *spl.SeqParser) (ret []*ASTStructMember, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTStructType_members: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTStructMember(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTSwitch(p *spl.SeqParser) (ret *ASTSwitch, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSwitch: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTSwitch)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._discriminant, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._cases, err = ParseASTSwitch_cases(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._default, err = ParseASTDefaultCase(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitch: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTSwitch_cases(p *spl.SeqParser) (ret []*ASTSwitchCase, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSwitch_cases: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTSwitchCase(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTSwitchCase(p *spl.SeqParser) (ret *ASTSwitchCase, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSwitchCase: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTSwitchCase)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitchCase: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._matches, err = ParseASTSwitchCase_matches(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitchCase: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._body, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTSwitchCase: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTSwitchCase_matches(p *spl.SeqParser) (ret []ASTExpression, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTSwitchCase_matches: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTExpression(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTTake(p *spl.SeqParser) (ret *ASTTake, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTake: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTTake)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTake: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTTake: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTType(p *spl.SeqParser) (ret ASTType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTType: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTType: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTType: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "TypeRef":
		ret, err = ParseASTTypeRef(p)
	case "RangeType":
		ret, err = ParseASTRangeType(p)
	case "ArrayType":
		ret, err = ParseASTArrayType(p)
	case "PointerType":
		ret, err = ParseASTPointerType(p)
	default:
		err = fmt.Errorf("ParseASTType: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTType: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
func ParseASTTypeRef(p *spl.SeqParser) (ret *ASTTypeRef, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTypeRef: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTTypeRef)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeRef: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._package = &s
	} else {
		p.Skip()
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeRef: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._name = p.String()

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeRef: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTTypeSwitch(p *spl.SeqParser) (ret *ASTTypeSwitch, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTypeSwitch: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTTypeSwitch)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._discriminant, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._cases, err = ParseASTTypeSwitch_cases(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitch: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._default, err = ParseASTDefaultCase(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitch: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTTypeSwitch_cases(p *spl.SeqParser) (ret []*ASTTypeSwitchCase, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTypeSwitch_cases: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTTypeSwitchCase(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTTypeSwitchCase(p *spl.SeqParser) (ret *ASTTypeSwitchCase, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTypeSwitchCase: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTTypeSwitchCase)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitchCase: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._types, err = ParseASTTypeSwitchCase_types(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitchCase: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._body, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTTypeSwitchCase: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTTypeSwitchCase_types(p *spl.SeqParser) (ret []ASTType, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTypeSwitchCase_types: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTType(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTTypedef(p *spl.SeqParser) (ret *ASTTypedef, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTTypedef: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTTypedef)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypedef: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._name = p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTTypedef: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTNamedType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTTypedef: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTUnaryMinus(p *spl.SeqParser) (ret *ASTUnaryMinus, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTUnaryMinus: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTUnaryMinus)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTUnaryMinus: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTUnaryMinus: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTUnaryPlus(p *spl.SeqParser) (ret *ASTUnaryPlus, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTUnaryPlus: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTUnaryPlus)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTUnaryPlus: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._arg, err = ParseASTLevel1Expression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTUnaryPlus: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTVardecl(p *spl.SeqParser) (ret *ASTVardecl, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTVardecl: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTVardecl)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTVardecl: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._name = p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTVardecl: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._initializer, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTVardecl: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTVardeclTyped(p *spl.SeqParser) (ret *ASTVardeclTyped, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTVardeclTyped: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTVardeclTyped)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTVardeclTyped: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._names, err = ParseASTVardeclTyped_names(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTVardeclTyped: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._type, err = ParseASTType(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTVardeclTyped: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTVardeclTyped_names(p *spl.SeqParser) (ret []string, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTVardeclTyped_names: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		ret = append(ret, p.String())
	}

	p.Up()

	return
}
func ParseASTWhile(p *spl.SeqParser) (ret *ASTWhile, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTWhile: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	ret = new(ASTWhile)

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTWhile: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	if p.IsString() {
		s := p.String()
		ret._label = &s
	} else {
		p.Skip()
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTWhile: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._condition, err = ParseASTExpression(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTWhile: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._contracts, err = ParseASTWhile_contracts(p)
	if err != nil {
		return
	}

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTWhile: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	ret._body, err = ParseASTBlock(p)
	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTWhile: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}
	p.Up()

	return
}
func ParseASTWhile_contracts(p *spl.SeqParser) (ret []ASTWhileContract, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTWhile_contracts: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	for p.Down(); !p.IsEnd(); {
		x, e := ParseASTWhileContract(p)
		if e != nil {
			return nil, e
		}
		ret = append(ret, x)
	}

	p.Up()

	return
}
func ParseASTWhileContract(p *spl.SeqParser) (ret ASTWhileContract, err error) {
	if !p.IsList() {
		err = fmt.Errorf("ParseASTWhileContract: Expected list start at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Down()

	if p.IsEnd() {
		p.Up()
		return nil, nil
	}

	if !p.IsString() {
		err = fmt.Errorf("ParseASTWhileContract: Expected string at %d:%d.", p.Line(), p.Column())
		return
	}

	tag := p.String()

	if p.IsEnd() {
		err = fmt.Errorf("ParseASTWhileContract: Unexpected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	switch tag {
	case "Invariant":
		ret, err = ParseASTInvariant(p)
	case "InvariantAll":
		ret, err = ParseASTInvariantAll(p)
	case "LoopBound":
		ret, err = ParseASTLoopBound(p)
	default:
		err = fmt.Errorf("ParseASTWhileContract: Unknown tag %s before %d:%d.", tag, p.Line(), p.Column())
		return
	}

	if err != nil {
		return
	}

	if !p.IsEnd() {
		err = fmt.Errorf("ParseASTWhileContract: Expected list end at %d:%d.", p.Line(), p.Column())
		return
	}

	p.Up()

	return ret, nil
}
