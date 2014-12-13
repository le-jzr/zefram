
type Buffer = struct {
	buf: own ?[]byte
	cap: int64
	len: int64
}

func (b: *Buffer) append(c: byte)
{
	if b.len == b.cap {
		if b.cap == 0 {
			b.cap = 8
		} else {
			b.cap = b.cap * 2
		}
		
		b.buf = resize(@b.buf, b.cap)
	}
	
	b.buf[b.len] = c
	b.len++
}

func (b: *Buffer) string() (ret: string)
{
	b.append(0)
	ret = string(@b.buf)
	b.cap = 0
	b.len = 0
	return ret
}
