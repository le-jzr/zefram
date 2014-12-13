
extern func _zefram_core_get_args() own *[]string

func args() own *[]string {
	_zefram_core_get_args()
}
