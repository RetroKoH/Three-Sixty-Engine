/// @description Early Player Movement

// Keyboard checks
key_left	= keyboard_check(vk_left);
key_right	= keyboard_check(vk_right);
key_up		= keyboard_check(vk_up);
key_down	= keyboard_check(vk_down);

// Apply speeds
x_spd = (key_right - key_left) * 3.0625;
y_spd = (key_down - key_up) * 3.0625;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

// Wall Tile Collision
var _spd = max(abs(x_spd), 1) * sign(x_spd);
var _snap = TILE_SIZE - 1;
	
// If moving right
if (_spd > 0) {
	var _pos = (x_pos + col_push + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, _pos div TILE_SIZE, (y + 8) div TILE_SIZE);
	var _index, _width, _shift = 0;
	
	// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
	if _tile == -1 {
		_index = 0;
		_width = 0;
	}
	else {
		_index = tile_get_index(_tile);
		_width = scr_tile_get_width(_index, y);
	}

	// If an empty tile is found, regress, then extend
	if !_width {
		_shift = -TILE_SIZE;
		_tile = tilemap_get(col_path, (_pos + _shift) div TILE_SIZE, (y + 8) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_width = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_width = scr_tile_get_width(_index, y);
		}

		// If empty again, extend and get the next tile.
		if !_width {
			_shift = TILE_SIZE;
			_tile = tilemap_get(col_path, (_pos + _shift) div TILE_SIZE, (y + 8) div TILE_SIZE);

			// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
			if _tile == -1 {
				_index = 0;
				_width = 0;
			}
			else {
				_index = tile_get_index(_tile);
				_width = scr_tile_get_width(_index, y);
			}
		}
	}

	// If full, regress and get the previous tile.
	else if (_width == TILE_SIZE) {
		var _prev = [_tile, _index, _width];
		_shift = -TILE_SIZE;
		_tile = tilemap_get(col_path, (_pos + _shift) div TILE_SIZE, (y + 8) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_width = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_width = scr_tile_get_width(_index, y);
		}
		
		// Recall the full tile if no tile is found above.
		if !_width {
			_shift = 0;
			_tile = _prev[0];
			_index = _prev[1]; 
			_width = _prev[2];
		}
	}

	// Get the actual left side of the tile
	var _surface = ((_pos + _shift) & ~_snap) + (TILE_SIZE - _width);

	// Check if we are at/within the tile's actual surface
	if (_pos >= _surface) {
		// Snap to left side of tile
		x_pos = _surface - (col_push + 1);
		x_spd = 0;
	}
}

// If moving left
else if (_spd < 0) {
	var _pos = (x_pos - col_push + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, _pos div TILE_SIZE, (y + 8) div TILE_SIZE);
	var _index, _width, _shift = 0;

	// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
	if _tile == -1 {
		_index = 0;
		_width = 0;
	}
	else {
		_index = tile_get_index(_tile);
		_width = scr_tile_get_width(_index, y);
	}

	// If an empty tile is found, regress, then extend
	if !_width {
		_shift = TILE_SIZE;
		_tile = tilemap_get(col_path, (_pos + _shift) div TILE_SIZE, (y + 8) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_width = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_width = scr_tile_get_width(_index, y);
		}

		// If empty again, extend and get the next tile.
		if !_width {
			_shift = -TILE_SIZE;
			_tile = tilemap_get(col_path, (_pos + _shift) div TILE_SIZE, (y + 8) div TILE_SIZE);

			// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
			if _tile == -1 {
				_index = 0;
				_width = 0;
			}
			else {
				_index = tile_get_index(_tile);
				_width = scr_tile_get_width(_index, y);
			}
		}
	}

	// If full, regress and get the previous tile.
	else if (_width == TILE_SIZE) {
		var _prev = [_tile, _index, _width];
		_shift = TILE_SIZE;
		_tile = tilemap_get(col_path, (_pos + _shift) div TILE_SIZE, (y + 8) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_width = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_width = scr_tile_get_width(_index, y);
		}
		
		// Recall the full tile if no tile is found above.
		if !_width {
			_shift = 0;
			_tile = _prev[0];
			_index = _prev[1]; 
			_width = _prev[2];
		}
	}

	// Get the actual right side of the tile
	var _surface = ((_pos + _shift) & ~_snap) + _snap - (TILE_SIZE - _width);

	// Check if we are at/within the tile's actual surface
	if (_pos <= _surface) {
		// Snap to right side of tile
		x_pos = _surface + (col_push + 1);
		x_spd = 0;
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

x_pos += x_spd;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

// Floor Tile Collision
_spd = max(abs(y_spd), 1) * sign(y_spd);
	
// If moving down
if (_spd > 0) {
	var _pos = (y_pos + col_height + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, x div TILE_SIZE, _pos div TILE_SIZE);
	var _index, _height, _shift = 0;
	
	// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
	if _tile == -1 {
		_index = 0;
		_height = 0;
	}
	else {
		_index = tile_get_index(_tile);
		_height = scr_tile_get_height(_index, x);
	}

	// If an empty tile is found, regress, then extend
	if !_height {
		_shift = -TILE_SIZE;
		_tile = tilemap_get(col_path, x div TILE_SIZE, (_pos + _shift) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_height = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		}

		// If empty again, extend and get the next tile.
		if !_height {
			_shift = TILE_SIZE;
			_tile = tilemap_get(col_path, x div TILE_SIZE, (_pos + _shift) div TILE_SIZE);

			// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
			if _tile == -1 {
				_index = 0;
				_height = 0;
			}
			else {
				_index = tile_get_index(_tile);
				_height = scr_tile_get_height(_index, x);
			}
		}
	}
	
	// If full, regress and get the previous tile.
	else if (_height == TILE_SIZE) {
		var _prev = [_tile, _index, _height];
		_shift = -TILE_SIZE;
		_tile = tilemap_get(col_path, x div TILE_SIZE, (_pos + _shift) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_height = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		}
		
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
	if (_pos >= _surface) {
		// Snap to top side of tile
		y_pos = _surface - (col_height + 1);
		y_spd = 0;
	}
}

// If moving up
else if (_spd < 0) {
	var _pos = (y_pos - col_height + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, x div TILE_SIZE, _pos div TILE_SIZE);
	var _index, _height, _shift = 0;
	
	// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
	if _tile == -1 {
		_index = 0;
		_height = 0;
	}
	else {
		_index = tile_get_index(_tile);
		_height = scr_tile_get_height(_index, x);
	}

	// If an empty tile is found, regress, then extend
	if !_height {
		_shift = TILE_SIZE;
		_tile = tilemap_get(col_path, x div TILE_SIZE, (_pos + _shift) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_height = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		}

		// If empty again, extend and get the next tile.
		if !_height {
			_shift = -TILE_SIZE;
			_tile = tilemap_get(col_path, x div TILE_SIZE, (_pos + _shift) div TILE_SIZE);

			// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
			if _tile == -1 {
				_index = 0;
				_height = 0;
			}
			else {
				_index = tile_get_index(_tile);
				_height = scr_tile_get_height(_index, x);
			}
		}
	}
	
	// If full, regress and get the previous tile.
	else if (_height == TILE_SIZE) {
		var _prev = [_tile, _index, _height];
		_shift = TILE_SIZE;
		_tile = tilemap_get(col_path, x div TILE_SIZE, (_pos + _shift) div TILE_SIZE);

		// if TILE == -1, an error occurred (likely off screen). Hard-set empty tile values
		if _tile == -1 {
			_index = 0;
			_height = 0;
		}
		else {
			_index = tile_get_index(_tile);
			_height = scr_tile_get_height(_index, x);
		}
		
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
	if (_pos <= _surface) {
		// Snap to bottom side of tile
		y_pos = _surface + (col_height + 1);
		y_spd = 0;
	}
}

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

y_pos += y_spd;

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

// Set positions on screen
x = floor(x_pos);
y = floor(y_pos);