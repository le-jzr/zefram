
func main()
{
	var i = 0
	var j = 1
	var k = 0

	switch i
	case 1 {
		env.print("fail")
	}
	case 2 {
		env.print("fail")
	};;
	
	switch i
	case j {
		env.print("fail")
	}
	case 5 {
		env.print("fail")
	}
	default {
		env.print("pass\n")
	};;
	
	switch i
	case j {
		env.print("fail")
	}
	case 5 {
		env.print("fail")
	}
	case k {
		env.print("pass\n")
	}
	case 0 {
		env.print("fail")
	}
	default {
		env.print("fail")
	};;
	
	switch
	case j == k {
		env.print("fail")
	}
	case i == 0 {
		env.print("pass\n")
	}
	case true {
		env.print("fail")
	};;
	
	switch "hello"
	case "hello" {
		env.print("pass\n")
	}
	case "world" {
		env.print("fail")
	}
	default {
		env.print("fail")
	};;
	
	env.print("should have printed 4 passes\n")
}
