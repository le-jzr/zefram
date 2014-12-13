
// As of 2014-08-20 this resolver is really simple because there are no named
// constants in the language, yet.
//
// This visitor only assigns value as a metadata on syntactically constant
// expressions. Specifically, it does not do any AST simplification
// or code elimination or whatever; that is a job for later phases.
//
// TODO: Make it possible to evaluate constant function calls.
//
type ConstantResolver = struct {
	node.VisitorBase
	
	
}

func (v: *ConstantResolver) postvisit_not(node: *ast.Not) {
	if node.__arg.is_bool_constant() {
		node.set_bool_constant(!node.__arg.bool_constant())
	}
}

func (v: *ConstantResolver) postvisit_indexed(node: *ast.Indexed) {
	// TODO: Eventually there may be constant arrays, in which case this
	// will have to be resolved.
}

func (v: *ConstantResolver) postvisit_rshift(node: *ast.RShift) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var right = node.__right.int_constant()
		if right < 0 {
			report.error(node.__right, "Shifting by a negative constant.")
		} else {
			node.set_int_constant(node.__left.int_constant() >> right)
		}
	}
}

func (v: *ConstantResolver) postvisit_binary_plus(node: *ast.BinaryPlus) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_int_constant(node.__left.int_constant() + node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_unary_plus(node: *ast.UnaryPlus) {
	if node.__arg.is_int_constant() {
		node.set_int_constant(node.__arg.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_pexpression(node: *ast.PExpression) {
	if node.__arg.is_bool_constant() {
		node.set_bool_constant(node.bool_constant())
	}
	
	if node.__arg.is_int_constant() {
		node.set_int_constant(node.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_greater_eq(node: *ast.GreaterEq) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_bool_constant(node.__left.int_constant() >= node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_bit_and(node: *ast.BitAnd) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var left = node.__left.int_constant()
		var right = node.__right.int_constant()
		if left < 0 || right < 0 {
			report.error(node, "Negative constant in a bitwise operation.")
		} else {
			node.set_int_constant(left & right)
		}
	}
}

func (v: *ConstantResolver) postvisit_mod(node: *ast.Mod) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var divisor = node.__right.int_constant()
		if divisor == 0 {
			report.error(node.__right, "Division by constant zero.")
		} else {
			node.set_int_constant(node.__left.int_constant() % divisor)
		}
	}
}

func (v: *ConstantResolver) postvisit_or(node: *ast.Or) {
	if node.__left.is_bool_constant() && node.__right.is_bool_constant() {
		node.set_bool_constant(node.__left.bool_constant() || node.__right.bool_constant())
	}
}

func (v: *ConstantResolver) postvisit_div(node: *ast.Div) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var divisor = node.__right.int_constant()
		if divisor == 0 {
			report.error(node.__right, "Division by constant zero.")
		} else {
			node.set_int_constant(node.__left.int_constant() / divisor)
		}
	}
}

func (v: *ConstantResolver) postvisit_hexa_decimal(node: *ast.HexaDecimal) {
	node.set_int_constant(v.parse_int(node.__str, 16))
}

func (v: *ConstantResolver) postvisit_bit_xor(node: *ast.BitXor) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var left = node.__left.int_constant()
		var right = node.__right.int_constant()
		if left < 0 || right < 0 {
			report.error(node, "Negative constant in a bitwise operation.")
		} else {
			node.set_int_constant(left ^ right)
		}
	}
}

func (v: *ConstantResolver) postvisit_less_eq(node: *ast.LessEq) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_bool_constant(node.__left.int_constant() <= node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_method_call(node: *ast.MethodCall) {
	// TODO
}

func (v: *ConstantResolver) postvisit_bit_or(node: *ast.BitOr) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var left = node.__left.int_constant()
		var right = node.__right.int_constant()
		if left < 0 || right < 0 {
			report.error(node, "Negative constant in a bitwise operation.")
		} else {
			node.set_int_constant(left | right)
		}
	}
}

func (v: *ConstantResolver) postvisit_inequal(node: *ast.Inequal) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_bool_constant(node.__left.int_constant() != node.__right.int_constant())
	}
	
	if node.__left.is_bool_constant() && node.__right.is_bool_constant() {
		node.set_bool_constant(node.__left.bool_constant() != node.__right.bool_constant())
	}
}

func (v: *ConstantResolver) postvisit_mult(node: *ast.Mult) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_int_constant(node.__left.int_constant() * node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_greater(node: *ast.Greater) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_bool_constant(node.__left.int_constant() > node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_binary_minus(node: *ast.BinaryMinus) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_int_constant(node.__left.int_constant() - node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_unary_minus(node: *ast.UnaryMinus) {
	if node.__arg.is_int_constant() {
		node.set_int_constant(-node.__arg.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_identifier(node: *ast.Identifier) {
	// TODO
}

func (v: *ConstantResolver) postvisit_selector(node: *ast.Selector) {
	// TODO: constant structures
}

func (v: *ConstantResolver) postvisit_char(node: *ast.Char) {
	// TODO: Are character constants useful?
}

func (v: *ConstantResolver) postvisit_and(node: *ast.And) {
	if node.__left.is_bool_constant() && node.__right.is_bool_constant() {
		node.set_bool_constant(node.__left.bool_constant() && node.__right.bool_constant())
	}
}

func (v: *ConstantResolver) postvisit_equal(node: *ast.Equal) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_bool_constant(node.__left.int_constant() == node.__right.int_constant())
	}
	
	if node.__left.is_bool_constant() && node.__right.is_bool_constant() {
		node.set_bool_constant(node.__left.bool_constant() == node.__right.bool_constant())
	}
}

func (v: *ConstantResolver) postvisit_less(node: *ast.Less) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		node.set_bool_constant(node.__left.int_constant() < node.__right.int_constant())
	}
}

func (v: *ConstantResolver) postvisit_decimal(node: *ast.Decimal) {
	node.set_int_constant(v.parse_int(node.__str, 10))
}

func (v: *ConstantResolver) postvisit_octal(node: *ast.Octal) {
	node.set_int_constant(v.parse_int(node.__str, 8))
}

func (v: *ConstantResolver) postvisit_string(node: *ast.String) {
	// TODO
}

func (v: *ConstantResolver) postvisit_lshift(node: *ast.LShift) {
	if node.__left.is_int_constant() && node.__right.is_int_constant() {
		var right = node.__right.int_constant()
		if right < 0 {
			report.error(node.__right, "Shifting by a negative constant.")
		} else {
			node.set_int_constant(node.__left.int_constant() << right)
		}
	}
}
