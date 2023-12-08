///@function scr_check_walls()
function scr_check_walls(){
	var _spd = max(abs(x_spd), 1) * sign(x_spd);

	// If moving right
	if (_spd > 0) {
		var _pos = x_pos + col_push;									// Collision anchor
		var _surface = scr_tile_find_hor(col_path, _pos, y + 8, 1)[0];	// Get the actual left side of the tile

		// Check if we are at/within the tile's actual surface
		if (_pos >= _surface) or (_pos + _spd >= _surface) {
			// Snap to left side of tile
			x_pos = _surface - (col_push + 1);
			x_spd = 0;
			inertia = 0;
		}
	}

	// If moving left
	else if (_spd < 0) {
		var _pos = x_pos - col_push;									// Collision anchor
		var _surface = scr_tile_find_hor(col_path, _pos, y + 8, -1)[0];	// Get the actual right side of the tile

		// Check if we are at/within the tile's actual surface
		if (_pos <= _surface) or (_pos + _spd <= _surface) {
			// Snap to right side of tile
			x_pos = _surface + (col_push + 1);
			x_spd = 0;
			inertia = 0;
		}
	}
}

///@function scr_check_floors()
function scr_check_floors(){
	var _spd = max(abs(y_spd), 1) * sign(y_spd);

	// If moving down
	if (_spd > 0) {
		var _pos = (y_pos + col_height);	// Collision anchor
		var _surface = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1)[0];	// Get the actual top side of the tile

		// Check if we are at/within the tile's actual surface
		if (_pos >= _surface) or (_pos + _spd >= _surface) {
			// Snap to top side of tile
			y_pos = _surface - (col_height + 1);
			y_spd = 0;
		}
	}

	// If moving up
	else if (_spd < 0) {
		var _pos = (y_pos - col_height);	// Collision anchor
		var _surface = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1)[0];	// Get the actual bottom side of the tile

		// Check if we are at/within the tile's actual surface
		if (_pos <= _surface) or (_pos + _spd <= _surface) {
			// Snap to bottom side of tile
			y_pos = _surface + (col_height + 1);
			y_spd = 0;
		}
	}
}

///@function scr_tile_find(collision path, x, y)
function scr_tile_find(_col_path, _x, _y){
	var _tile = tilemap_get_at_pixel(_col_path, _x, _y);
	
	if (_tile == -1)	return 0;
	else				return _tile;
}

///@function scr_tile_find_hor(collision path, x, y, direction)
function scr_tile_find_hor(_col_path, _x, _y, _dir){
	var _snap = TILE_SIZE - 1;
	var _shift = TILE_SIZE * _dir;
	var _tile = scr_tile_find(_col_path, _x, _y);
	var _index = tile_get_index(_tile);
	var _width = scr_tile_get_width(_tile, _index, _y);

	// If an empty tile is found, extend
	if !_width {
		_x += _shift;
		_tile = scr_tile_find(_col_path, _x, _y);
		_index = tile_get_index(_tile);
		_width = scr_tile_get_width(_tile, _index, _y);
	}

	// If full, regress and get the previous tile.
	else if (_width == TILE_SIZE) {
		var _prev = [_tile, _index];
		_x -= _shift;
		_tile = scr_tile_find(_col_path, _x, _y);
		_index = tile_get_index(_tile);
		_width = scr_tile_get_width(_tile, _index, _y);
		
		// Recall the full tile if no tile is found above.
		if !_width {
			_x += _shift;
			_tile = _prev[0];
			_index = _prev[1]; 
			_width = TILE_SIZE;
		}
	}

	// Find actual tile surface (if dir == 1, left side. if dir == -1, right side)
	var _surface;

	if _dir == 1 {
		if tile_get_mirror(_tile) and _width
			_width = TILE_SIZE;					// Handle both sides of the tile correctly.

		// Get tile surface
		_surface = (_x & ~_snap) + (TILE_SIZE - _width);
	}

	else {
		if !tile_get_mirror(_tile) and _width
			_width = TILE_SIZE;					// Handle both sides of the tile correctly.

		// Get tile surface
		_surface = (_x & ~_snap) + _snap - (TILE_SIZE - _width);
	}

	// Get angle and return tile
	var _angle = scr_tile_get_angle(_tile, _index);
	return [_surface, _angle];
}

///@function scr_tile_find_vert(collision path, x, y, direction)
function scr_tile_find_vert(_col_path, _x, _y, _dir){
	var _snap = TILE_SIZE - 1;
	var _shift = TILE_SIZE * _dir;
	var _tile = scr_tile_find(_col_path, _x, _y);
	var _index = tile_get_index(_tile);
	var _height = scr_tile_get_height(_tile, _index, _x);

	// If an empty tile is found, extend
	if !_height {
		_y += _shift;
		_tile = scr_tile_find(_col_path, _x, _y);
		_index = tile_get_index(_tile);
		_height = scr_tile_get_height(_tile, _index, _x);
	}
	
	// If full, regress and get the previous tile.
	else if (_height == TILE_SIZE) {
		var _prev = [_tile, _index];
		_y -= _shift;
		_tile = scr_tile_find(_col_path, _x, _y);
		_index = tile_get_index(_tile);
		_height = scr_tile_get_height(_tile, _index, _x);
		
		// Recall the full tile if no tile is found above.
		if !_height {
			_y += _shift;
			_tile = _prev[0];
			_index = _prev[1]; 
			_height = TILE_SIZE;
		}
	}
	
	// Find actual tile surface (if dir == 1, top side. if dir == -1, bottom side)
	var _surface;

	if _dir == 1 {
		if tile_get_flip(_tile) and _height
			_height = TILE_SIZE;				// Handle both sides of the tile correctly.

		_surface = (_y & ~_snap) + (TILE_SIZE - _height);
	}

	else {
		if !tile_get_flip(_tile) and _height
			_height = TILE_SIZE;				// Handle both sides of the tile correctly.

		_surface = (_y & ~_snap) + _snap - (TILE_SIZE - _height);
	}

	// Get angle and return tile
	var _angle = scr_tile_get_angle(_tile, _index);
	return [_surface, _angle];
}

///@function scr_tile_find_vert2(collision path, x1, y1, x2, y2, direction)
function scr_tile_find_vert2(_col_path, _x1, _y1, _x2, _y2, _dir){
	var _surface, _angle;
	var _tile1 = scr_tile_find_vert(_col_path, _x1, _y1, _dir);
	var _tile2 = scr_tile_find_vert(_col_path, _x2, _y2, _dir);

	// Use closest tile (Multiply by _dir to get the correct closest distance, when considering _dir == -1)
	if ((_tile1[0] - _y1) * _dir <= (_tile2[0] - _y2) * _dir) {
		_surface = _tile1[0];
		_angle = _tile1[1];
	}
	else {
		_surface = _tile2[0];
		_angle = _tile2[1];
	}

	return [_surface, _angle];
}

///@function scr_tile_get_height(tile data, index, x)
function scr_tile_get_height(_tile, _index, _x){
	var _column = _x & (TILE_SIZE - 1);

	if tile_get_mirror(_tile)
		_column = (~_x) & (TILE_SIZE - 1);

	return global.tile_heights[_index & $3F][_column];
}

///@function scr_tile_get_width(tile data, index, y)
function scr_tile_get_width(_tile, _index, _y){
	var _row = _y & (TILE_SIZE - 1);

	if tile_get_flip(_tile)
		_row = (~_y) & (TILE_SIZE - 1);

	return global.tile_widths[_index & $3F][_row];
}

///@function scr_tile_get_angle(tile data, index)
function scr_tile_get_angle(_tile, _index){
	return global.tile_angles[_index & $3F];
}