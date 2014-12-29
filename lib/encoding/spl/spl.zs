
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
	while p.current(r) == ' ' || p.current(r) == '\t' || p.current(r) == '\r' || p.current(r) == '\n' {
		p.shift(r, 1)
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

func (p: *SeqParser) is_list(r: *Reader) (result: bool)
{
	return p.current(r) == '('
}


func (p: *SeqParser) is_string(r: *Reader) (result: bool)
{
	return p.current(r) == '"'
}

func (p: *SeqParser) is_end(r: *Reader) (result: bool)
{
	return p.is_eof(r) || p.current(r) == ')'
}

func (p: *SeqParser) down(r: *Reader)
{
	p.shift(r, 1)
	p.skip_space(r)
}

func (p: *SeqParser) up(r: *Reader)
{
	while !p.is_end(r) {
		p.skip(r)
	}

	p.shift(r, 1)
	p.skip_space(r)
}

func (p: *SeqParser) skip(r: *Reader)
{
	if p.is_list(r) {
		p.down(r)
		p.up(r)
	} else if p.is_string(r) {
		p.skip_string(r)
	} else if p.is_end(r) {
		// Nothing.
	} else {
		fail BAD_INPUT, "Bad format in SPL file."
	}
}

func (p: *SeqParser) skip_string(r: *Reader)
{
	p.shift(r, 1)

	while true {
		if p.is_eof(r) {
			fail BAD_INPUT, "End of file within a string."
		}

		var c = p.current(r)
		p.shift(r, 1)

		switch c
		case '"' {
			p.skipSpace(r)
			return
		}
		case '\\' {
			switch p.current(r)
			case '"', '\\', 'n', 'r' {
				p.shift(r, 1)
			}
			case 'x' {
				// TODO: validate escape sequences.
				p.shift(r, 3)
			}
			case 'u' {
				p.shift(r, 5)
			}
			case 'U' {
				p.shift(r, 9)
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

func (p: *SeqParser) string(r: *Reader) (ret: string)
{
	if p.current(r) != '"' {
		fail BAD_INPUT, "Not a string"
	}
	p.shift(r, 1)

	var buf = new(Buffer)

	while true {
		if p.is_eof(r) {
			fail BAD_INPUT, "End of file within a string."
		}

		var c = p.current(r)
		p.shift(r, 1)

		switch c
		case '"' {
			p.skip_space(r)
			return buf.string()
		}
		case '\\' {
			switch p.current(r)
			case '"', '\\' {
				buf.append(p.current(r))
				p.shift(r, 1)
			}
			case 'n' {
				buf.append('\n')
				p.shift(r, 1)
			}
			case 'r' {
				buf.append('\r')
				p.shift(r, 1)
			}
			case 'x' {
				var h: [2]byte
				p.shift(r, 1)
				h[0] = p.current(r)
				p.shift(r, 1)
				h[1] = p.current(r)
				p.shift(r, 1)
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
