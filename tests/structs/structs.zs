
type Structure = struct {
	member1: int
	member2: range(0..5)
	member3: bool
	member4: [5]int
	member5: [5][6][7]int
//	member6: *[]int
}

func main()
{
	var s1: Structure
	s1.member1 = 5
	(&s1).member4[0] = 5
	
	var s2 = new(Structure)
	*s2 = s1
	s2.member1 = 6
	(*s2).member2 = 3
	s2.member3 = true
	s2.member5[0][1][2] = 3
	
	var s3 = s1
	s3.member1 = 10
	
	var s4 = new[10](Structure)
	s4[0] = s1
	s4[1] = *s2
	s4[2] = s3
	s4[3].member1 = 7
	
	var ptr = &s4[4].member1
	*ptr = 12
	
	assert s1.member1 == 5
	assert s2.member1 == 6
	assert s3.member1 == 10
	assert s4[0].member1 == 5
	assert s4[3].member1 == 7
	assert s4[4].member1 == 12
}
