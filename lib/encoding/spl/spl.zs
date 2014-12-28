
type Reader = interface {
	//[[may_fail]]
	//[[ensures (result <= len(buffer))]]
	read(buffer: *[]byte) (result: int64)
}

type SeqParser = struct {
	_line:    int
	_column:  int
	_end:     bool
	_current: [1]byte
}

//[[may_fail]]
func (p: *SeqParser) shift(r: *Reader, count: int)
{
	var i = 0
	
	while !p._end && i < count {
		
		if p._current[0] == '\n' {
			p._line++
			p._column = 0
		}
		
		var n = r.read(&p._current)
		
		if n < 1 {
			p._current[0] = 0
			p._end = true
		} else {
			p._column++
		}
		
		i++
	}
}



func (p: *SeqParser) is_eof(r: *Reader) (result: bool)
{
	return p._end
}

func (p: *SeqParser) current(r: *Reader) (result: byte)
{
	if p._end {
		return 0
	}
	return p._current[0]
}

func (p: *SeqParser) skip_space(r: *Reader)
{
	while p.current() == ' ' || p.current() == '\t' || p.current() == '\r' || p.current() == '\n' {
		p.shift(1)
	}
}


func (p: *SeqParser) line() (result: int)
{
	return p._line
}

func (p: *SeqParser) column() (result: int)
{
	return p._column
}

func (p: *SeqParser) is_list() (result: bool)
{
	return p.current() == '('
}


func (p: *SeqParser) is_string() (result: bool)
{
	return p.current() == '"'
}

func (p: *SeqParser) is_end() (result: bool)
{
	return p.is_eof() || p.current() == ')'
}

func (p: *SeqParser) down()
{
	p.shift(1)
	p.skip_space()
}

func (p: *SeqParser) up()
{
	while !p.is_end() {
		p.skip()
	}

	p.shift(1)
	p.skip_space()
}

func (p: *SeqParser) skip()
{
	if p.is_list() {
		p.down()
		p.up()
	} else if p.is_string() {
		p.skip_string()
	} else if p.is_end() {
		// Nothing.
	} else {
		fail BAD_INPUT, "Bad format in SPL file."
	}
}

func (p: *SeqParser) skip_string()
{
	p.shift(1)

	while true {
		if p.is_eof() {
			fail BAD_INPUT, "End of file within a string."
		}

		var c = p.current()
		p.shift(1)

		switch c
		case '"' {
			p.skipSpace()
			return
		}
		case '\\' {
			switch p.current()
			case '"', '\\', 'n', 'r' {
				p.shift(1)
			}
			case 'x' {
				// TODO: validate escape sequences.
				p.shift(3)
			}
			case 'u' {
				p.shift(5)
			}
			case 'U' {
				p.shift(9)
			};;
		};;
	}
}

func unhex(h: *[]byte) (result: int)
	ensures bits(result) <= len(h)*4
{
	var i = 0
	while i < len(h) {
		var d = h[i]
	
		if d >= '0' && d <= '9' {
			result = result * 16 + d - '0'
		} else if d >= 'a' && d <= 'f' {
			result = result*16 + 10 + d - 'a'
		} else if d >= 'A' && d <= 'F' {
			result = result*16 + 10 + d - 'A'
		} else {
			fail BAD_INPUT, "Not a hex digit."
		}
		i++
	}
	
	return result
}

func (p: *SeqParser) string() (ret: string)
{
	if p.current() != '"' {
		fail BAD_INPUT, "Not a string"
	}
	p.shift(1)

	var buf = new(Buffer)

	while true {
		if p.is_eof() {
			fail BAD_INPUT, "End of file within a string."
		}

		var c = p.current()
		p.shift(1)

		switch c
		case '"' {
			p.skip_space()
			return buf.string()
		}
		case '\\' {
			switch p.current()
			case '"', '\\' {
				buf.append(p.current())
				p.shift(1)
			}
			case 'n' {
				buf.append('\n')
				p.shift(1)
			}
			case 'r' {
				buf.append('\r')
				p.shift(1)
			}
			case 'x' {
				var h: [2]byte
				p.shift(1)
				h[0] = p.current()
				p.shift(1)
				h[1] = p.current()
				p.shift(1)
				buf.append(unhex(&h))
			}
			case 'u' {
				// TODO
				fail NOT_IMPLEMENTED
			}
			case 'U' {
				fail NOT_IMPLEMENTED
			};;
		}
		default {
			buf.append(c)
		};;
	}
}
