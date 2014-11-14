
func hello()
{
	env.print("Hello world.\n")
}

func end()
{
	env.print("End.\n")
}

// TODO: define instead of func
func _fib(i: int) (r: int)
	requires i >= 0
	recursion_bound i
{
	if i <= 1 {
		return i
	}
	return _fib(i-1) + _fib(i-2)
}

func fibonacci(i: range(0..100)) (r: int)
	ensures r == _fib(i)
{
	var a = 0
	var b = 1
	var c = 0
	
	while c < i
		invariant a == _fib(c)
		//loop_bound (i - c)
	{
		a, b = b, a + b
		c++
	}
	
	return a
}

func main()
{
	assert fibonacci(0) == 0
	assert fibonacci(1) == 1
	assert all i (i < 2 || fibonacci(i) == fibonacci(i-1) + fibonacci(i-2))

	var i = 0
	
	while i < 10 {
		hello()
		i++
	}
	
	end()
	var j = 25
	
	while j >= 0 {
	
		var fib = fibonacci(j)
		
		assert(fib == _fib(j))
	
		env.print(fib, ", ")
		j--
	}
	
	env.print("\n")
}
