
func get_hex(c: byte) (ret: range(0..15))
	may_fail INVALID_INPUT
{
	if c >= '0' && c <= '9' {
		return c - '0'
	}
	
	if c >= 'a' && c <= 'f' {
		return 10 + c - 'a'
	}

	if c <= 'A' && c <= 'F' {
		return 10 + c - 'A'
	}
	
	fail INVALID_INPUT
}

func is_space(c: byte) (ret: bool)
{
	ret = (c == ' ' || c == '\t' || c == '\n' || c == '\r')
}

func spl_is_empty(data: *[]byte, at: int) (ret: bool)
	may_fail INVALID_INPUT
{
	var idx = at
	
	while idx < len(data) && is_space(data[idx]) {
		idx++
	}
	
	if idx == len(data) {
		fail INVALID_INPUT, "End of file 1."
	}
	
	if data[idx] != '(' {
		return false
	}
	
	idx++
	
	while idx < len(data) && is_space(data[idx]) {
		idx++
	}
	
	if idx == len(data) {
		fail INVALID_INPUT, "End of file 2."
	}
	
	return data[idx] == ')'
}

func spl_down(data: *[]byte, at: int) (ret: int)
	may_fail INVALID_INPUT
{
	var idx = at

	while is_space(data[idx]) {
		idx++
	}
	
	if data[idx] != '(' {
		fail INVALID_INPUT
	}
	
	idx++
	
	while is_space(data[idx]) {
		idx++
	}
	
	return idx
}

func spl_length(data: *[]byte, at: int) (ret: int)
	may_fail INVALID_INPUT
{
	var idx = at 
	var level = 0
	var children = 0
	
	while idx < len(data) && is_space(data[idx]) {
		idx++
	}
	
	while idx < len(data) {
		if data[idx] == '(' {
			if level == 1 {
				children++
			}
		
			level++
			idx++
		} else if data[idx] == ')' {
			level--
			idx++
			if level <= 0 {
				return children
			}
		} else if data[idx] == '\"' {
			idx = spl_skip_string(data, idx)
		} else {
			idx++
		}
	}
	
	fail INVALID_INPUT
}

func spl_count(data: *[]byte) (ret: int)
	may_fail INVALID_INPUT
{
	var idx = 0
	var level = 0
	var children = 0
	
	//env.print(len(data), "\n")
	
	while idx < len(data) {
		//if idx % 1000 == 0 {
		//	env.print(idx, "\n")
		//}
		
		if data[idx] == '(' {
			if level == 0 {
				children++
			}
		
			level++
			idx++
		} else if data[idx] == ')' {
			level--
			idx++
			if level < 0 {
				fail INVALID_INPUT
			}
		} else if data[idx] == '\"' {
			idx = spl_skip_string(data, idx)
		} else {
			idx++
		}
	}
	
	if level != 0 {
		fail INVALID_INPUT
	}
	return children
}


func spl_is_pexp(data: *[]byte, at: int) (ret: bool)
	may_fail INVALID_INPUT
{
	var idx = at
	
	while idx < len(data) && is_space(data[idx]) {
		idx++
	}
	
	return (data[idx] == '(')
}

func spl_unhex(data: *[]byte, at: int) (ret: byte)
	may_fail INVALID_INPUT
{
	if data[at] != '\\' {
		fail INVALID_INPUT
	}
	
	if data[at+1] != 'x' {
		fail INVALID_INPUT
	}
	
	var hi = get_hex(data[at+2])
	var lo = get_hex(data[at+3])
	return hi << 4 | lo
}

func spl_get_string(data: *[]byte, at: int) (ret: string)
	may_fail INVALID_INPUT
{
	var buf = new(Buffer)
	
	var idx = at
	
	while idx < len(data) && is_space(data[idx]) {
		idx++
	}
	
	if data[idx] != '\"' {
		fail INVALID_INPUT, "not called at the beginning of a string"
	}
	
	idx++
	while idx < len(data) && data[idx] != '\"' {
		if data[idx] == '\\' {
			buf.append(spl_unhex(data, idx))
			idx = idx + 4
		} else {
			buf.append(data[idx])
			idx++
		}
	}
	
	if idx == len(data) {
		fail INVALID_INPUT, "string continues until EOF"
	}
	
	idx++
	return buf.string()
}

func spl_get_nullstring(data: *[]byte, at: int) (ret: ?string)
	may_fail INVALID_INPUT
{
	var idx = at
	
	while idx < len(data) && is_space(data[idx]) {
		idx++
	}

	if spl_is_pexp(data, at) {
		return null
	}
	
	ret = new(string)
	*ret = spl_get_string(data, idx)
	return ret
}

func spl_skip_string(data: *[]byte, at: int) (ret: int)
	may_fail INVALID_INPUT
{
	var oldidx = at
	var idx = at
	idx++
	while idx < len(data) && data[idx] != '\"' {
		if data[idx] == '\\' {
			idx = idx + 4
		} else {
			idx++
		}
	}
	if idx == len(data) {
		fail INVALID_INPUT
	}
	idx++
	
	if oldidx == idx {
		fail BUG
	}
	
	return idx
}

func spl_next(data: *[]byte, at: int) (ret: int)
	may_fail INVALID_INPUT
{
	var idx = at 
	var level = 0

	while idx < len(data) && is_space(data[idx]) {
		idx++
	}
	
	if idx == len(data) {
		fail INVALID_INPUT
	}
	
	if data[idx] == '\"' {
		idx = spl_skip_string(data, idx)
		
		while idx < len(data) && is_space(data[idx]) {
			idx++
		}
		
		if idx == len(data) {
			fail INVALID_INPUT
		}
		
		if data[idx] == ')' {
			return -1
		}
		
		return idx
	}
	
	while idx < len(data) {
		if data[idx] == '(' {
			level++
			idx++
		} else if data[idx] == ')' {
			level--
			idx++
			if level < 0 {
				return -1
			}
			if level == 0 {
				while idx < len(data) && is_space(data[idx]) {
					idx++
				}
				
				if idx == len(data) {
					fail INVALID_INPUT
				}
				
				if data[idx] == ')' {
					return -1
				}
			
				return idx
			}
		} else if data[idx] == '\"' {
			idx = spl_skip_string(data, idx)
		} else {
			idx++
		}
	}
	
	fail INVALID_INPUT
}
