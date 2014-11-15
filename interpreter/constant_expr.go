package main

func (ex *ASTDecimal) ConstantInt() int64 {
	return loadInt(ex._str, 10)
}

func (ex *ASTOctal) ConstantInt() int64 {
	return loadInt(ex._str, 8)
}

func (ex *ASTHexaDecimal) ConstantInt() int64 {
	return loadInt(ex._str, 16)
}

// TODO: Other expressions.
