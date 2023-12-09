///@scr_player_check_floors_ground()
function scr_player_check_floors_ground(){
	// _spd is not logged here
	var _pos = y_pos + col_height;	// Collision anchor
	var _tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);
	var _surface = _tile[0];		// NEW

	var _diff = _surface - _pos;					// Get distance to the ground
	var _dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

	// If too far, enter air state
	if (_diff > _dist)
		in_air = true;
	
	// Otherwise, align with the ground
	else {
		y_pos = _surface - (col_height + 1);
		col_angle = _tile[1];
		col_angle_data = global.angle_data[col_angle];
	}
}

///@scr_player_check_floors_air()
function scr_player_check_floors_air(){
	var _spd = max(abs(y_spd), 1) * sign(y_spd);
	var _pos = y_pos + col_height;	// Collision anchor
	var _tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);
	var _surface = _tile[0];

	var _diff = _surface - _pos;					// Get distance to the ground
	var _dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

	// If too far, don't register collision
	if (_diff > _dist)
		exit;
	
	// Otherwise, latch to the ground
	if (_pos >= _surface) or (_pos + _spd >= _surface) {
		y_pos = _surface - (col_height + 1);
		in_air = false;
		jumping = false;
		y_spd = 0;
		inertia = x_spd;
		col_angle = _tile[1];
		col_angle_data = global.angle_data[col_angle];
	}
}