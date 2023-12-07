///@function scr_check_walls()
function scr_check_walls(){
	var _spd = max(abs(x_spd), 1) * sign(x_spd);

	// If moving right
	if (_spd > 0) {
		var _pos = x_pos + col_push;								// Collision anchor
		var _surface = scr_tile_find_hor(col_path, _pos, y + 8, 1);	// Get the actual left side of the tile

		// Check if we are at/within the tile's actual surface
		if (_pos >= _surface) or (_pos + _spd >= _surface) {
			// Snap to left side of tile
			x_pos = _surface - (col_push + 1);
			x_spd = 0;
		}
	}

	// If moving left
	else if (_spd < 0) {
		var _pos = x_pos - col_push;									// Collision anchor
		var _surface = scr_tile_find_hor(col_path, _pos, y + 8, -1);	// Get the actual right side of the tile

		// Check if we are at/within the tile's actual surface
		if (_pos <= _surface) or (_pos + _spd <= _surface) {
			// Snap to right side of tile
			x_pos = _surface + (col_push + 1);
			x_spd = 0;
		}
	}
}

///@function scr_check_floors()
function scr_check_floors(){
	var _spd = max(abs(y_spd), 1) * sign(y_spd);
	var _snap = TILE_SIZE - 1;

	// If moving down
	if (_spd > 0) {
		var _shift = 0;
		var _pos = (y_pos + col_height);	// Collision anchor
		var _tile = scr_tile_find(col_path, x, _pos);
		var _index = tile_get_index(_tile);
		var _height = scr_tile_get_height(_index, x);

		// If an empty tile is found, extend
		if !_height {
			_shift = TILE_SIZE;
			_tile = scr_tile_find(col_path, x, (_pos + _shift));
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		}
	
		// If full, regress and get the previous tile.
		else if (_height == TILE_SIZE) {
			var _prev = [_tile, _index, _height];
			_shift = -TILE_SIZE;
			_tile = scr_tile_find(col_path, x, (_pos + _shift));
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		
			// Recall the full tile if no tile is found above.
			if !_height {
				_shift = 0;
				_tile = _prev[0];
				_index = _prev[1]; 
				_height = _prev[2];
			}
		}

		// Get the actual top side of the tile
		var _surface = ((_pos + _shift) & ~_snap) + (TILE_SIZE - _height);

		// Check if we are at/within the tile's actual surface
		if (_pos >= _surface) or (_pos + _spd >= _surface) {
			// Snap to top side of tile
			y_pos = _surface - (col_height + 1);
			y_spd = 0;
		}
	}

	// If moving up
	else if (_spd < 0) {
		var _shift = 0;
		var _pos = (y_pos - col_height);	// Collision anchor
		var _tile = scr_tile_find(col_path, x, _pos);
		var _index = tile_get_index(_tile);
		var _height = scr_tile_get_height(_index, x);

		// If an empty tile is found, regress, then extend
		if !_height {
			_shift = -TILE_SIZE;
			_tile = tilemap_get_at_pixel(col_path, x, (_pos + _shift));
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		}
	
		// If full, regress and get the previous tile.
		else if (_height == TILE_SIZE) {
			var _prev = [_tile, _index, _height];
			_shift = TILE_SIZE;
			_tile = tilemap_get_at_pixel(col_path, x, (_pos + _shift));
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		
			// Recall the full tile if no tile is found above.
			if !_height {
				_shift = 0;
				_tile = _prev[0];
				_index = _prev[1]; 
				_height = _prev[2];
			}
		}

		// Get the actual bottom side of the tile
		var _surface = ((_pos + _shift) & ~_snap) + _snap - (TILE_SIZE - _height);

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
	var _width = scr_tile_get_width(_index, _y);

	// If an empty tile is found, extend
	if !_width {
		_x += _shift;
		_tile = scr_tile_find(_col_path, _x, _y);
		_index = tile_get_index(_tile);
		_width = scr_tile_get_width(_index, _y);
	}

	// If full, regress and get the previous tile.
	else if (_width == TILE_SIZE) {
		var _prev = [_tile, _index];
		_x -= _shift;
		_tile = scr_tile_find(_col_path, _x, _y);
		_index = tile_get_index(_tile);
		_width = scr_tile_get_width(_index, _y);
		
		// Recall the full tile if no tile is found above.
		if !_width {
			_x += _shift;
			_tile = _prev[0];
			_index = _prev[1]; 
			_width = TILE_SIZE;
		}
	}
	
	// Find actual tile surface (if dir == 1, left side. if dir == -1, right side)
	if _dir == 1
		return (_x & ~_snap) + (TILE_SIZE - _width);

	else
		return (_x & ~_snap) + _snap - (TILE_SIZE - _width);
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