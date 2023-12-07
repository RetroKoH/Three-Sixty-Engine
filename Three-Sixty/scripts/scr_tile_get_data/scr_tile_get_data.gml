///@function scr_tile_find(collision path, x, y)
function scr_tile_find(_col_path, _x, _y){
	var _tile = tilemap_get_at_pixel(_col_path, _x, _y);
	
	if (_tile == -1)	return 0;
	else				return _tile;
}

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