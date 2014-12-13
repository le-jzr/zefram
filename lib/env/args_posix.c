
#include <zefram.h>

int64_t _argc;
char **_argv;

void _zefram_core_set_args(int64_t argc, void *argv)
{
	_argc = argc;
	_argv = argv;
}

zefram_array_pointer _zefram_core_get_args(void)
{
	zefram_string_t *arr = zefram_alloc(sizeof(zefram_string_t), _argc);

	for (int i = 0; i < _argc; i++) {
		arr[i] = zefram_cstring_to_string(_argv[i]);
	}
	
	return (zefram_array_pointer) {.len = _argc, .base = arr}
}
