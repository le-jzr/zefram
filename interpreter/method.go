package main

type Method struct {
	ast *ASTMethod

	builtinName string

	Imports map[string]*Package

	name string

	locals     map[string]int
	localTypes map[string]Type
	slots      int

	ReceiverType Type
	Interface    MethodInterface

	Entry     Instruction
	ExitCheck Instruction
}

func LoadInterface(name string, imports map[string]*Package, ast *ASTMethodSignature) (sig MethodInterface) {
	sig.name = name

	sig.inTypes = make([]Type, len(ast._in_params))
	for i := range ast._in_params {
		sig.inTypes[i] = LoadType(imports, ast._in_params[i]._type, false)
	}

	sig.outTypes = make([]Type, len(ast._out_params))
	for i := range ast._out_params {
		sig.outTypes[i] = LoadType(imports, ast._out_params[i]._type, false)
	}
	return
}

func NewMethod(imports map[string]*Package, ast *ASTMethod) *Method {
	m := new(Method)
	m.ast = ast
	m.Imports = imports
	m.name = ast._name
	m.locals = make(map[string]int)
	m.localTypes = make(map[string]Type)
	if ast._receiver != nil {
		m.ReceiverType = LoadType(imports, ast._receiver._type, false)
	}
	m.Interface = LoadInterface(m.name, imports, ast._signature)
	return m
}

func NewBuiltinMethod(name string, rettypes []Type) *Method {
	m := new(Method)
	m.builtinName = name

	m.Interface.outTypes = rettypes
	return m
}

func (m *Method) Builtin() bool {
	return m.builtinName != ""
}

func (m *Method) Name() string {
	return m.name
}

func (m *Method) HasLocal(name string) bool {
	_, ok := m.locals[name]
	return ok
}

func (m *Method) AllocSlot() int {
	m.slots++
	return m.slots - 1
}

func (m *Method) DeclareLocal(name string, t Type) {
	_, ok := m.locals[name]
	if ok {
		panic("Local " + name + " already exists.")
	}
	m.locals[name] = m.AllocSlot()
	m.localTypes[name] = t
}

func (m *Method) VarSlot(name string) int {
	slot, ok := m.locals[name]
	if !ok {
		panic("unknown variable " + name)
	}
	return slot
}

func (m *Method) Resolve() {
	if m.ReceiverType != nil {
		m.ReceiverType = m.ReceiverType.Resolved()

		t := m.ReceiverType
		pt, ok := t.(*PointerType)
		if ok {
			t = pt.base
		}
		t.(*StructType).AddMethod(m)
	}

	for i := range m.Interface.inTypes {
		m.Interface.inTypes[i] = m.Interface.inTypes[i].Resolved()
	}

	for i := range m.Interface.outTypes {
		m.Interface.outTypes[i] = m.Interface.outTypes[i].Resolved()
	}
}
