
define fibonacci1(x: int) (result: int)
	requires x >= 0
	recursion_bound x
{
	
	if x <= 0 {
		return 0
	}
	if x <= 1 {
		return 1
	}
	
	return fibonacci1(x-2) + fibonacci1(x-1)
}

define fibonacci2(a, b, c, x: int) (result: int)
	requires a >= 0, b >= 0, c >= 0, x >= 0, x >= c
	recursion_bound x - c
	ensures !(a == fibonacci1(c) && b == fibonacci1(c+1)) || result == fibonacci1(x)
{
	if c >= x {
		return a
	}
	
	return fibonacci2(b, a + b, c + 1, x) 
}

func fibonacci3(x: int) (result: int)
	requires x >= 0
	recursion_bound x
	ensures result == fibonacci1(x)
	ensures result == fibonacci2(0, 1, x)
{
	var a = 0
	var b = 1
	var c = 0
	
	while c < x
		invariant a == fibonacci1(c)
		invariant a == fibonacci2(0, 1, 0, c)
	{
		a, b, c = b, a + b, c + 1
	}
	
	return a
}
