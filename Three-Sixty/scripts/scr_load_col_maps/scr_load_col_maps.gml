///@function scr_load_col_maps(global table, file name)
function scr_load_col_maps(_table, _fname){
	var _file = file_bin_open(_fname, 0);
	var _size = file_bin_size(_file);
	if (_file) {
		for (var _i = 0; _i < TILE_COUNT; _i++)
			for (var _j = 0; _j < TILE_SIZE; _j++) {
				var _byte = (_i * TILE_SIZE < _size) ? file_bin_read_byte(_file) : 0;
				if (_byte >= $80)	_byte = -($100 - _byte);
				_byte = min(abs(_byte), TILE_SIZE) * sign(_byte);
				_table[_i][_j] = _byte;
			}
		file_bin_close(_file);
	}
}