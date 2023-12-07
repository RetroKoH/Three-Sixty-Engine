/// @description Early Player Movement

// Keyboard checks
key_left	= keyboard_check(vk_left);
key_right	= keyboard_check(vk_right);
key_up		= keyboard_check(vk_up);
key_down	= keyboard_check(vk_down);

// Apply speeds
x_spd = (key_right - key_left) * 3.0625;
y_spd = (key_down - key_up) * 3.0625;

// Wall Tile Collision
var _spd = max(abs(x_spd), 1) * sign(x_spd);
var _snap = TILE_SIZE - 1;
	
// If moving right
if (_spd > 0) {
	var _pos = (x_pos + col_push + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, _pos div TILE_SIZE, (y + 8) div TILE_SIZE);

	if _tile > 0 {
		var _index = tile_get_index(_tile);
		var _width = scr_tile_get_width(_index, y);

		// Get the actual left side of the tile
		var _surface = (_pos & ~_snap) + (TILE_SIZE - _width);

		// Check if we are at/within the tile's actual surface
		if (_pos >= _surface) {
			// Snap to left side of tile
			x_pos = (_pos & ~_snap) - (col_push + 1);
			x_spd = 0;
		}
	}
}

// If moving left
else if (_spd < 0) {
	var _pos = (x_pos - col_push + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, _pos div TILE_SIZE, (y + 8) div TILE_SIZE);
		
	if _tile > 0 {
		var _index = tile_get_index(_tile);
		var _width = scr_tile_get_width(_index, y);
		
		// Get the actual left side of the tile
		var _surface = (_pos & ~_snap) + _snap + (TILE_SIZE - _width);

		// Check if we are at/within the tile's actual surface
		if (_pos <= _surface) {
			// Snap to right side of tile
			x_pos = (_pos & ~_snap) + _snap + (col_push + 1);
			x_spd = 0;
		}
	}
}

x_pos += x_spd;

// Floor Tile Collision
_spd = max(abs(y_spd), 1) * sign(y_spd);
_snap = TILE_SIZE - 1;
	
// If moving down
if (_spd > 0) {
	var _pos = (y_pos + col_height + _spd);	// Collision anchor
	var _tile = tilemap_get(col_path, x div TILE_SIZE, _pos div TILE_SIZE);

	if _tile > 0 {
		var _index = tile_get_index(_tile);
		var _height = scr_tile_get_height(_index, x);

		// Get the actual top side of the tile
		var _surface = (_pos & ~_snap) + (TILE_SIZE - _height);

		// Check if we are at/within the tile's actual surface
		if (_pos >= _surface) {
			// Snap to top side of tile
			y_pos = _surface - (col_height + 1);
			y_spd = 0;
		}
	}
}

y_pos += y_spd;

// Set positions on screen
x = floor(x_pos);
y = floor(y_pos);