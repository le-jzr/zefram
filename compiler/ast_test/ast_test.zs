
type BufferReader = struct {
	buffer: own *[]byte
	pos: int64
}

func (r: *BufferReader) read(b: *[]byte) (bytes: int64)
{

	var remaining = len(r.buffer) - r.pos
	
	var i = 0
	if len(b) < remaining {
		while i < len(b) {
			b[i] = r.buffer[r.pos + i]
			i++
		}
		r.pos = r.pos + len(b)
		return len(b)
	} else {
		while i < remaining {
			b[i] = r.buffer[r.pos + i]
			i++
		}
		r.pos = r.pos + remaining
		return remaining
	}
}

func main()
{
	var r: BufferReader
	r.buffer = env.read_file("tests/functions/functions.ast")
	r.pos = 0
	
	var p = new(spl.SeqParser)
	p.shift(&r, 1)
	
	var f = ast.parse_ASTFile(p, &r)
	f.print()
	env.print("\n")
	delete @f
	delete @p
}
