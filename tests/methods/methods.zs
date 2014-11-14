
type MethodTest = struct {
	val1: int
}

func (t: MethodTest) inc1()
{
	t.val1 = t.val1 + 1
}

func (t: *MethodTest) inc2()
{
	t.val1 = t.val1 + 2
}


func main()
{
	var test1: MethodTest
	var test2 = new(MethodTest) 
	var test3 = test1
	var test4 = test2
	
	test1.inc1()
	test1.inc2()
	
	test2.inc1()
	test2.inc2()
	
	env.print("test1: ", test1.val1, "\n")
	env.print("test2: ", test2.val1, "\n")
	env.print("test3: ", test3.val1, "\n")
	env.print("test4: ", test4.val1, "\n")
}
