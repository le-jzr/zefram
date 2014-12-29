package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
)

// TODO: Clean up the code.

const TRACE_CALLS = false
const DEBUGINST = false

var mcallcount int = 0

type RunContext struct {
	valueStack  []Value
	method      *Method
	FailHandler Instruction

	Args []string
}

func NewRunContext() *RunContext {
	return new(RunContext)
}

func (rctx *RunContext) SetArgs(args []string) {
	rctx.Args = append([]string(nil), args...)
}

func (rctx *RunContext) InitAddressable(slot int, t Type) {
	rctx.valueStack[slot] = AddressableValue{&BoxedValue{ValueDefault(t)}}
}

func (rctx *RunContext) IsAddressable(slot int) bool {
	_, ok := rctx.valueStack[slot].(AddressableValue)
	return ok
}

func (rctx *RunContext) GetAddress(slot int) Value {
	av, ok := rctx.valueStack[slot].(AddressableValue)
	if !ok {
		panic("Invalid address-of operator.")
	}

	if av.Box == nil {
		panic("bug")
	}
	return av.Box
}

func (rctx *RunContext) GetValue(slot int) Value {
	v := rctx.GetTuple(slot)
	tuple, ok := v.(TupleValue)
	if !ok {
		return v
	}

	if len(tuple.List) != 1 {
		panic("Function returns multiple values in single-value context.")
	}

	return tuple.List[0]
}

func (rctx *RunContext) GetTuple(slot int) Value {
	av, ok := rctx.valueStack[slot].(AddressableValue)
	if ok {
		if av.Box == nil {
			panic("bug")
		}
		return av.Box.Value
	}

	return rctx.valueStack[slot]
}

func (rctx *RunContext) AssignValue(slot int, val Value) {
	_, addr1 := val.(AddressableValue)
	av, addr2 := rctx.valueStack[slot].(AddressableValue)

	if addr1 {
		panic("bug")
	}
	if !addr2 {
		panic("bug")
	}
	if av.Box == nil {
		panic("bug")
	}

	av.Box.Value = val
}

func (rctx *RunContext) SetValue(slot int, val Value) {
	adr, ok := val.(AddressableValue)
	if ok && adr.Box == nil {
		panic("bug")
	}

	rctx.valueStack[slot] = val
}

func (rctx *RunContext) RunPrint(argslots []int) {
	for i := range argslots {
		val := rctx.GetValue(argslots[i])

		switch v := val.(type) {
		case bool:
			if v {
				fmt.Print("true")
			} else {
				fmt.Print("false")
			}
		case int64:
			fmt.Printf("%d", v)
		case string:
			fmt.Print(v)
		case *BoxedValue:
			fmt.Printf("<%p>", v)

		// TODO: Rest of value types.

		default:
			panic("missing case")
		}
	}
}

func (rctx *RunContext) RunReadFile(filenameslot int, retslot int) (failcode, faildesc string) {
	filename := rctx.GetValue(filenameslot).(string)

	file, err := os.Open(filename)
	if err != nil {
		return "OPEN_FAILED", err.Error()
	}
	defer file.Close()

	content, err := ioutil.ReadAll(file)
	if err != nil {
		return "READ_FAILED", err.Error()
	}

	array := make([]*BoxedValue, len(content))

	for i := range array {
		array[i] = &BoxedValue{int64(content[i])}
	}

	arrayval := &BoxedValue{ArrayValue{array}}

	rctx.SetValue(retslot, arrayval)
	return "", ""
}

func (rctx *RunContext) RunArgs(retslot int) (failcode, faildesc string) {
	array := make([]*BoxedValue, len(rctx.Args))

	for i := range array {
		array[i] = &BoxedValue{rctx.Args[i]}
	}

	arrayval := &BoxedValue{ArrayValue{array}}

	rctx.SetValue(retslot, arrayval)
	return "", ""
}

func (rctx *RunContext) RunLen(inslot, outslot int) {
	ptr := rctx.GetValue(inslot).(*BoxedValue)
	if ptr == nil {
		rctx.SetValue(outslot, int64(0))
	} else {
		val := ptr.Value.(ArrayValue)
		l := int64(len(val.Elements))
		rctx.SetValue(outslot, l)
	}
}

func (rctx *RunContext) RunString(inslot, outslot int) {
	arr := rctx.GetValue(inslot).(*BoxedValue).Value.(ArrayValue)
	l := len(arr.Elements)

	buf := make([]byte, l)

	for i := range buf {
		elem := arr.Elements[i].Value.(int64)
		if elem == 0 {
			rctx.SetValue(outslot, string(buf[:i]))
			return
		}
		if elem != int64(byte(elem)) {
			panic("invalid values in byte array")
		}
		buf[i] = byte(elem)
	}

	panic("byte array does not contain 0 in a call to string()")
}

func (rctx *RunContext) RunResize(inslot1, inslot2, outslot int) {
	old_ptr := rctx.GetValue(inslot1).(*BoxedValue)
	var old_arr ArrayValue
	var old_size int64
	if old_ptr == nil {
		old_arr = ArrayValue{nil}
		old_size = 0
	} else {
		old_arr = old_ptr.Value.(ArrayValue)
		old_size = int64(len(old_arr.Elements))
	}
	new_size := rctx.GetValue(inslot2).(int64)

	if new_size < old_size {
		new_arr := make([]*BoxedValue, new_size)
		for i := int64(0); i < new_size; i++ {
			new_arr[i] = &BoxedValue{ValueCopy(old_arr.Elements[i].Value)}
		}

		rctx.SetValue(outslot, &BoxedValue{ArrayValue{new_arr}})
		return
	}

	new_elems := make([]*BoxedValue, new_size)
	for i := range new_elems {
		if int64(i) < old_size {
			if old_arr.Elements[i] == nil {
				panic("bug")
			}

			new_elems[i] = &BoxedValue{ValueCopy(old_arr.Elements[i].Value)}
		} else {
			new_elems[i] = &BoxedValue{nil}
		}
	}
	rctx.SetValue(outslot, &BoxedValue{ArrayValue{new_elems}})
}

func (rctx *RunContext) RunMethod(m *Method, receiver Value, argslots []int, retvalslot int) (failcode, faildesc string) {

	if m == nil {
		panic("nil method")
	}

	switch m.builtinName {
	case "len":
		rctx.RunLen(argslots[0], retvalslot)
		return "", ""
	case "string":
		rctx.RunString(argslots[0], retvalslot)
		return "", ""
	case "resize":
		rctx.RunResize(argslots[0], argslots[1], retvalslot)
		return "", ""
	case "env.print":
		rctx.RunPrint(argslots)
		return "", ""
	case "env.read_file":
		return rctx.RunReadFile(argslots[0], retvalslot)
		//	case "env.read_dir":
		//	case "env.chdir":
		//	case "env.get_var":
		//	case "env.args":
	case "env.args":
		return rctx.RunArgs(retvalslot)
	default:
		panic("missing case: " + m.builtinName)
	case "":
		/* Proceed. */
	}

	var mc int

	if TRACE_CALLS {
		mc = mcallcount
		mcallcount++
		println("Entering method ", m.name, " ", mc)
	}

	if len(argslots) != len(m.Interface.inTypes) {
		panic("Mismatched method call of '" + m.name + "'.")
	}

	newvalstack := make([]Value, m.slots)

	if receiver != nil {
		newvalstack[0] = AddressableValue{&BoxedValue{ValueCopy(receiver)}}
	}

	for i := range argslots {
		val := rctx.GetValue(argslots[i])
		if val == nil {
			panic("nil argument")
		}
		newvalstack[i+1] = AddressableValue{&BoxedValue{ValueCopy(val)}}
	}

	oldvalstack := rctx.valueStack
	oldmethod := rctx.method
	oldfailhandler := rctx.FailHandler

	rctx.valueStack = newvalstack
	rctx.method = m
	rctx.FailHandler = nil

	// Prepare addressable locals.
	for l := range m.locals {
		slot := m.locals[l]

		if slot > len(argslots) {
			rctx.InitAddressable(slot, m.localTypes[l])
		}
	}

	///////

	inst := m.Entry
	check_running := false

instloop:
	for {
		if inst == nil {
			if check_running {
				break
			}

			check_running = true
			inst = m.ExitCheck
		}

		switch i := inst.(type) {
		case *IfInst:
			cond := rctx.GetValue(i.ConditionSlot)

			bcond, ok := cond.(bool)
			if !ok {
				panic("If condition is not boolean.")
			}

			if bcond {
				inst = i.TrueLabel
			} else {
				inst = i.FalseLabel
			}

		default:
			failcode, faildesc = rctx.RunInstruction(inst)
			if failcode != "" {
				if rctx.FailHandler != nil {
					inst = rctx.FailHandler
					rctx.FailHandler = nil
				} else {
					break instloop
				}
			} else {
				inst = inst.Next()
			}
		}
	}

	///////

	rctx.valueStack = oldvalstack
	rctx.method = oldmethod

	if rctx.FailHandler != nil {
		panic("bug")
	}
	rctx.FailHandler = oldfailhandler

	if failcode == "" && retvalslot >= 0 {
		tval := TupleValue{nil}

		for i := range m.Interface.outTypes {
			tval.List = append(tval.List, newvalstack[i+len(argslots)+1].(AddressableValue).Box.Value)
		}

		rctx.SetValue(retvalslot, tval)
	}

	if TRACE_CALLS {
		println("Exiting method ", m.name, " ", mc)
	}
	return
}

func (rctx *RunContext) Alloc(slot int, t Type) {
	val := ValueDefault(t)
	addr := &BoxedValue{val}
	rctx.SetValue(slot, addr)
}

func (rctx *RunContext) AllocArray(slot int, lengthslot int, t Type) {
	length := int(rctx.GetValue(lengthslot).(int64))

	boxes := make([]*BoxedValue, length)

	for i := 0; i < length; i++ {
		boxes[i] = &BoxedValue{ValueDefault(t)}
	}

	addr := &BoxedValue{ArrayValue{boxes}}
	rctx.SetValue(slot, addr)
}

func (rctx *RunContext) RunIndex(inst *IndexOpInst) {
	base := rctx.GetValue(inst.BaseSlot)
	index := rctx.GetValue(inst.IndexSlot).(int64)

	for {
		ptr, ok := base.(*BoxedValue)
		if !ok {
			break
		}
		base = ptr.Value
	}

	elems := base.(ArrayValue).Elements
	box := elems[index]

	if box == nil {
		panic("array box nil: " + strconv.Itoa(int(index)+1) + "/" + strconv.Itoa(len(elems)))
	}

	val := AddressableValue{box}

	rctx.SetValue(inst.TargetSlot, val)
}

func (rctx *RunContext) TypeCheck(v Value, t Type) bool {
	bv, ok1 := v.(*BoxedValue)
	pt, ok2 := t.(*PointerType)

	if ok1 && ok2 {
		v = bv.Value
		t = pt.base

		switch t.(type) {
		case *IntType:
			_, ok := v.(int64)
			return ok
		case *BoolType:
			_, ok := v.(bool)
			return ok
		case *StringType:
			_, ok := v.(string)
			return ok
		case *StructType:
			sv, ok := v.(StructValue)
			return ok && sv.Type == t
		default:
			// TODO: missing cases
			panic(t.(*IntType))
		}
	}

	return false
}

func (rctx *RunContext) RunTypeCheck(inst *TypeCheckInst) {
	rctx.SetValue(inst.TargetSlot, rctx.TypeCheck(rctx.GetValue(inst.SourceSlot), inst.Type))
}

func (rctx *RunContext) RunIncrement(inst *IncrementInst) {
	targetval := rctx.GetValue(inst.TargetSlot).(int64)
	addval := inst.Value.(int64)

	if addval > 0 && targetval+addval < targetval {
		panic("integer overflow")
	}
	if addval < 0 && targetval+addval > targetval {
		panic("integer overflow")
	}

	if DEBUGINST {
		print("INC <", inst.TargetSlot, ">, ", addval, " (", targetval, "->", targetval+addval, ")\n")
	}

	rctx.AssignValue(inst.TargetSlot, Value(targetval+addval))
}

func (rctx *RunContext) RunInstruction(inst Instruction) (failcode, faildesc string) {
	switch i := inst.(type) {
	case *NopInst:
		/* Nothing. */
	case *BinaryOpInst:
		rctx.RunBinaryOp(i)
	case *UnaryOpInst:
		rctx.RunUnaryOp(i)
	case *SelectorOpInst:
		rctx.RunSelector(i)
	case *SetValueInst:
		rctx.SetValue(i.TargetSlot, ValueCopy(i.Value))
	case *AllocInst:
		rctx.Alloc(i.TargetSlot, i.Type)
	case *AllocArrayInst:
		rctx.AllocArray(i.TargetSlot, i.LengthSlot, i.Type)
	case *MethodCallInst:
		var recv Value
		// Implicit reference on addressable types.
		if rctx.IsAddressable(i.ReceiverSlot) {
			recv = rctx.GetAddress(i.ReceiverSlot)
		} else {
			recv = rctx.GetValue(i.ReceiverSlot)
		}

		recv, m := ValueMethodNonNil(recv, i.Method)
		failcode, faildesc = rctx.RunMethod(m, recv, i.ArgSlots, i.RetvalSlot)
	case *FuncCallInst:
		failcode, faildesc = rctx.RunMethod(i.Func, nil, i.ArgSlots, i.RetvalSlot)
	case *IndexOpInst:
		rctx.RunIndex(i)
	case *TypeCheckInst:
		rctx.RunTypeCheck(i)
	case *IncrementInst:
		rctx.RunIncrement(i)
	case *FailRecoverEntryInst:
		if rctx.FailHandler != nil {
			panic("bug")
		}
		rctx.FailHandler = i.Handler
	case *FailRecoverExitInst:
		rctx.FailHandler = nil
	case *FailInst:
		failcode, faildesc = i.Code, i.Description+" (method: "+i.FuncName+")"
	case *AssignmentInst:
		rctx.RunAssignment(i)
	default:
		panic("missing case")
	}

	return
}

func (rctx *RunContext) RunBinaryOp(inst *BinaryOpInst) {
	num1 := int64(0)
	num2 := int64(0)

	switch inst.Operation {
	case BIN_MUL, BIN_CDIV, BIN_CMOD, BIN_BIT_OR, BIN_BIT_XOR, BIN_BIT_AND, BIN_BIT_LSHIFT, BIN_BIT_RSHIFT, BIN_LESS_THAN:
		num1 = rctx.GetValue(inst.SourceSlot1).(int64)
		num2 = rctx.GetValue(inst.SourceSlot2).(int64)
	case BIN_PLUS, BIN_EQUAL:
		/* Nothing. */
	default:
		panic("missing case")
	}

	retval := Value(nil)

	switch inst.Operation {
	case BIN_PLUS:
		val1 := rctx.GetValue(inst.SourceSlot1)
		val2 := rctx.GetValue(inst.SourceSlot2)

		_, isint := val1.(int64)

		if isint {
			num1 = val1.(int64)
			num2 = val2.(int64)

			sum := num1 + num2
			if num1 > 0 && num2 > 0 && (sum < num1 || sum < num2) {
				panic("hit int limit")
			}
			if num1 < 0 && num2 < 0 && (sum > num1 || sum > num2) {
				panic("hit int limit")
			}
			retval = sum
		} else {
			str1 := val1.(string)
			str2 := val2.(string)
			retval = str1 + str2
		}
	case BIN_MUL:
		mult := num1 * num2
		if mult/num2 != num1 {
			panic("hit int limit")
		}
		retval = mult

	case BIN_CDIV:
		// ((2^63-1) / -1) is the only overflow case.
		if num2 == -1 && num1 > 0 && (num1+1) < 0 {
			panic("hit int limit")
		}

		retval = num1 / num2

	case BIN_CMOD:
		retval = num1 % num2

	case BIN_BIT_OR:
		if num1 < 0 || num2 < 0 {
			panic("bit ops on negative numbers")
		}
		retval = num1 | num2

	case BIN_BIT_XOR:
		if num1 < 0 || num2 < 0 {
			panic("bit ops on negative numbers")
		}
		retval = num1 ^ num2

	case BIN_BIT_AND:
		if num1 < 0 || num2 < 0 {
			panic("bit ops on negative numbers")
		}
		retval = num1 & num2

	case BIN_BIT_LSHIFT:
		if num1 < 0 || num2 < 0 {
			panic("bit ops on negative numbers")
		}
		if num2 > 64 || (uint64(num1)&((^uint64(0))>>uint64(num2+1)) != uint64(num1)) {
			panic("hit int limit")
		}
		retval = num1 << uint64(num2)

	case BIN_BIT_RSHIFT:
		if num1 < 0 || num2 < 0 {
			panic("bit ops on negative numbers")
		}
		retval = num1 >> uint64(num2)

	case BIN_EQUAL:
		if rctx == nil {
			panic("bug")
		}
		if inst == nil {
			panic("bug")
		}
		v1 := rctx.GetValue(inst.SourceSlot1)
		v2 := rctx.GetValue(inst.SourceSlot2)
		retval = ValueEqual(v1, v2)

	case BIN_LESS_THAN:
		retval = (num1 < num2)

	default:
		panic("missing case")
	}

	rctx.SetValue(inst.TargetSlot, retval)
}

func (rctx *RunContext) RunAssignment(inst *AssignmentInst) {

	var vals []Value

	for _, slot := range inst.SrcSlots {
		val := rctx.GetTuple(slot)
		tuple, ok := val.(TupleValue)

		// A copy is used because an assignment could possibly result in a shared structure.
		if ok {
			for j := range tuple.List {
				vals = append(vals, ValueCopy(tuple.List[j]))
			}
		} else {
			vals = append(vals, ValueCopy(val))
		}
	}

	if len(vals) != len(inst.DstSlots) {
		panic("Mismatched assignment in method " + inst.FuncName)
	}

	for i := range inst.DstSlots {
		rctx.AssignValue(inst.DstSlots[i], vals[i])
	}
}

func (rctx *RunContext) RunUnaryOp(inst *UnaryOpInst) {
	switch inst.Operation {
	case UN_MOVE:
		// TODO: Rename to TAKE.
		val := rctx.GetValue(inst.SourceSlot)
		rctx.SetValue(inst.TargetSlot, val)
		rctx.AssignValue(inst.SourceSlot, (*BoxedValue)(nil))

	case UN_MINUS:
		num := rctx.GetValue(inst.SourceSlot).(int64)
		if num != 0 && (num < 0) == ((-num) < 0) {
			panic("hit int limit")
		}
		rctx.SetValue(inst.TargetSlot, -num)

	case UN_DEREF:
		val := rctx.GetValue(inst.SourceSlot).(*BoxedValue)
		if val == nil {
			panic("null dereference")
		}

		rctx.SetValue(inst.TargetSlot, AddressableValue{val})

	case UN_REF:
		val := rctx.GetAddress(inst.SourceSlot)
		rctx.SetValue(inst.TargetSlot, val)

	case UN_NOT:
		val := rctx.GetValue(inst.SourceSlot).(bool)
		rctx.SetValue(inst.TargetSlot, !val)

	default:
		panic("missing case")
	}
}

func (rctx *RunContext) RunSelector(inst *SelectorOpInst) {
	var val Value

	// Implicit reference on addressable types.
	if rctx.IsAddressable(inst.SourceSlot) {
		val = rctx.GetAddress(inst.SourceSlot)
	} else {
		val = rctx.GetValue(inst.SourceSlot)
	}

	result := ValueMember(val, inst.Selector, inst.FuncName)
	if result == nil {
		panic("something bad happened")
	}
	_ = result.(AddressableValue)
	rctx.SetValue(inst.TargetSlot, result)
}
