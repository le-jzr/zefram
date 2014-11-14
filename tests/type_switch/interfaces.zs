
type Type1 = struct {
	val: int
}

func (v: *Type1) print_something()
{
	env.print("Type1.print_something()\n")
}

type Type2 = struct {
	str: string
}

func (v: *Type2) print_something()
{
	env.print("Type2.print_something(), ", v.str, "\n")
}

type Type3 = struct {
}

func (v: *Type3) print_something()
{
	env.print("Type3.print_something()\n")
}

type Iface1 = interface {
	print_something()
}

type Iface2 = Type1 | Type2 | Type3

func main()
{
	
	var v1: Type1
	var v2: Type2
	v2.str = "booo"
	var v3: Type3
	
	var i1: *Iface1
	var i2: *Iface1
	var i3: *Iface1
	
	i1 = &v1
	i2 = &v2
	i3 = &v3
	
	i1.print_something()
	i2.print_something()
	i3.print_something()

	type switch i1
	case *Type1 {
		env.print("Type1\n")
	}
	case *Type2 {
		env.print("Type2\n")
	}
	case *Type3 {
		env.print("Type3\n")
	}
	default {
		env.print("unknown type\n")
	};;
	
	type switch i3
	case *Type1 {
		env.print("Type1\n")
	}
	case *Type2 {
		env.print("Type2\n")
	}
	case *Type3 {
		env.print("Type3\n")
	}
	default {
		env.print("unknown type\n")
	};;
	
	type switch 5
	case *Type1 {
		env.print("Type1\n")
	}
	case *Type2 {
		env.print("Type2\n")
	}
	case *Type3 {
		env.print("Type3\n")
	}
	default {
		env.print("unknown type\n")
	};;
	
	type switch i2
	case *Type1 {
		env.print("Type1\n")
	}
	case *Type2 {
		env.print("Type2\n")
	}
	case *Type3 {
		env.print("Type3\n")
	}
	default {
		env.print("unknown type\n")
	};;
}
