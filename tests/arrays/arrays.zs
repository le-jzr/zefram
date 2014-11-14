
func main()
{
	var array: [5]int
	
	var i = 0
	while i < 5 {
		if array[i] != 0 {
			env.print("fail 1 on index ", i, ", value ", array[i], "\n")
		}
		
		array[i] = i
		
		i = i + 1
	}
	
	i = 0
	while i < 5 {
		env.print(array[i], "\n")
		
		i = i + 1
	}
	
	i = 10
	
	var dynarray = new[i + 5](int)
	
	i = 1
	while i < len(dynarray) {
		dynarray[i] = dynarray[i-1] * 2 + 1
		i = i + 1
	}
	
	var elemptr = &dynarray[5]
	*elemptr = -1
	
	i = 0
	while i < len(dynarray) {
		env.print(dynarray[i], "\n")
		i = i + 1
	}
	
	delete @dynarray
}
