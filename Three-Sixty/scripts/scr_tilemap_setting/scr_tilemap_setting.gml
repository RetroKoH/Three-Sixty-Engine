///@function tilemap_set_mirrored(tilemap_element_id, tiledata, cell_x, cell_y)
function tilemap_set_mirrored(_map, _n, _x, _y){
	tilemap_set(_map, _n, _x, _y);			// Sets tile
	var _data = tilemap_get(_map, _x, _y);	// {_data} = tiledata
	var _is = !tile_get_mirror(_data);		// {_is} = tile's mirror status
	_data = tile_set_mirror(_data, _is);	// {_data} = mirrored tile
	tilemap_set(_map, _data, _x, _y);		// Sets updated tile
}

///@function tilemap_set_flipped(tilemap_element_id, tiledata, cell_x, cell_y)
function tilemap_set_flipped(_map, _n, _x, _y){
	tilemap_set(_map, _n, _x, _y);			// Sets tile
	var _data = tilemap_get(_map,_x,_y);	// {_data} = tiledata
	var _is = !tile_get_flip(_data);		// {_is} = tile's flip status
	_data = tile_set_flip(_data, _is);		// {_data} = flipped tile
	tilemap_set(_map, _data, _x, _y);		// Sets updated tile
}

///@function tilemap_set_xy_flipped(tilemap_element_id, tiledata, cell_x, cell_y)
function tilemap_set_xy_flipped(_map, _n, _x, _y){
	tilemap_set(_map, _n, _x, _y);			// Sets tile
	var _data = tilemap_get(_map, _x, _y);	// {_data} = tiledata
	var _is = !tile_get_mirror(_data);		// {_is} = tile's mirror status
	_data = tile_set_mirror(_data, _is);	// {_data} = mirrored tile
	_is = !tile_get_flip(_data);			// {_is} = tile's flip status
	_data = tile_set_flip(_data, _is);		// {_data} = flipped tile
	tilemap_set(_map, _data, _x, _y);		// Sets updated tile
}