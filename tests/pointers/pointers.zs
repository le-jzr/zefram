
func testfunc8(pi: *int) (ret: int)
{
	*pi = 8
	var j = *pi
	pi = null
	
	return j
}

func main()
{
	var i = 5
	var j = 16
	
	var pi = &i
	
	*pi = 10
	
	if *pi != i {
		env.print("fail 1")
	}
	
	if testfunc8(pi) != 8 {
		env.print("fail 2")
	}
	
	if *pi != 8 {
		env.print("fail 3")
	}
	
	if i != 8 {
		env.print("fail 4")
	}
	
	if j != 16 {
		env.print("fail 5")
	}
	
	
	var dyn = new(int)
	
	var dyn2 = @dyn
	
	if dyn != null {
		env.print("fail 6")
	}
	
	if testfunc8(dyn2) != *dyn2 {
		env.print("fail 7")
	}
	
	delete @dyn2
	
	delete new(int)
}
