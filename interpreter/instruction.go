package main

type Instruction interface {
	SetNext(inst Instruction)
	Next() Instruction

	__this_is_instruction()
}

type InstructionCommon struct {
	next Instruction

	FuncName string
}

func (i *InstructionCommon) Next() Instruction {
	return i.next
}

func (i *InstructionCommon) SetNext(inst Instruction) {
	if i.next != nil {
		panic("next already set")
	}
	i.next = inst
}

func (i *InstructionCommon) __this_is_instruction() {
}

type BinOp int
type UnOp int

const (
	BIN_PLUS = BinOp(iota)
	BIN_MUL
	BIN_CDIV
	BIN_CMOD
	BIN_BIT_OR
	BIN_BIT_XOR
	BIN_BIT_AND
	BIN_BIT_LSHIFT
	BIN_BIT_RSHIFT
	BIN_EQUAL
	BIN_LESS_THAN
)

const (
	UN_MOVE = UnOp(iota)
	UN_MINUS
	UN_DEREF
	UN_REF
	UN_NOT
)

type TypeCheckInst struct {
	InstructionCommon

	SourceSlot int
	Type       Type
	TargetSlot int
}

type BinaryOpInst struct {
	InstructionCommon

	Operation BinOp

	SourceSlot1 int
	SourceSlot2 int
	TargetSlot  int
}

type UnaryOpInst struct {
	InstructionCommon

	Operation UnOp

	SourceSlot int
	TargetSlot int
}

type SelectorOpInst struct {
	InstructionCommon

	Selector   string
	SourceSlot int
	TargetSlot int
}

type IndexOpInst struct {
	InstructionCommon

	BaseSlot   int
	IndexSlot  int
	TargetSlot int
}

type AllocInst struct {
	InstructionCommon

	Type       Type
	TargetSlot int
}

type AllocArrayInst struct {
	InstructionCommon

	Type       Type
	LengthSlot int
	TargetSlot int
}

type IfInst struct {
	ConditionSlot int
	TrueLabel     Instruction
	FalseLabel    Instruction
}

func (i *IfInst) __this_is_instruction() {
}

func (i *IfInst) Next() Instruction {
	panic("If cannot do Next()")
}

func (i *IfInst) SetNext(inst Instruction) {
	panic("If cannot do SetNext()")
}

type SetValueInst struct {
	InstructionCommon

	Value      Value
	TargetSlot int
}

type NopInst struct {
	InstructionCommon
}

type MethodCallInst struct {
	InstructionCommon

	ReceiverSlot int
	Method       string
	ArgSlots     []int
	RetvalSlot   int
}

type FuncCallInst struct {
	InstructionCommon

	Func       *Method
	ArgSlots   []int
	RetvalSlot int
}

func Unreachable() Instruction {
	// TODO: Just one unreachable.
	return &NopInst{}
}

type IncrementInst struct {
	InstructionCommon
	TargetSlot int
	Value      Value
}

type FailRecoverEntryInst struct {
	InstructionCommon
	Handler Instruction
}

type FailRecoverExitInst struct {
	InstructionCommon
}

type FailInst struct {
	InstructionCommon
	Code        string
	Description string
}

type AssignmentInst struct {
	InstructionCommon
	DstSlots []int
	SrcSlots []int
}
