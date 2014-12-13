
type ImportResolver = struct {
	ast.VisitorBase
	
}

func (v: *ImportResolver) 

	previsit_named_type(ast: *ASTNamedType)
	postvisit_named_type(ast: *ASTNamedType)
	visit_named_type(ast: *ASTNamedType)
	
	previsit_struct_member(ast: *ASTStructMember)
	postvisit_struct_member(ast: *ASTStructMember)
	visit_struct_member(ast: *ASTStructMember)
	
	previsit_may_fail(ast: *ASTMayFail)
	postvisit_may_fail(ast: *ASTMayFail)
	visit_may_fail(ast: *ASTMayFail)
	
	previsit_recoverable(ast: *ASTRecoverable)
	postvisit_recoverable(ast: *ASTRecoverable)
	visit_recoverable(ast: *ASTRecoverable)
	
	previsit_struct_type(ast: *ASTStructType)
	postvisit_struct_type(ast: *ASTStructType)
	visit_struct_type(ast: *ASTStructType)

	previsit_ensures(ast: *ASTEnsures)
	postvisit_ensures(ast: *ASTEnsures)
	visit_ensures(ast: *ASTEnsures)

	previsit_global(ast: *ASTGlobal)
	postvisit_global(ast: *ASTGlobal)
	visit_global(ast: *ASTGlobal)

func (v: *ImportResolver) postvisit_type_ref(node: *ast.TypeRef) {

	if node.__package == null {
		// FIXME: finish
	}

	var pkg = v.get_package(*node.__package)
	
	if pkg == null {
		node.mark_error()
		report.error(node, "No package '" + *node.__package + "' known.")
		node.set_type(new_UnknownType())
		return
	}
	
	var t = pkg.get_type(node.__name
}
	
func (v: *ImportResolver) postvisit_range_type(node: *ast.RangeType) {
	if !node.__low.is_int_constant() && !node.__low.is_error() {
		node.mark_error()
		report.error(node.__low, "Range type's lower bound is not an integer constant.")
	}
	
	if !node.__high.is_int_constant() && !node.__high.is_error() {
		node.mark_error()
		report.error(node.__high, "Range type's upper bound is not an integer constant.")
	}
	
	node.set_type(new_RangeType(node.__low.int_constant(), node.__high.int_constant()))
}
	
	previsit_pointer_type(ast: *ASTPointerType)
	postvisit_pointer_type(ast: *ASTPointerType)
	visit_pointer_type(ast: *ASTPointerType)
	
	previsit_parameter(ast: *ASTParameter)
	postvisit_parameter(ast: *ASTParameter)
	visit_parameter(ast: *ASTParameter)
	
	previsit_type(ast: *ASTType)
	postvisit_type(ast: *ASTType)
	visit_type(ast: *ASTType)

	previsit_requires(ast: *ASTRequires)
	postvisit_requires(ast: *ASTRequires)
	visit_requires(ast: *ASTRequires)

	previsit_invariant_all(ast: *ASTInvariantAll)
	postvisit_invariant_all(ast: *ASTInvariantAll)
	visit_invariant_all(ast: *ASTInvariantAll)

	previsit_method(ast: *ASTMethod)
	postvisit_method(ast: *ASTMethod)
	visit_method(ast: *ASTMethod)

	previsit_selection_type(ast: *ASTSelectionType)
	postvisit_selection_type(ast: *ASTSelectionType)
	visit_selection_type(ast: *ASTSelectionType)

	previsit_recursion_bound(ast: *ASTRecursionBound)
	postvisit_recursion_bound(ast: *ASTRecursionBound)
	visit_recursion_bound(ast: *ASTRecursionBound)

	previsit_array_type(ast: *ASTArrayType)
	postvisit_array_type(ast: *ASTArrayType)
	visit_array_type(ast: *ASTArrayType)

	previsit_method_contract(ast: *ASTMethodContract)
	postvisit_method_contract(ast: *ASTMethodContract)
	visit_method_contract(ast: *ASTMethodContract)

	previsit_typedef(ast: *ASTTypedef)
	postvisit_typedef(ast: *ASTTypedef)
	visit_typedef(ast: *ASTTypedef)

	previsit_requires_all(ast: *ASTRequiresAll)
	postvisit_requires_all(ast: *ASTRequiresAll)
	visit_requires_all(ast: *ASTRequiresAll)

	previsit_interface_member(ast: *ASTInterfaceMember)
	postvisit_interface_member(ast: *ASTInterfaceMember)
	visit_interface_member(ast: *ASTInterfaceMember)

	previsit_method_signature(ast: *ASTMethodSignature)
	postvisit_method_signature(ast: *ASTMethodSignature)
	visit_method_signature(ast: *ASTMethodSignature)

	previsit_identifier(ast: *ASTIdentifier)
	postvisit_identifier(ast: *ASTIdentifier)
	visit_identifier(ast: *ASTIdentifier)

	previsit_ensures_all(ast: *ASTEnsuresAll)
	postvisit_ensures_all(ast: *ASTEnsuresAll)
	visit_ensures_all(ast: *ASTEnsuresAll)

	previsit_interface_type(ast: *ASTInterfaceType)
	postvisit_interface_type(ast: *ASTInterfaceType)
	visit_interface_type(ast: *ASTInterfaceType)

}
