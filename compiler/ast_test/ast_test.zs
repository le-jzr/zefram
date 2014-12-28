
type BufferReader = struct {
	buffer: own *[]byte
	pos: int64
}

func (r: *BufferReader) read(b: *[]byte) int64 {
	var remaining = len(buffer) - pos
	if len(b) < remaining {
		int i = 0
		while i < len(b) {
			b[i] = r.buffer[pos + i]
			i++
		}
		pos += len(b)
		return len(b)
	} else {
		int i = 0
		while i < remaining {
			b[i] = r.buffer[pos + i]
			i++
		}
		pos += remaining
		return remaining
	}
}

func main()
{
	var r BufferReader
	r.buffer = env.read_file("test.ast")
	r.pos = 0
	
	var p = spl.new_SeqParser()
	while !p.is_eof(r) {
		var g = parse_ASTGlobal(p, r)
		g.print()
		delete @g
	}
	delete @p
}
