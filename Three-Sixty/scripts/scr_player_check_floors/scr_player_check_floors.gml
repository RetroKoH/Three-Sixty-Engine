///@scr_player_check_floors_ground()
function scr_player_check_floors_ground(){
	
	var _col_mode = col_angle_data.mode_ground;
	var _xp = floor(x_pos), _yp = floor(y_pos);
	
	// Custom collision mode method - Orbinaut Framework
	if !landing{
		var _tolerance = $20;

		var _tile;
		switch (_col_mode){
			case COL_FLOOR:
			{
				// Switch to right wall mode
				_tile = scr_tile_find_hor(col_path, x + col_height - 2, y + col_width, 1, TILE_FULLSOLID|TILE_LRBSOLID);
				if _tile[0] < 0
				{
					if _tile[1] - col_angle mod $100 < _tolerance
						_col_mode = COL_WALL_R;
				}
					
				// Switch to left wall mode
				_tile = scr_tile_find_hor(col_path, x - col_height + 2, y + col_width, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				if _tile[0] < 0
				{
					if col_angle - _tile[1] < _tolerance
						_col_mode = COL_WALL_L;
				}
			}
			break;
			case COL_WALL_R:
			{
				// Switch to floor mode
				_tile = scr_tile_find_vert(col_path, x + col_width, y + col_height - 2, 1, TILE_FULLSOLID|TILE_TOPSOLID);
				if _tile[0] < 0
				{
					if col_angle - _tile[1] mod $100 < _tolerance
						_col_mode = COL_FLOOR;
				}
					
				// Switch to ceiling mode
				_tile = scr_tile_find_vert(col_path, x + col_width, y - col_height + 2, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				if _tile[0] < 0
				{
					if _tile[1] - col_angle < _tolerance
						_col_mode = COL_CEILING;
				}
			}
			break;
			case COL_CEILING:
			{
				// Switch to right wall mode
				_tile = scr_tile_find_hor(col_path, x + col_height - 2, y - col_width, 1, TILE_FULLSOLID|TILE_LRBSOLID);
				if _tile[0] < 0
				{
					if col_angle - _tile[1] < _tolerance
						_col_mode = COL_WALL_R;
				}
					
				// Switch to left wall mode
				_tile = scr_tile_find_hor(col_path, x - col_height + 2, y - col_width, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				if _tile[0] < 0
				{
					if _tile[1] - col_angle < _tolerance
						_col_mode = COL_WALL_L;
				}
			}
			break;
			case COL_WALL_L:
			{
				// Switch to floor mode
				_tile = scr_tile_find_vert(col_path, x - col_width, y + col_height - 2, 1, TILE_FULLSOLID|TILE_TOPSOLID);
				if _tile[0] < 0
				{
					if _tile[1] - col_angle < _tolerance
						_col_mode[0] = COL_FLOOR;
				}
					
				// Switch to ceiling mode
				_tile = scr_tile_find_vert(col_path, x - col_width, y - col_height + 2, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				if _tile[0] < 0
				{
					if col_angle - _tile[1] < _tolerance
						_col_mode[0] = COL_CEILING;
				}
			}
			break;
		}
	}
	else
		landing = false;
	
	// Perform collision based on current collision mode
	switch(_col_mode){
		case COL_FLOOR:
		{
			var _pos = _yp + col_height;	// Collision anchor
			var _tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, 1, TILE_FULLSOLID|TILE_TOPSOLID);
			var _surface = _tile[0] - 1;
			var _angle = _tile[1];
			
			// Angle snapping occurs if the absolute difference between your current Ground Angle and the tile's angle is greater than 45° (32/$20)
			var _angle_diff = abs(col_angle mod $80 - _angle mod $80);		
			if _angle_diff > $20 and _angle_diff < $60{	// if _diff > 45 and _diff < 135
				_angle = round(col_angle / $40) mod 4 * $40;
				if (_angle == $100)
					_angle = 0;
			}

			var _diff = _surface - _pos;					// Get distance to the ground
			var _dist = min(4 + abs(floor(x_spd)), 14);		// From Orbinaut Framework

// If the distance value (_diff) is less than -14 or greater than _dist, the Player won't collide
			// If too far, enter air state
			if (_diff > _dist) {
				in_air = true;
				D_TILE.tile[0] = 0;
				D_TILE.flip_x[0] = false;
				D_TILE.flip_y[0] = false;
				D_TILE.cell_x[0] = 0;
				D_TILE.cell_y[0] = 0;
				D_TILE.color[0] = c_white;
			}
	
			// Otherwise, align with the ground
			else if (_diff >= -14){
				y_pos = _surface - col_height;
				col_angle = _angle;
				col_angle_data = global.angle_data[col_angle];
		
				D_TILE.tile[0] = tile_get_index(_tile[2]);
				D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
				D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
				D_TILE.cell_x[0] = _tile[3];
				D_TILE.cell_y[0] = _tile[4];
				D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
			}
		}
		break;
		case COL_WALL_R:
		{
			var _pos = _xp + col_height;	// Collision anchor
			var _tile = scr_tile_find_hor2(col_path, _pos, _yp+col_width, _pos, _yp-col_width, 1, TILE_FULLSOLID|TILE_LRBSOLID);
			var _surface = _tile[0] - 1;
			var _angle = _tile[1];
			
			// Angle snapping occurs if the absolute difference between your current Ground Angle and the tile's angle is greater than 45° (32/$20)
			var _angle_diff = abs(col_angle mod $80 - _angle mod $80);		
			if _angle_diff > $20 and _angle_diff < $60{	// if _diff > 45 and _diff < 135
				_angle = round(col_angle / $40) mod 4 * $40;
				if (_angle == $100)
					_angle = 0;
			}
			
			var _diff = _surface - _pos;					// Get distance to the ground
			var _dist = min(4 + abs(floor(y_spd)), 14);		// From Orbinaut Framework

// If the distance value (_diff) is less than -14 or greater than _dist, the Player won't collide
			// If too far, enter air state
			if (_diff > _dist) {
				in_air = true;
				D_TILE.tile[0] = 0;
				D_TILE.flip_x[0] = false;
				D_TILE.flip_y[0] = false;
				D_TILE.cell_x[0] = 0;
				D_TILE.cell_y[0] = 0;
				D_TILE.color[0] = c_white;
			}
	
			// Otherwise, align with the ground
			else if (_diff >= -14){
				x_pos = _surface - col_height;
				col_angle = _angle;
				col_angle_data = global.angle_data[col_angle];
		
				D_TILE.tile[0] = tile_get_index(_tile[2]);
				D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
				D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
				D_TILE.cell_x[0] = _tile[3];
				D_TILE.cell_y[0] = _tile[4];
				D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
			}
		}
		break;
		case COL_CEILING:
		{
			var _pos = _yp - col_height;	// Collision anchor
			var _tile = scr_tile_find_vert2(col_path, _xp+col_width, _pos, _xp-col_width, _pos, -1, TILE_FULLSOLID|TILE_LRBSOLID);
			var _surface = _tile[0] + 1;
			var _angle = _tile[1];
			
			// Angle snapping occurs if the absolute difference between your current Ground Angle and the tile's angle is greater than 45° (32/$20)
			var _angle_diff = abs(col_angle mod $80 - _angle mod $80);		
			if _angle_diff > $20 and _angle_diff < $60{	// if _diff > 45 and _diff < 135
				_angle = round(col_angle / $40) mod 4 * $40;
				if (_angle == $100)
					_angle = 0;
			}

			var _diff = _pos - _surface;					// Get distance to the ground
			var _dist = min(4 + abs(floor(x_spd)), 14);		// From Orbinaut Framework

// If the distance value (_diff) is less than -14 or greater than _dist, the Player won't collide
			// If too far, enter air state
			if (_diff > _dist) {
				in_air = true;
				D_TILE.tile[0] = 0;
				D_TILE.flip_x[0] = false;
				D_TILE.flip_y[0] = false;
				D_TILE.cell_x[0] = 0;
				D_TILE.cell_y[0] = 0;
				D_TILE.color[0] = c_white;
			}
	
			// Otherwise, align with the ground
			else if (_diff >= -14){
				y_pos = _surface + col_height;
				col_angle = _angle;
				col_angle_data = global.angle_data[col_angle];
		
				D_TILE.tile[0] = tile_get_index(_tile[2]);
				D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
				D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
				D_TILE.cell_x[0] = _tile[3];
				D_TILE.cell_y[0] = _tile[4];
				D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
			}
		}
		break;
		case COL_WALL_L:
		{
			var _pos = _xp - col_height;	// Collision anchor
			var _tile = scr_tile_find_hor2(col_path, _pos, _yp-col_width, _pos, _yp+col_width, -1, TILE_FULLSOLID|TILE_LRBSOLID);
			var _surface = _tile[0] + 1;
			var _angle = _tile[1];
			
			// Angle snapping occurs if the absolute difference between your current Ground Angle and the tile's angle is greater than 45° (32/$20)
			var _angle_diff = abs(col_angle mod $80 - _angle mod $80);		
			if _angle_diff > $20 and _angle_diff < $60{	// if _diff > 45 and _diff < 135
				_angle = round(col_angle / $40) mod 4 * $40;
				if (_angle == $100)
					_angle = 0;
			}
			
			var _diff = _pos - _surface;					// Get distance to the ground
			var _dist = min(4 + abs(floor(y_spd)), 14);		// From Orbinaut Framework

// If the distance value (_diff) is less than -14 or greater than _dist, the Player won't collide
			// If too far, enter air state
			if (_diff > _dist) {
				in_air = true;
				D_TILE.tile[0] = 0;
				D_TILE.flip_x[0] = false;
				D_TILE.flip_y[0] = false;
				D_TILE.cell_x[0] = 0;
				D_TILE.cell_y[0] = 0;
				D_TILE.color[0] = c_white;
			}
	
			// Otherwise, align with the ground
			else if (_diff >= -14){
				x_pos = _surface + col_height;
				col_angle = _angle;
				col_angle_data = global.angle_data[col_angle];
		
				D_TILE.tile[0] = tile_get_index(_tile[2]);
				D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
				D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
				D_TILE.cell_x[0] = _tile[3];
				D_TILE.cell_y[0] = _tile[4];
				D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
			}
		}
		break;
	}
}

///@scr_player_check_floors_air()
function scr_player_check_floors_air(){
	// Get quadrant of movement to handle collision
	var _dir, _pos, _tile, _surface, _diff, _dist;
	if abs(x_spd) >= abs(y_spd)
		_dir = x_spd > 0 ? COL_WALL_R : COL_WALL_L;
	else
		_dir = y_spd > 0 ? COL_FLOOR : COL_CEILING;

	var _xp = floor(x_pos), _yp = floor(y_pos);
	switch(_dir){
		case COL_FLOOR:
		{
			#region Checking walls on either side
				// If moving right
				if (x_spd > 0) {
					_pos = _xp + col_push;					// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, _yp, 1, TILE_FULLSOLID|TILE_LRBSOLID);
					_surface = _tile[0] - 1;					// Get the actual left side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos >= _surface) {
						// Snap to left side of tile
						x_pos	= _surface - col_push;
						_xp		= x_pos;
						x_spd	= 0;

						D_TILE.tile[2] = tile_get_index(_tile[2]);
						D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[2] = _tile[3];
						D_TILE.cell_y[2] = _tile[4];
						D_TILE.color[2] = c_red;
					}
				}

				// If moving left
				else if (x_spd < 0) {
					_pos = _xp - col_push;					// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, _yp, -1, TILE_FULLSOLID|TILE_LRBSOLID);
					_surface = _tile[0] + 1;					// Get the actual right side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) {
						// Snap to right side of tile
						x_pos	= _surface + col_push;
						_xp		= x_pos;
						x_spd	= 0;

						D_TILE.tile[2] = tile_get_index(_tile[2]);
						D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[2] = _tile[3];
						D_TILE.cell_y[2] = _tile[4];
						D_TILE.color[2] = c_fuchsia;
					}
				}
				
				// If not moving, don't register collision
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			#endregion

			#region Checking floor below player
				// Disable ceiling collision
				D_TILE.tile[1] = 0;
				D_TILE.flip_x[1] = false;
				D_TILE.flip_y[1] = false;
				D_TILE.cell_x[1] = 0;
				D_TILE.cell_y[1] = 0;
				D_TILE.color[1] = c_white;

				_pos = _yp + col_height;	// Collision anchor
				_tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, 1, TILE_FULLSOLID|TILE_TOPSOLID);
				_surface = _tile[0] - 1;

				_diff = _surface - _pos;					// Get distance to the ground
				_dist = min(4 + abs(floor(x_spd)), 14);		// From Orbinaut Framework

				// If too far, don't register collision
				if (_diff > _dist) {
					D_TILE.tile[0] = 0;
					D_TILE.flip_x[0] = false;
					D_TILE.flip_y[0] = false;
					D_TILE.cell_x[0] = 0;
					D_TILE.cell_y[0] = 0;
					D_TILE.color[0] = c_white;
					exit;
				}
	
				// Otherwise, latch to the ground
				if (_pos >= _surface) {
					y_pos = _surface - col_height;
					col_angle = _tile[1];
					col_angle_data = global.angle_data[col_angle];
					
					// This section recoded courtesy of Orbinaut Framework
					if (col_angle_data.mode_ground != COL_FLOOR) {
						// Steep slope (If floor is greater than 45 degrees, use full vertical velocity (capped at 15.75))
						if y_spd > 15.75
							y_spd = 15.75;
						x_spd = 0;
						inertia = col_angle < $80 ? -y_spd : y_spd;
					}
					else if col_angle > $10 and col_angle < $F0 {
						// Shallow slope (If floor is greater than 22.5 degrees, use halved vertical velocity)
						inertia = col_angle < $80 ? -y_spd / 2 : y_spd / 2;
					}
					else {
						// Flat floor (If floor is within 22.5 degrees, use horizontal velocity)
						y_spd = 0;
						inertia = x_spd;	
					}
					
					scr_player_acquire_floor();
					
					D_TILE.tile[0] = tile_get_index(_tile[2]);
					D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[0] = _tile[3];
					D_TILE.cell_y[0] = _tile[4];
					D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
				}
			#endregion
		}
		break;
		
		case COL_WALL_R:
		{
			#region Checking walls on right side
				_pos = _xp + col_push;					// Collision anchor
				_tile = scr_tile_find_hor(col_path, _pos, _yp, 1, TILE_FULLSOLID|TILE_LRBSOLID);
				_surface = _tile[0] - 1;					// Get the actual left side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) {
					// Snap to left side of tile
					x_pos	= _surface - col_push;
					_xp		= x_pos;
					x_spd	= 0;

					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_red;
				}
				
				// If not moving, don't register collision
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			#endregion

			#region Checking ceilings above and floors below				
				// If moving down
				if (y_spd > 0) {
					// Disable ceiling collision
					D_TILE.tile[1] = 0;
					D_TILE.flip_x[1] = false;
					D_TILE.flip_y[1] = false;
					D_TILE.cell_x[1] = 0;
					D_TILE.cell_y[1] = 0;
					D_TILE.color[1] = c_white;
					
					_pos = _yp + col_height;					// Collision anchor
					_tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, 1, TILE_FULLSOLID|TILE_TOPSOLID);
					_surface = _tile[0] - 1;					// Get the actual top side of the tile
					
					_diff = _surface - _pos;					// Get distance to the ground
					_dist = min(4 + abs(floor(x_spd)), 14);		// From Orbinaut Framework

					// If too far, don't register collision
					if (_diff > _dist) {
						D_TILE.tile[0] = 0;
						D_TILE.flip_x[0] = false;
						D_TILE.flip_y[0] = false;
						D_TILE.cell_x[0] = 0;
						D_TILE.cell_y[0] = 0;
						D_TILE.color[0] = c_white;
						exit;
					}

					// Otherwise, latch to the ground
					if (_pos >= _surface) {
						y_pos = _surface - col_height;
						col_angle = _tile[1];
						col_angle_data = global.angle_data[col_angle];
						
						// This section recoded courtesy of Orbinaut Framework
						// Always use horizontal velocity
						y_spd = 0;
						inertia = x_spd;
					
						scr_player_acquire_floor();
						
						D_TILE.tile[0] = tile_get_index(_tile[2]);
						D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[0] = _tile[3];
						D_TILE.cell_y[0] = _tile[4];
						D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
					}
				}

				// If moving up
				else if (y_spd < 0) {
					// Disable floor collision
					D_TILE.tile[0] = 0;
					D_TILE.flip_x[0] = false;
					D_TILE.flip_y[0] = false;
					D_TILE.cell_x[0] = 0;
					D_TILE.cell_y[0] = 0;
					D_TILE.color[0] = c_white;

					_pos = _yp - col_height;		// Collision anchor
					_tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, -1, TILE_FULLSOLID|TILE_LRBSOLID);
					_surface = _tile[0] + 1;		// Get the actual bottom side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) {
						// Snap to bottom side of tile
						y_pos = _surface + col_height;
						y_spd = 0;

						D_TILE.tile[1] = tile_get_index(_tile[2]);
						D_TILE.flip_x[1] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[1] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[1] = _tile[3];
						D_TILE.cell_y[1] = _tile[4];
						D_TILE.color[1] = _tile[5] == 0 ? c_blue : c_yellow;
					}
					
					// If not, don't register collision
					else {
						D_TILE.tile[1] = 0;
						D_TILE.flip_x[1] = false;
						D_TILE.flip_y[1] = false;
						D_TILE.cell_x[1] = 0;
						D_TILE.cell_y[1] = 0;
						D_TILE.color[1] = c_white;
					}
				}
				
				// If not moving (unlikely, not impossible), don't register any collision
				else {
					for (var _i = 0; _i < 2; _i++){
						D_TILE.tile[_i] = 0;
						D_TILE.flip_x[_i] = false;
						D_TILE.flip_y[_i] = false;
						D_TILE.cell_x[_i] = 0;
						D_TILE.cell_y[_i] = 0;
						D_TILE.color[_i] = c_white;
					}
				}
			#endregion
		}
		break;
		
		case COL_CEILING:
		{
			#region Checking walls on either side
				// If moving right
				if (x_spd > 0) {
					_pos = _xp + col_push;					// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, _yp, 1, TILE_FULLSOLID|TILE_LRBSOLID);
					_surface = _tile[0] - 1;					// Get the actual left side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos >= _surface){
						// Snap to left side of tile
						x_pos	= _surface - col_push;
						_xp		= x_pos;
						x_spd	= 0;

						D_TILE.tile[2] = tile_get_index(_tile[2]);
						D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[2] = _tile[3];
						D_TILE.cell_y[2] = _tile[4];
						D_TILE.color[2] = c_red;
					}
				}

				// If moving left
				else if (x_spd < 0) {
					_pos = _xp - col_push;					// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, _yp, -1, TILE_FULLSOLID|TILE_LRBSOLID);
					_surface = _tile[0] + 1;					// Get the actual right side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) {
						// Snap to right side of tile
						x_pos	= _surface + col_push;
						_xp		= x_pos;
						x_spd	= 0;

						D_TILE.tile[2] = tile_get_index(_tile[2]);
						D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[2] = _tile[3];
						D_TILE.cell_y[2] = _tile[4];
						D_TILE.color[2] = c_fuchsia;
					}
				}

				// If not moving, don't register collision
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			#endregion
			
			#region Checking ceilings above
				// Disable floor collision
				D_TILE.tile[0] = 0;
				D_TILE.flip_x[0] = false;
				D_TILE.flip_y[0] = false;
				D_TILE.cell_x[0] = 0;
				D_TILE.cell_y[0] = 0;
				D_TILE.color[0] = c_white;

				_pos = _yp - col_height;		// Collision anchor
				_tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				_surface = _tile[0] + 1;		// Get the actual bottom side of the tile
				var _angle = _tile[1];

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) {
					// Snap to bottom side of tile
					y_pos = _surface + col_height;
					
					//if (_angle > $40 and _angle <= $61) or (_angle > $A0 and _angle <= $BF){
					if (!(_angle > $60 and _angle < $A0) and _angle != 0){
						// Land on it if its angle steep enough
						col_angle	= _angle;
						col_angle_data = global.angle_data[col_angle];
						inertia		= _angle < $80 ? -y_spd : y_spd;

						scr_player_acquire_floor();
					}
					else
						y_spd = 0;

					D_TILE.tile[1] = tile_get_index(_tile[2]);
					D_TILE.flip_x[1] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[1] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[1] = _tile[3];
					D_TILE.cell_y[1] = _tile[4];
					D_TILE.color[1] = _tile[5] == 0 ? c_blue : c_yellow;
				}
				
				// If not moving, don't register collision
				else {
					D_TILE.tile[1] = 0;
					D_TILE.flip_x[1] = false;
					D_TILE.flip_y[1] = false;
					D_TILE.cell_x[1] = 0;
					D_TILE.cell_y[1] = 0;
					D_TILE.color[1] = c_white;
				}
			#endregion
		}
		break;
		
		case COL_WALL_L:
		{
			#region Checking walls on left side
				_pos = _xp - col_push;					// Collision anchor
				_tile = scr_tile_find_hor(col_path, _pos, _yp, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				_surface = _tile[0] + 1;					// Get the actual right side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) {
					// Snap to right side of tile
					x_pos	= _surface + col_push;
					_xp		= x_pos;
					x_spd	= 0;

					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_fuchsia;
				}
				
				// If not moving, don't register collision
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			#endregion

			#region Checking ceilings above and floors below				
				// If moving down
				if (y_spd > 0) {
					// Disable ceiling collision
					D_TILE.tile[1] = 0;
					D_TILE.flip_x[1] = false;
					D_TILE.flip_y[1] = false;
					D_TILE.cell_x[1] = 0;
					D_TILE.cell_y[1] = 0;
					D_TILE.color[1] = c_white;

					_pos = _yp + col_height;		// Collision anchor
					_tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, 1, TILE_FULLSOLID|TILE_TOPSOLID);
					_surface = _tile[0] - 1;		// Get the actual top side of the tile
					
					_diff = _surface - _pos;					// Get distance to the ground
					_dist = min(4 + abs(floor(x_spd)), 14);		// From Orbinaut Framework

					// If too far, don't register collision
					if (_diff > _dist) {
						D_TILE.tile[0] = 0;
						D_TILE.flip_x[0] = false;
						D_TILE.flip_y[0] = false;
						D_TILE.cell_x[0] = 0;
						D_TILE.cell_y[0] = 0;
						D_TILE.color[0] = c_white;
						exit;
					}

					// Otherwise, latch to the ground
					if (_pos >= _surface) {
						y_pos = _surface - col_height;
						col_angle = _tile[1];
						col_angle_data = global.angle_data[col_angle];

						// This section recoded courtesy of Orbinaut Framework
						// Always use horizontal velocity
						y_spd = 0;
						inertia = x_spd;
					
						scr_player_acquire_floor();

						D_TILE.tile[0] = tile_get_index(_tile[2]);
						D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[0] = _tile[3];
						D_TILE.cell_y[0] = _tile[4];
						D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
					}
				}

				// If moving up
				else if (y_spd < 0) {
					// Disable floor collision
					D_TILE.tile[0] = 0;
					D_TILE.flip_x[0] = false;
					D_TILE.flip_y[0] = false;
					D_TILE.cell_x[0] = 0;
					D_TILE.cell_y[0] = 0;
					D_TILE.color[0] = c_white;

					_pos = _yp - col_height;		// Collision anchor
					_tile = scr_tile_find_vert2(col_path, _xp-col_width, _pos, _xp+col_width, _pos, -1, TILE_FULLSOLID|TILE_LRBSOLID);
					_surface = _tile[0] + 1;		// Get the actual bottom side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) {
						// Snap to bottom side of tile
						y_pos = _surface + col_height;
						y_spd = 0;

						D_TILE.tile[1] = tile_get_index(_tile[2]);
						D_TILE.flip_x[1] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[1] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[1] = _tile[3];
						D_TILE.cell_y[1] = _tile[4];
						D_TILE.color[1] = _tile[5] == 0 ? c_blue : c_yellow;
					}
					
					// If not moving, don't register collision
					else {
						D_TILE.tile[1] = 0;
						D_TILE.flip_x[1] = false;
						D_TILE.flip_y[1] = false;
						D_TILE.cell_x[1] = 0;
						D_TILE.cell_y[1] = 0;
						D_TILE.color[1] = c_white;
					}
				}
				
				// If not moving (unlikely, not impossible), don't register any collision
				else {
					for (var _i = 0; _i < 2; _i++){
						D_TILE.tile[_i] = 0;
						D_TILE.flip_x[_i] = false;
						D_TILE.flip_y[_i] = false;
						D_TILE.cell_x[_i] = 0;
						D_TILE.cell_y[_i] = 0;
						D_TILE.color[_i] = c_white;
					}
				}
			#endregion
		}
		break;
	}
}

///@function scr_player_check_walls()
function scr_player_check_walls(){
	// Don't push when on non-flat walls or ceilings
	if (col_angle > $40 and col_angle < $C0) and col_angle != $80
		return;
	var _xp = floor(x_pos), _yp = floor(y_pos);

	switch(col_angle_data.mode_push){
		case COL_FLOOR:
		{
			// Offset sensor on flat ground
			var _y = _yp + (8 * (col_angle == 0));

			// If moving right
			if (x_spd > 0){
				var _pos = _xp + col_push;			// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, _y, 1, TILE_FULLSOLID|TILE_LRBSOLID);
				var _surface = _tile[0] - 1;			// Get the actual left side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface){
					// Snap to left side of tile
					x_pos = _surface - col_push;
					x_spd = 0;
					inertia = 0;
					pushing = true;
			
					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_red;
				}
		
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If moving left
			else if (x_spd < 0){
				var _pos = _xp - col_push;				// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, _y, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				var _surface = _tile[0] + 1;				// Get the actual right side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface){
					// Snap to right side of tile
					x_pos = _surface + col_push;
					x_spd = 0;
					inertia = 0;
					pushing = true;
			
					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_fuchsia;
				}
		
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If not moving, don't register collision
			else {
				D_TILE.tile[2] = 0;
				D_TILE.flip_x[2] = false;
				D_TILE.flip_y[2] = false;
				D_TILE.cell_x[2] = 0;
				D_TILE.cell_y[2] = 0;
				D_TILE.color[2] = c_white;
			}
		}
		break;
		case COL_WALL_R:
		{
			// If moving up the wall
			if (y_spd < 0){
				var _pos = _yp - col_push;				// Collision anchor
				var _tile = scr_tile_find_vert(col_path, _xp, _pos, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				var _surface = _tile[0] + 1;			// Get the actual bottom side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface){
					// Snap to bottom side of tile
					y_pos = _surface + col_push;
					y_spd = 0;
					inertia = 0;

					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_red;
				}
		
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If moving down the wall
			else if (y_spd > 0){
				var _pos = _yp + col_push;				// Collision anchor
				var _tile = scr_tile_find_vert(col_path, _xp, _pos, 1, TILE_FULLSOLID|TILE_TOPSOLID);
				var _surface = _tile[0] - 1;			// Get the actual top side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface){
					// Snap to top side of tile
					y_pos = _surface - col_push;
					y_spd = 0;
					inertia = 0;
			
					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_fuchsia;
				}
		
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If not moving, don't register collision
			else {
				D_TILE.tile[2] = 0;
				D_TILE.flip_x[2] = false;
				D_TILE.flip_y[2] = false;
				D_TILE.cell_x[2] = 0;
				D_TILE.cell_y[2] = 0;
				D_TILE.color[2] = c_white;
			}
		}
		break;
		case COL_CEILING:
		{
			// If moving left
			if (x_spd < 0){
				var _pos = _xp - col_push;				// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, _yp, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				var _surface = _tile[0] + 1;			// Get the actual right side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) {
					// Snap to right side of tile
					x_pos = _surface + col_push;
					x_spd = 0;
					inertia = 0;
			
					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_red;
				}
				
				// Otherwise, don't register collision
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If moving right
			else if (x_spd > 0){
				var _pos = _xp + col_push;			// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, _yp, 1, TILE_FULLSOLID|TILE_LRBSOLID);
				var _surface = _tile[0] - 1;		// Get the actual left side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) {
					// Snap to left side of tile
					x_pos = _surface - col_push;
					x_spd = 0;
					inertia = 0;
			
					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_fuchsia;
				}

				// Otherwise, don't register collision
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If not moving, don't register collision
			else{
				D_TILE.tile[2] = 0;
				D_TILE.flip_x[2] = false;
				D_TILE.flip_y[2] = false;
				D_TILE.cell_x[2] = 0;
				D_TILE.cell_y[2] = 0;
				D_TILE.color[2] = c_white;
			}
		}
		break;
		case COL_WALL_L:
		{
			// If moving down the wall
			if (y_spd > 0){
				var _pos = _yp + col_push;				// Collision anchor
				var _tile = scr_tile_find_vert(col_path, _xp, _pos, 1, TILE_FULLSOLID|TILE_TOPSOLID);
				var _surface = _tile[0] - 1;			// Get the actual top side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) {
					// Snap to top side of tile
					y_pos = _surface - col_push;
					y_spd = 0;
					inertia = 0;
			
					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_fuchsia;
				}
		
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If moving up the wall
			else if (y_spd < 0){
				var _pos = _yp - col_push;			// Collision anchor
				var _tile = scr_tile_find_vert(col_path, _xp, _pos, -1, TILE_FULLSOLID|TILE_LRBSOLID);
				var _surface = _tile[0] + 1;			// Get the actual bottom side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) {
					// Snap to bottom side of tile
					y_pos = _surface + col_push;
					y_spd = 0;
					inertia = 0;

					D_TILE.tile[2] = tile_get_index(_tile[2]);
					D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
					D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
					D_TILE.cell_x[2] = _tile[3];
					D_TILE.cell_y[2] = _tile[4];
					D_TILE.color[2] = c_red;
				}
		
				else {
					D_TILE.tile[2] = 0;
					D_TILE.flip_x[2] = false;
					D_TILE.flip_y[2] = false;
					D_TILE.cell_x[2] = 0;
					D_TILE.cell_y[2] = 0;
					D_TILE.color[2] = c_white;
				}
			}

			// If not moving, don't register collision
			else {
				D_TILE.tile[2] = 0;
				D_TILE.flip_x[2] = false;
				D_TILE.flip_y[2] = false;
				D_TILE.cell_x[2] = 0;
				D_TILE.cell_y[2] = 0;
				D_TILE.color[2] = c_white;
			}
		}
		break;
	}
}

///@function scr_player_acquire_floor()
function scr_player_acquire_floor(){
	var _h = col_height;			// Store current height
	col_height	= col_height_def;	// Reset collision box
	col_width	= WIDTH_MAIN;
					
	if (rolling)			// If Sonic is spinning
	{
		rolling		= false;			// Clear spin status
		anim_ID		= ANI_PLAYER.WALK;
		y_pos		-= col_height_def - _h;	// Pop y-pos out using stored height
	}

	pushing		= false;
	in_air		= false;
	jumping		= false;
	landing		= true;		// Disables floor mode check for one frame, allowing safe ceiling landing
}