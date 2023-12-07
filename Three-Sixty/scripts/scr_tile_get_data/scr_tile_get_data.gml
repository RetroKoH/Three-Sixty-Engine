///@function scr_tile_get_height(index, x)
function scr_tile_get_height(_index, _x){
	var _column = _x & (TILE_SIZE - 1);

	return global.tile_heights[_index & $1F][_column & (TILE_SIZE - 1)];
}

///@function scr_tile_get_width(index, y)
function scr_tile_get_width(_index, _y){
	var _row = _y & (TILE_SIZE - 1);

	return global.tile_widths[_index & $1F][_row & (TILE_SIZE - 1)];
}