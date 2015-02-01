
type TypeRef = struct {
	package_url: string
	type_idx: uint32
}

func write_type_ref(out: *Writer, ref: *TypeRef)
{
	spl.start_list(out)
	spl.write_string(out, ref.package_url)
	spl.write_int(out, ref.type_idx)
	spl.end_list(out)
}
