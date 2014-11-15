package main

import (
	"fmt"
	"os"
	"strconv"
)

// TODO: Set FuncName on all instructions.

type TranscribeContext struct {
	Method    *Method
	loopStack *staticLoop
	counter   int
}

func NewTranscribeContext(m *Method) *TranscribeContext {
	return &TranscribeContext{m, nil, 0}
}

type staticLoop struct {
	Label       string
	ContTarget  Instruction
	BreakTarget Instruction

	Next *staticLoop
}

func (ctx *TranscribeContext) EnterLoop(label string, cont_i, break_i Instruction) {
	ctx.loopStack = &staticLoop{label, cont_i, break_i, ctx.loopStack}
}

func (ctx *TranscribeContext) ExitLoop() {
	ctx.loopStack = ctx.loopStack.Next
}

func (ctx *TranscribeContext) CurrentLoop() (label string, cont_i, break_i Instruction) {
	loop := ctx.loopStack
	return loop.Label, loop.ContTarget, loop.BreakTarget
}

func (ctx *TranscribeContext) FindLoop(label string) (cont_i, break_i Instruction) {
	loop := ctx.loopStack
	for loop.Label != label {
		loop = loop.Next
	}
	return loop.ContTarget, loop.BreakTarget
}

func (ctx *TranscribeContext) NextCount() string {
	ctx.counter++
	return strconv.Itoa(ctx.counter)
}

func (ex *ASTUnaryPlus) Transcribe(ctx *TranscribeContext) {
	ex._arg.Transcribe(ctx)

	// Unary + is a no-op.
	ex.SetSlot(ex._arg.Slot())
	ex.Sequence(ex._arg)
}

func (ex *ASTUnaryMinus) Transcribe(ctx *TranscribeContext) {
	ex._arg.Transcribe(ctx)

	inst := new(UnaryOpInst)
	inst.Operation = UN_MINUS
	inst.SourceSlot = ex._arg.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.name

	ex.Sequence(ex._arg, inst)
}

func (ex *ASTDeref) Transcribe(ctx *TranscribeContext) {
	ex._arg.Transcribe(ctx)

	inst := new(UnaryOpInst)
	inst.Operation = UN_DEREF
	inst.SourceSlot = ex._arg.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.name

	ex.Sequence(ex._arg, inst)
}

func (ex *ASTRef) Transcribe(ctx *TranscribeContext) {
	ex._arg.Transcribe(ctx)

	inst := new(UnaryOpInst)
	inst.Operation = UN_REF
	inst.SourceSlot = ex._arg.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.name

	ex.Sequence(ex._arg, inst)
}

func (ex *ASTNot) Transcribe(ctx *TranscribeContext) {
	ex._arg.Transcribe(ctx)

	inst := new(UnaryOpInst)
	inst.Operation = UN_NOT
	inst.SourceSlot = ex._arg.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.name

	ex.Sequence(ex._arg, inst)
}

// TODO: Maybe use common code for all these binary ops that only differ in one word.

func (ex *ASTBinaryPlus) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_PLUS
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	// For simplicity, use the type of the first argument. Should work ok here.
	// INT_TYPE or STRING_TYPE.
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.name

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTBinaryMinus) Transcribe(ctx *TranscribeContext) {
	// Reduces "a - b" to "a + (-b)".

	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst1 := new(UnaryOpInst)
	inst1.Operation = UN_MINUS
	inst1.SourceSlot = ex._right.Slot()
	inst1.TargetSlot = ex.AllocStackSlot(ctx)
	inst1.FuncName = ctx.Method.name

	inst2 := new(BinaryOpInst)
	inst2.Operation = BIN_PLUS
	inst2.SourceSlot1 = ex._left.Slot()
	inst2.SourceSlot2 = inst1.TargetSlot
	inst2.TargetSlot = inst1.TargetSlot
	inst2.FuncName = ctx.Method.name

	ex.Sequence(ex._left, ex._right, inst1, inst2)
}

func (ex *ASTMult) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_MUL
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.name

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTDiv) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_CDIV
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTMod) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_CMOD
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTBitOr) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_BIT_OR
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTBitXor) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_BIT_XOR
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTBitAnd) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_BIT_AND
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTLShift) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_BIT_LSHIFT
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTRShift) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_BIT_RSHIFT
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTOr) Transcribe(ctx *TranscribeContext) {
	// Short-circuiting OR. Not a simple sequence.

	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	out_slot := ex.AllocStackSlot(ctx)

	exit := new(NopInst)

	tru := new(SetValueInst)
	tru.Value = true
	tru.TargetSlot = out_slot
	tru.SetNext(exit)

	fls := new(SetValueInst)
	fls.Value = false
	fls.TargetSlot = out_slot
	fls.SetNext(exit)

	if1 := new(IfInst)
	if1.ConditionSlot = ex._left.Slot()
	if1.TrueLabel = tru
	if1.FalseLabel = ex._right.First()

	if2 := new(IfInst)
	if2.ConditionSlot = ex._right.Slot()
	if2.TrueLabel = tru
	if2.FalseLabel = fls

	ex._left.SetNext(if1)
	ex._right.SetNext(if2)

	ex.SetFirst(ex._left)
	ex.SetLast(exit)
}

func (ex *ASTAnd) Transcribe(ctx *TranscribeContext) {
	// Short-circuiting AND. Not a simple sequence.

	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	out_slot := ex.AllocStackSlot(ctx)

	exit := new(NopInst)

	tru := new(SetValueInst)
	tru.Value = true
	tru.TargetSlot = out_slot
	tru.SetNext(exit)

	fls := new(SetValueInst)
	fls.Value = false
	fls.TargetSlot = out_slot
	fls.SetNext(exit)

	if1 := new(IfInst)
	if1.ConditionSlot = ex._left.Slot()
	if1.TrueLabel = ex._right.First()
	if1.FalseLabel = fls

	if2 := new(IfInst)
	if2.ConditionSlot = ex._right.Slot()
	if2.TrueLabel = tru
	if2.FalseLabel = fls

	ex._left.SetNext(if1)
	ex._right.SetNext(if2)

	ex.SetFirst(ex._left)
	ex.SetLast(exit)
}

func (ex *ASTEqual) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_EQUAL
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTInequal) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_EQUAL
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	inst2 := new(UnaryOpInst)
	inst2.Operation = UN_NOT
	inst2.SourceSlot = inst.TargetSlot
	inst2.TargetSlot = inst.TargetSlot

	ex.Sequence(ex._left, ex._right, inst, inst2)
}

func (ex *ASTLess) Transcribe(ctx *TranscribeContext) {
	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_LESS_THAN
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTGreater) Transcribe(ctx *TranscribeContext) {
	// Assumes  a > b  <=>  b < a ; always correct.

	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_LESS_THAN
	inst.SourceSlot1 = ex._right.Slot()
	inst.SourceSlot2 = ex._left.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._left, ex._right, inst)
}

func (ex *ASTLessEq) Transcribe(ctx *TranscribeContext) {
	// XXX: Assumes  a <= b  <=>  not (b < a)
	// Not correct for all floats, but this interpreter does not support float.

	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_LESS_THAN
	inst.SourceSlot1 = ex._right.Slot()
	inst.SourceSlot2 = ex._left.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	inst2 := new(UnaryOpInst)
	inst2.Operation = UN_NOT
	inst2.SourceSlot = inst.TargetSlot
	inst2.TargetSlot = inst.TargetSlot

	ex.Sequence(ex._left, ex._right, inst, inst2)
}

func (ex *ASTGreaterEq) Transcribe(ctx *TranscribeContext) {
	// XXX: Assumes  a >= b  <=>  not (a < b)
	// Not correct for all floats, but this interpreter does not support float.

	ex._left.Transcribe(ctx)
	ex._right.Transcribe(ctx)

	inst := new(BinaryOpInst)
	inst.Operation = BIN_LESS_THAN
	inst.SourceSlot1 = ex._left.Slot()
	inst.SourceSlot2 = ex._right.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	inst2 := new(UnaryOpInst)
	inst2.Operation = UN_NOT
	inst2.SourceSlot = inst.TargetSlot
	inst2.TargetSlot = inst.TargetSlot

	ex.Sequence(ex._left, ex._right, inst, inst2)
}

func (ex *ASTSelector) Transcribe(ctx *TranscribeContext) {
	ex._base.Transcribe(ctx)

	inst := new(SelectorOpInst)
	inst.Selector = ex._selector
	inst.SourceSlot = ex._base.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)
	inst.FuncName = ctx.Method.Name()

	ex.Sequence(ex._base, inst)
}

func (ex *ASTChar) Transcribe(ctx *TranscribeContext) {
	inst := new(SetValueInst)
	// Go does the decoding from UTF-8 for us.
	inst.Value = int64(ex._str[0])
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(inst)
}

func (ex *ASTString) Transcribe(ctx *TranscribeContext) {
	inst := new(SetValueInst)
	inst.Value = ex._str
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(inst)
}

func loadInt(str string, base int) int64 {
	i, err := strconv.ParseInt(str, base, 64)
	if err != nil {
		panic(err)
	}
	return i
}

func (ex *ASTDecimal) Transcribe(ctx *TranscribeContext) {
	inst := new(SetValueInst)
	inst.Value = loadInt(ex._str, 10)
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(inst)
}

func (ex *ASTOctal) Transcribe(ctx *TranscribeContext) {
	inst := new(SetValueInst)
	inst.Value = loadInt(ex._str, 8)
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(inst)
}

func (ex *ASTHexaDecimal) Transcribe(ctx *TranscribeContext) {
	inst := new(SetValueInst)
	inst.Value = loadInt(ex._str, 16)
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(inst)
}

func (ex *ASTPExpression) Transcribe(ctx *TranscribeContext) {
	ex._expr.Transcribe(ctx)
	ex.SetSlot(ex._expr.Slot())
	ex.Sequence(ex._expr)
}

func (ex *ASTIdentifier) Transcribe(ctx *TranscribeContext) {
	// 1. Built-in pseudo-functions:

	switch ex._ident {
	case "true":
		inst := new(SetValueInst)
		inst.Value = true
		inst.TargetSlot = ex.AllocStackSlot(ctx)
		ex.Sequence(inst)
		return

	case "false":
		inst := new(SetValueInst)
		inst.Value = false
		inst.TargetSlot = ex.AllocStackSlot(ctx)
		ex.Sequence(inst)
		return

	case "null":
		inst := new(SetValueInst)
		inst.Value = (*BoxedValue)(nil)
		inst.TargetSlot = ex.AllocStackSlot(ctx)
		ex.Sequence(inst)
		return
	}

	// 2. Other identifiers:

	switch {
	case ctx.Method.Imports[ex._ident] != nil:
		panic("Package name in an invalid context.")

	case ctx.Method.HasLocal(ex._ident):
		ex.SetSlot(ctx.Method.VarSlot(ex._ident))
		ex.Sequence(new(NopInst))
		return

		/*
			case ctx.IsConstant("", ex._ident):
				inst := new(SetValueInst)
				inst.Value = ctx.ConstantValue("", ex._ident)
				inst.TargetSlot = ex.AllocStackSlot(ctx, ctx.ConstantType("", ex._ident))
				ex.Sequence(inst)
		*/
	}

	panic("Bad identifier: " + ex._ident)
}

func NewExBlock(exprs []ASTExpression) *ASTBlock {
	list := make([]ASTStatement, len(exprs))
	for i := range exprs {
		list[i] = exprs[i]
	}
	return NewASTBlock(list)
}

func getPackage(ctx *TranscribeContext, ast ASTExpression) *Package {
	if ast == nil {
		return nil
	}

	switch b := ast.(type) {
	case *ASTIdentifier:
		if ctx.Method.Imports[b._ident] != nil {
			return ctx.Method.Imports[b._ident]
		}
	}
	return nil
}

func (ex *ASTMethodCall) Transcribe(ctx *TranscribeContext) {

	// TODO: double-check

	var receiver ASTExpression
	var m *Method

	pkg := getPackage(ctx, ex._receiver)
	if pkg != nil {
		receiver = nil
		m = pkg.Methods[ex._method]
		if m == nil {
			panic("Unknown method " + pkg.Path + "::" + ex._method)
		}
	} else {
		receiver = ex._receiver

		if receiver == nil {
			switch ex._method {
			case "len":
				m = NewBuiltinMethod("len", []Type{INT_TYPE})

			case "string":
				m = NewBuiltinMethod("string", []Type{STRING_TYPE})

			case "resize":
				// TODO: this may need a full type
				m = NewBuiltinMethod("resize", []Type{NewPointerType(NewArrayType(nil, -1))})
			default:
				m = ctx.Method.Imports[""].Methods[ex._method]
			}

			if m == nil {
				fmt.Fprintf(os.Stderr, "Unknown method %#v::%s.\n", receiver, ex._method)
			}

		} else {
			receiver.Transcribe(ctx)
		}
	}

	exblock := NewExBlock(ex._args)
	exblock.Transcribe(ctx)

	inslots := []int{}
	for i := range ex._args {
		inslots = append(inslots, ex._args[i].Slot())
	}

	if receiver == nil {
		call := new(FuncCallInst)
		call.Func = m
		call.ArgSlots = inslots
		call.RetvalSlot = ex.AllocStackSlot(ctx)
		ex.Sequence(exblock, call)
		return
	}

	mcall := new(MethodCallInst)
	mcall.ReceiverSlot = receiver.Slot()
	mcall.Method = ex._method
	mcall.ArgSlots = inslots
	mcall.RetvalSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(receiver, exblock, mcall)
}

func IndirectType(t Type) Type {
	for {
		pt, ok := t.(*PointerType)
		if !ok {
			break
		}
		t = pt.base
	}
	return t
}

func (ex *ASTIndexed) Transcribe(ctx *TranscribeContext) {
	ex._base.Transcribe(ctx)
	ex._index.Transcribe(ctx)

	inst := new(IndexOpInst)
	inst.BaseSlot = ex._base.Slot()
	inst.IndexSlot = ex._index.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._base, ex._index, inst)
}

func (ex *ASTNew) Transcribe(ctx *TranscribeContext) {
	inst := new(AllocInst)
	inst.Type = LoadType(ctx.Method.Imports, ex._type, true)
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(inst)
}

func (ex *ASTNewArray) Transcribe(ctx *TranscribeContext) {
	ex._length.Transcribe(ctx)

	inst := new(AllocArrayInst)
	inst.Type = LoadType(ctx.Method.Imports, ex._type, true)
	inst.LengthSlot = ex._length.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._length, inst)
}

func (ex *ASTTake) Transcribe(ctx *TranscribeContext) {
	ex._arg.Transcribe(ctx)

	inst := new(UnaryOpInst)
	inst.Operation = UN_MOVE
	inst.SourceSlot = ex._arg.Slot()
	inst.TargetSlot = ex.AllocStackSlot(ctx)

	ex.Sequence(ex._arg, inst)
}

////////////////////////////////////////////////////////////////////////////////////////////////////

func (stmt *ASTAssert) Transcribe(ctx *TranscribeContext) {
	stmt._expr.Transcribe(ctx)

	success := new(NopInst)

	// TODO: Include filename and line in the description.
	fail := new(FailInst)
	fail.Code = "BUG"
	fail.Description = "assert failed"
	fail.FuncName = ctx.Method.name

	ifi := new(IfInst)
	ifi.ConditionSlot = stmt._expr.Slot()
	ifi.TrueLabel = success
	ifi.FalseLabel = fail

	stmt.SetFirst(stmt._expr)
	stmt._expr.SetNext(ifi)
	stmt.SetLast(success)
}

func (stmt *ASTAssertAll) Transcribe(ctx *TranscribeContext) {
	// Can't reasonably check this here.
	// TODO: Check it here unreasonably.

	stmt.Sequence(new(NopInst))
}

func (stmt *ASTAssume) Transcribe(ctx *TranscribeContext) {
	// XXX: Copypaste from Assert.

	stmt._expr.Transcribe(ctx)

	success := new(NopInst)

	// TODO: Include filename and line in the description.
	fail := new(FailInst)
	fail.Code = "BUG"
	fail.Description = "assert failed"
	fail.FuncName = ctx.Method.name

	ifi := new(IfInst)
	ifi.ConditionSlot = stmt._expr.Slot()
	ifi.TrueLabel = success
	ifi.FalseLabel = fail

	stmt.SetFirst(stmt._expr)
	stmt._expr.SetNext(ifi)
	stmt.SetLast(success)
}

func (stmt *ASTSanityCheck) Transcribe(ctx *TranscribeContext) {
	// XXX: Copypaste from Assert.

	stmt._expr.Transcribe(ctx)

	success := new(NopInst)

	// TODO: Include filename and line in the description.
	fail := new(FailInst)
	fail.Code = "BUG"
	fail.Description = "assert failed"
	fail.FuncName = ctx.Method.name

	ifi := new(IfInst)
	ifi.ConditionSlot = stmt._expr.Slot()
	ifi.TrueLabel = success
	ifi.FalseLabel = fail

	stmt.SetFirst(stmt._expr)
	stmt._expr.SetNext(ifi)
	stmt.SetLast(success)
}

func (stmt *ASTFail) Transcribe(ctx *TranscribeContext) {
	// TODO: Include filename and line in the description.
	fail := new(FailInst)
	fail.Code = stmt._code
	if stmt._description != nil {
		fail.Description = *stmt._description
	}
	fail.FuncName = ctx.Method.name

	stmt.Sequence(fail)
}

func (stmt *ASTFailRecover) Transcribe(ctx *TranscribeContext) {
	stmt._stmt.Transcribe(ctx)
	stmt._recover_block.Transcribe(ctx)
	exit := new(NopInst)

	failrecoverentry := new(FailRecoverEntryInst)
	failrecoverexit := new(FailRecoverExitInst)

	failrecoverentry.Handler = stmt._recover_block.First()
	failrecoverentry.SetNext(stmt._stmt.First())

	stmt._stmt.SetNext(failrecoverexit)
	stmt._recover_block.SetNext(exit)
	failrecoverexit.SetNext(exit)

	stmt.SetFirst(failrecoverentry)
	stmt.SetLast(exit)
}

func (stmt *ASTIncrement) Transcribe(ctx *TranscribeContext) {
	stmt._lvalue.Transcribe(ctx)

	inst := new(IncrementInst)
	inst.TargetSlot = stmt._lvalue.Slot()
	inst.Value = int64(1)

	stmt.Sequence(stmt._lvalue, inst)
}

func (stmt *ASTDecrement) Transcribe(ctx *TranscribeContext) {
	stmt._lvalue.Transcribe(ctx)

	inst := new(IncrementInst)
	inst.TargetSlot = stmt._lvalue.Slot()
	inst.Value = int64(-1)

	stmt.Sequence(stmt._lvalue, inst)
}

func (cs *ASTSwitchCase) Process(ctx *TranscribeContext, cond_slot, eq_slot int, out_label Instruction) {
	cs._body.Transcribe(ctx)
	cs._body.SetNext(out_label)

	var last_if *IfInst

	for i := range cs._matches {
		cs._matches[i].Transcribe(ctx)

		cmp := new(BinaryOpInst)
		cmp.Operation = BIN_EQUAL
		cmp.SourceSlot1 = cond_slot
		cmp.SourceSlot2 = cs._matches[i].Slot()
		cmp.TargetSlot = eq_slot

		cs._matches[i].SetNext(cmp)

		ifinst := new(IfInst)
		ifinst.ConditionSlot = eq_slot
		ifinst.TrueLabel = cs._body.First()

		cmp.SetNext(ifinst)

		if last_if == nil {
			cs.SetFirst(cs._matches[i])
		} else {
			last_if.FalseLabel = cs._matches[i].First()
		}

		last_if = ifinst
	}

	if last_if == nil {
		panic("bug")
	}

	next_label := new(NopInst)
	last_if.FalseLabel = next_label
	cs.SetLast(next_label)
}

func (stmt *ASTSwitch) Transcribe(ctx *TranscribeContext) {
	if stmt._default == nil {
		stmt._default = NewASTDefaultCase(NewASTBlock(nil))
	}

	if stmt._discriminant == nil {
		stmt._discriminant = NewASTIdentifier("true")
	}

	stmt._discriminant.Transcribe(ctx)
	stmt._default._body.Transcribe(ctx)

	out_label := new(NopInst)
	eq_slot := ctx.Method.AllocSlot()

	seq := make([]interface{}, 0, 8)
	seq = append(seq, stmt._discriminant)

	for i := range stmt._cases {
		stmt._cases[i].Process(ctx, stmt._discriminant.Slot(), eq_slot, out_label)
		seq = append(seq, stmt._cases[i])
	}

	seq = append(seq, stmt._default._body, out_label)

	stmt.Sequence(seq...)
}

func (cs *ASTTypeSwitchCase) Process(ctx *TranscribeContext, cond_slot, eq_slot int, out_label Instruction) {
	cs._body.Transcribe(ctx)
	cs._body.SetNext(out_label)

	var last_if *IfInst

	for i := range cs._types {
		tinst := new(TypeCheckInst)
		tinst.SourceSlot = cond_slot
		tinst.TargetSlot = eq_slot
		tinst.Type = LoadType(ctx.Method.Imports, cs._types[i], true)

		ifinst := new(IfInst)
		ifinst.ConditionSlot = eq_slot
		ifinst.TrueLabel = cs._body.First()

		tinst.SetNext(ifinst)

		if last_if == nil {
			cs.SetFirst(tinst)
		} else {
			last_if.FalseLabel = tinst
		}

		last_if = ifinst
	}

	if last_if == nil {
		panic("bug")
	}

	next_label := new(NopInst)
	last_if.FalseLabel = next_label
	cs.SetLast(next_label)
}

func (stmt *ASTTypeSwitch) Transcribe(ctx *TranscribeContext) {
	// XXX: This is the same as for regular switch.
	if stmt._default == nil {
		stmt._default = NewASTDefaultCase(NewASTBlock(nil))
	}

	stmt._discriminant.Transcribe(ctx)
	stmt._default._body.Transcribe(ctx)

	out_label := new(NopInst)
	eq_slot := ctx.Method.AllocSlot()

	seq := make([]interface{}, 0, 8)
	seq = append(seq, stmt._discriminant)

	for i := range stmt._cases {
		stmt._cases[i].Process(ctx, stmt._discriminant.Slot(), eq_slot, out_label)
		seq = append(seq, stmt._cases[i])
	}

	seq = append(seq, stmt._default._body, out_label)

	stmt.Sequence(seq...)
}

func (stmt *ASTVardecl) Transcribe(ctx *TranscribeContext) {
	ctx.Method.DeclareLocal(stmt._name, nil)

	if stmt._initializer == nil {
		stmt.Sequence()
		return
	}

	stmt._initializer.Transcribe(ctx)

	asgn := new(AssignmentInst)
	asgn.SrcSlots = []int{stmt._initializer.Slot()}
	asgn.DstSlots = []int{ctx.Method.VarSlot(stmt._name)}
	asgn.FuncName = ctx.Method.name

	stmt.Sequence(stmt._initializer, asgn)
}

func (stmt *ASTVardeclTyped) Transcribe(ctx *TranscribeContext) {
	for i := range stmt._names {
		ctx.Method.DeclareLocal(stmt._names[i], LoadType(ctx.Method.Imports, stmt._type, true))
	}

	stmt.Sequence()
}

func (stmt *ASTWhile) InvariantRTChecks(ctx *TranscribeContext) ASTStatement {
	var invariants []ASTStatement
	var bound_var = "___bound_" + ctx.NextCount()
	var bounded = false

	// Convert invariants into assertions.
	for i := range stmt._contracts {
		switch c := stmt._contracts[i].(type) {
		case *ASTInvariant:
			invariants = append(invariants, NewASTAssert(c._expr.Copy()))

		case *ASTLoopBound:
			// assert bound_var < 1 || expr < bound_var
			// bound_var = expr + 1
			// assert 0 < bound_var

			if bounded {
				panic("More than one loop_bound.")
			}
			bounded = true

			id := NewASTIdentifier(bound_var)
			l1 := NewASTLess(id, NewASTDecimal("1"))
			l2 := NewASTLess(c._expr.Copy(), id.Copy())
			a1 := NewASTAssert(NewASTOr(l1, l2))
			a2 := NewASTAssignment([]ASTExpression{id.Copy()}, []ASTExpression{NewASTBinaryPlus(c._expr.Copy(), NewASTDecimal("1"))})
			a3 := NewASTAssert(NewASTLess(NewASTDecimal("0"), id.Copy()))

			invariants = append(invariants, NewASTBlock([]ASTStatement{a1, a2, a3}))
		default:
			panic("missing case")
		}
	}

	if bounded {
		ctx.Method.DeclareLocal(bound_var, INT_TYPE)
	}

	return NewASTBlock(invariants)
}

func (stmt *ASTWhile) Transcribe(ctx *TranscribeContext) {
	stmt._condition.Transcribe(ctx)
	checks := stmt.InvariantRTChecks(ctx)
	checks.Transcribe(ctx)

	// NOP instruction to serve as an exit jump target.
	exit := new(NopInst)

	// Targets for CONTINUE and BREAK.
	lbl := "__loop" + ctx.NextCount()

	if stmt._label != nil {
		lbl = *stmt._label
	}

	ctx.EnterLoop(lbl, checks.First(), exit)

	stmt._body.Transcribe(ctx)

	ctx.ExitLoop()

	// IF instruction to decide whether to jump out of loop.
	ifi := new(IfInst)
	ifi.ConditionSlot = stmt._condition.Slot()

	// Connect everything properly.
	checks.SetNext(stmt._condition)
	stmt._condition.SetNext(ifi)
	ifi.TrueLabel = stmt._body.First()
	ifi.FalseLabel = exit
	stmt._body.SetNext(checks)

	stmt.SetFirst(checks)
	stmt.SetLast(exit)
}

func (stmt *ASTReturn) Transcribe(ctx *TranscribeContext) {

	if len(stmt._retvals) == 0 {
		nopinst := new(NopInst)
		stmt.Sequence(nopinst)
		stmt.ResetLast(Unreachable())
		return
	}

	exblock := NewExBlock(stmt._retvals)
	exblock.Transcribe(ctx)

	srcslots := []int{}
	dstslots := []int{}

	for i := range stmt._retvals {
		srcslots = append(srcslots, stmt._retvals[i].Slot())
	}

	out_params := ctx.Method.ast._signature._out_params
	for i := range out_params {
		dstslots = append(dstslots, ctx.Method.VarSlot(*out_params[i]._name))
	}

	asgn := new(AssignmentInst)
	asgn.SrcSlots = srcslots
	asgn.DstSlots = dstslots
	asgn.FuncName = ctx.Method.name

	stmt.Sequence(exblock, asgn)

	// Disallow appending any more statements after return.
	stmt.ResetLast(Unreachable())
}

func (stmt *ASTBreak) Transcribe(ctx *TranscribeContext) {
	var lbl Instruction

	if stmt._label == nil {
		_, _, lbl = ctx.CurrentLoop()
	} else {
		_, lbl = ctx.FindLoop(*stmt._label)
	}

	jump := new(NopInst)
	jump.SetNext(lbl)

	stmt.SetFirst(jump)
	stmt.SetLast(Unreachable())
}

func (stmt *ASTContinue) Transcribe(ctx *TranscribeContext) {
	var lbl Instruction

	if stmt._label == nil {
		_, lbl, _ = ctx.CurrentLoop()
	} else {
		lbl, _ = ctx.FindLoop(*stmt._label)
	}

	jump := new(NopInst)
	jump.SetNext(lbl)

	stmt.SetFirst(jump)
	stmt.SetLast(Unreachable())
}

func (stmt *ASTBlock) Transcribe(ctx *TranscribeContext) {
	first := Instruction(new(NopInst))
	last := first

	for i := range stmt._statements {
		stmt._statements[i].Transcribe(ctx)

		last.SetNext(stmt._statements[i].First())
		last = stmt._statements[i].Last()
	}

	stmt.SetFirst(first)
	stmt.SetLast(last)
}

func (stmt *ASTIf) Transcribe(ctx *TranscribeContext) {
	stmt._condition.Transcribe(ctx)
	stmt._true_branch.Transcribe(ctx)
	if stmt._false_branch != nil {
		stmt._false_branch.Transcribe(ctx)
	}

	exit := new(NopInst)

	ifi := new(IfInst)
	ifi.ConditionSlot = stmt._condition.Slot()
	ifi.TrueLabel = stmt._true_branch.First()
	if stmt._false_branch == nil {
		ifi.FalseLabel = exit
	} else {
		ifi.FalseLabel = stmt._false_branch.First()
	}

	stmt.SetFirst(stmt._condition)
	stmt._condition.SetNext(ifi)
	stmt._true_branch.SetNext(exit)
	if stmt._false_branch != nil {
		stmt._false_branch.SetNext(exit)
	}
	stmt.SetLast(exit)
}

func (stmt *ASTAssignment) Transcribe(ctx *TranscribeContext) {
	first := Instruction(new(NopInst))
	last := first

	srcslots := []int{}
	dstslots := []int{}

	// XXX: RValues evaluate before LValues. This is deliberate.

	for i := range stmt._rvalues {
		stmt._rvalues[i].Transcribe(ctx)
		srcslots = append(srcslots, stmt._rvalues[i].Slot())
		last.SetNext(stmt._rvalues[i].First())
		last = stmt._rvalues[i].Last()
	}

	for i := range stmt._lvalues {
		stmt._lvalues[i].Transcribe(ctx)
		dstslots = append(dstslots, stmt._lvalues[i].Slot())
		last.SetNext(stmt._lvalues[i].First())
		last = stmt._lvalues[i].Last()
	}

	asgn := new(AssignmentInst)
	asgn.SrcSlots = srcslots
	asgn.DstSlots = dstslots
	asgn.FuncName = ctx.Method.name

	last.SetNext(asgn)
	last = asgn

	stmt.SetFirst(first)
	stmt.SetLast(last)
}

func (stmt *ASTDelete) Transcribe(ctx *TranscribeContext) {
	// There is no delete instruction in this interpreter at the moment.
	// GC will take care of memory.

	stmt._arg.Transcribe(ctx)
	stmt.Sequence(stmt._arg)
}

func (m *ASTMethod) MakeEntryCheck() *ASTBlock {
	// TODO
	//panic("unimplemented")
	return NewASTBlock(nil)
}

func (m *ASTMethod) MakeExitCheck() *ASTBlock {
	// TODO
	//panic("unimplemented")
	return NewASTBlock(nil)
}

func (ctx *TranscribeContext) Transcribe() {
	m := ctx.Method

	if m.Builtin() {
		return
	}

	if m.ast._receiver != nil {
		m.DeclareLocal(*m.ast._receiver._name, nil)
	} else {
		m.DeclareLocal("___no_receiver", nil)
	}

	for i := range m.ast._signature._in_params {
		m.DeclareLocal(*m.ast._signature._in_params[i]._name, nil)
	}

	for i := range m.ast._signature._out_params {
		m.DeclareLocal(*m.ast._signature._out_params[i]._name, LoadType(m.Imports, m.ast._signature._out_params[i]._type, true))
	}

	m.ast._body.Transcribe(ctx)

	check1 := m.ast.MakeEntryCheck()
	check1.Transcribe(ctx)
	check1.SetNext(m.ast._body)

	check2 := m.ast.MakeExitCheck()
	check2.Transcribe(ctx)

	m.Entry = check1.First()
	m.ExitCheck = check2.First()
}
