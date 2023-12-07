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

	if tilemap_get(col_path, _pos div TILE_SIZE, (y + 8) div TILE_SIZE) > 0 {
		// Snap to left side of tile
		x_pos = (_pos & ~_snap) - (col_push + 1);
		x_spd = 0;
	}
}

// If moving left
else if (_spd < 0) {
	var _pos = (x_pos - col_push + _spd);	// Collision anchor
		
	if tilemap_get(col_path, _pos div TILE_SIZE, (y + 8) div TILE_SIZE) > 0 {
		// Snap to right side of tile
		x_pos = (_pos & ~_snap) + _snap + (col_push + 1);
		x_spd = 0;
	}
}

x_pos += x_spd;

// NEW FUNCTION: Check for floors/ceilings

y_pos += y_spd;

// Set positions on screen
x = floor(x_pos);
y = floor(y_pos);