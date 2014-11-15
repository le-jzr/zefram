package main

type ASTBase struct {
	slot  int
	first Instruction
	last  Instruction
}

func (b *ASTBase) Transcribe(ctx *TranscribeContext) {
	panic("transcribe called on a bad object")
}

func (b *ASTBase) Slot() int {
	return b.slot
}

func (b *ASTBase) SetSlot(slot int) {
	if b.slot != 0 {
		panic("slot is already set")
	}
	b.slot = slot
}

func (b *ASTBase) Sequence(args ...interface{}) {
	if b.first != nil || b.last != nil {
		panic("bug")
	}

	if len(args) == 0 {
		nop := new(NopInst)
		b.first = nop
		b.last = nop
		return
	}

	for i := range args {
		switch in := args[i].(type) {
		case Instruction:
			if b.first == nil {
				b.first = in
				b.last = in
			} else {
				b.last.SetNext(in)
				b.last = in
			}

		case ASTBaseInterface:
			if b.first == nil {
				b.first = in.First()
				b.last = in.Last()
			} else {
				b.last.SetNext(in.First())
				b.last = in.Last()
			}

		default:
			panic("missing case")
		}
	}
}

func (b *ASTBase) AllocStackSlot(ctx *TranscribeContext) int {
	if b.slot != 0 {
		panic("already has a slot")
	}

	b.slot = ctx.Method.AllocSlot()
	return b.slot
}

func (b *ASTBase) First() Instruction {
	if b.first == nil {
		panic("bug")
	}
	return b.first
}

func (b *ASTBase) Last() Instruction {
	if b.last == nil {
		panic("bug")
	}
	return b.last
}

func (b *ASTBase) SetFirst(i interface{}) {
	if b.first != nil {
		panic("bug")
	}

	switch in := i.(type) {
	case Instruction:
		b.first = in

	case ASTBaseInterface:
		b.first = in.First()

	default:
		panic("missing case")
	}
}

func (b *ASTBase) SetLast(i interface{}) {
	if b.last != nil {
		panic("bug")
	}

	switch in := i.(type) {
	case Instruction:
		b.last = in

	case ASTBaseInterface:
		b.last = in.Last()

	default:
		panic("missing case")
	}
}

func (b *ASTBase) SetNext(i interface{}) {
	if b.last == nil {
		panic("bug")
	}

	switch in := i.(type) {
	case Instruction:
		b.last.SetNext(in)

	case ASTBaseInterface:
		b.last.SetNext(in.First())

	default:
		panic("missing case")
	}
}

func (b *ASTBase) ResetLast(i interface{}) {
	switch in := i.(type) {
	case Instruction:
		b.last = in

	case ASTBaseInterface:
		b.last = in.Last()

	default:
		panic("missing case")
	}
}

func (b *ASTBase) ConstantInt() int64 {
	panic("Trying to get constant int value of something that is not a constant expression.")
}

type ASTBaseInterface interface {
	Transcribe(*TranscribeContext)
	Slot() int
	SetSlot(int)
	Sequence(args ...interface{})
	AllocStackSlot(ctx *TranscribeContext) int
	First() Instruction
	Last() Instruction
	SetFirst(i interface{})
	SetLast(i interface{})
	ResetLast(i interface{})
	SetNext(i interface{})
	Copy() ASTBaseInterface
	ConstantInt() int64
}

func is_whitespace(b byte) bool {
	return b == ' ' || b == '\n' || b == '\t' || b == '\r'
}

func trim(data []byte) []byte {
	for len(data) > 0 && is_whitespace(data[0]) {
		data = data[1:]
	}
	for len(data) > 0 && is_whitespace(data[len(data)-1]) {
		data = data[:len(data)-1]
	}
	return data
}

func hexNum(c byte) byte {
	if c >= '0' && c <= '9' {
		return c - '0'
	}
	if c >= 'a' && c <= 'f' {
		return 10 + c - 'a'
	}
	panic("invalid escape sequence")
}

func parseHex(bytes []byte) byte {
	if bytes[1] != 'x' {
		panic("invalid escape sequence")
	}

	return hexNum(bytes[2])<<4 | hexNum(bytes[3])
}

func unescape(data []byte) string {
	buf := make([]byte, len(data))
	i := 0

	for len(data) > 0 {
		if data[0] == '\\' {
			buf[i] = parseHex(data)
			data = data[4:]
		} else {
			buf[i] = data[0]
			data = data[1:]
		}
		i++
	}

	return string(buf[:i])
}

func nextPart(data []byte) (interface{}, []byte) {
	data = trim(data)

	if len(data) == 0 {
		return nil, nil
	}

	if data[0] == '(' {
		level := 0

		for index := 0; index < len(data); index++ {
			switch data[index] {
			case '(':
				level++
			case ')':
				level--
				if level == 0 {
					return data[:index+1], data[index+1:]
				}
			case '"':
				index++
				for data[index] != '"' {
					index++
				}
			default:
			}
		}

		panic("invalid input file")
	}

	if data[0] == '"' {
		for index := 1; index < len(data); index++ {
			if data[index] == '"' {
				return unescape(data[1:index]), data[index+1:]
			}
		}
	}

	panic("invalid input file")
}

func SplitSExp(data []byte) []interface{} {
	parts := []interface{}{}

	for len(data) != 0 {
		var part interface{}
		part, data = nextPart(data)
		if part != nil {
			parts = append(parts, part)
		}
	}

	return parts
}

func UnpackSExp(data []byte) []byte {
	data = trim(data)

	if data[0] != '(' {
		panic("invalid input file")
	}

	data = data[1:]

	if data[len(data)-1] != ')' {
		panic("invalid input file")
	}

	data = data[:len(data)-1]
	return data
}
