///@scr_player_check_floors_ground()
function scr_player_check_floors_ground(){
	// _spd is not logged here

	// Perform collision based on current collision mode
	switch(col_angle_data.mode_ground){
		case COL_FLOOR:
		{
			var _pos = y + col_height;	// Collision anchor
			var _tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);
			var _surface = _tile[0];
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
				y_pos = _surface - (col_height + 1);
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
			var _pos = x + col_height;	// Collision anchor
			var _tile = scr_tile_find_hor2(col_path, _pos, y+col_width, _pos, y-col_width, 1);
			var _surface = _tile[0];
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
				x_pos = _surface - (col_height + 1);
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
			var _pos = y - col_height;	// Collision anchor
			var _tile = scr_tile_find_vert2(col_path, x+col_width, _pos, x-col_width, _pos, -1);
			var _surface = _tile[0];
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
				y_pos = _surface + (col_height + 1);
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
			var _pos = x - col_height;	// Collision anchor
			var _tile = scr_tile_find_hor2(col_path, _pos, y-col_width, _pos, y+col_width, -1);
			var _surface = _tile[0];
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
				x_pos = _surface + (col_height + 1);
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
	var _dir, _spd, _pos, _tile, _surface, _diff, _dist;
	if abs(x_spd) >= abs(y_spd)
		_dir = x_spd > 0 ? COL_WALL_R : COL_WALL_L;
	else
		_dir = y_spd > 0 ? COL_FLOOR : COL_CEILING;
	
	switch(_dir){
		case COL_FLOOR:
		{
			#region Checking walls on either side
				_spd = max(abs(x_spd), 1) * sign(x_spd);

				// If moving right
				if (_spd > 0) {
					_pos = x_pos + col_push;								// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, y, 1);
					_surface = _tile[0];									// Get the actual left side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos >= _surface) or (_pos + _spd >= _surface) {
						// Snap to left side of tile
						x_pos = _surface - (col_push + 1);
						x_spd = 0;
						D_TILE.tile[2] = tile_get_index(_tile[2]);
						D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[2] = _tile[3];
						D_TILE.cell_y[2] = _tile[4];
						D_TILE.color[2] = c_red;
					}
				}

				// If moving left
				else if (_spd < 0) {
					_pos = x_pos - col_push;								// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, y, -1);
					_surface = _tile[0];									// Get the actual right side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to right side of tile
						x_pos = _surface + (col_push + 1);
						x_spd = 0;
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

				_spd = max(y_spd, 1);
				_pos = y_pos + col_height;	// Collision anchor
				_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);
				_surface = _tile[0];

				_diff = _surface - _pos;					// Get distance to the ground
				_dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

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
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					y_pos = _surface - (col_height + 1);
					in_air = false;
					jumping = false;
					y_spd = 0;
					inertia = x_spd;
					col_angle = _tile[1];
					col_angle_data = global.angle_data[col_angle];
					
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
				_spd = max(x_spd, 1);

				_pos = x_pos + col_push;								// Collision anchor
				_tile = scr_tile_find_hor(col_path, _pos, y, 1);
				_surface = _tile[0];									// Get the actual left side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					// Snap to left side of tile
					x_pos = _surface - (col_push + 1);
					x_spd = 0;
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
				_spd = max(abs(y_spd), 1) * sign(y_spd);
				
				// If moving down
				if (_spd > 0) {
					// Disable ceiling collision
					D_TILE.tile[1] = 0;
					D_TILE.flip_x[1] = false;
					D_TILE.flip_y[1] = false;
					D_TILE.cell_x[1] = 0;
					D_TILE.cell_y[1] = 0;
					D_TILE.color[1] = c_white;
					
					_pos = (y_pos + col_height);	// Collision anchor
					_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);	// Get the actual top side of the tile
					_surface = _tile[0];
					
					_diff = _surface - _pos;					// Get distance to the ground
					_dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

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
					if (_pos >= _surface) or (_pos + _spd >= _surface) {
						y_pos = _surface - (col_height + 1);
						in_air = false;
						jumping = false;
						y_spd = 0;
						inertia = x_spd;
						col_angle = _tile[1];
						col_angle_data = global.angle_data[col_angle];
						D_TILE.tile[0] = tile_get_index(_tile[2]);
						D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[0] = _tile[3];
						D_TILE.cell_y[0] = _tile[4];
						D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
					}
				}

				// If moving up
				else if (_spd < 0) {
					// Disable floor collision
					D_TILE.tile[0] = 0;
					D_TILE.flip_x[0] = false;
					D_TILE.flip_y[0] = false;
					D_TILE.cell_x[0] = 0;
					D_TILE.cell_y[0] = 0;
					D_TILE.color[0] = c_white;

					_pos = (y_pos - col_height);	// Collision anchor
					_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1);
					_surface = _tile[0];			// Get the actual bottom side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to bottom side of tile
						y_pos = _surface + (col_height + 1);
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
		
		case COL_CEILING:
		{
			#region Checking walls on either side
				_spd = max(abs(x_spd), 1) * sign(x_spd);

				// If moving right
				if (_spd > 0) {
					_pos = x_pos + col_push;								// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, y, 1);
					_surface = _tile[0];									// Get the actual left side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos >= _surface) or (_pos + _spd >= _surface) {
						// Snap to left side of tile
						x_pos = _surface - (col_push + 1);
						x_spd = 0;
						D_TILE.tile[2] = tile_get_index(_tile[2]);
						D_TILE.flip_x[2] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[2] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[2] = _tile[3];
						D_TILE.cell_y[2] = _tile[4];
						D_TILE.color[2] = c_red;
					}
				}

				// If moving left
				else if (_spd < 0) {
					_pos = x_pos - col_push;								// Collision anchor
					_tile = scr_tile_find_hor(col_path, _pos, y, -1);
					_surface = _tile[0];									// Get the actual right side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to right side of tile
						x_pos = _surface + (col_push + 1);
						x_spd = 0;
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

				_spd = min(y_spd, -1);
				_pos = (y_pos - col_height);	// Collision anchor
				_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1);
				_surface = _tile[0];			// Get the actual bottom side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to bottom side of tile
					y_pos = _surface + (col_height + 1);
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
				_spd = min(x_spd, -1);

				_pos = x_pos - col_push;								// Collision anchor
				_tile = scr_tile_find_hor(col_path, _pos, y, -1);
				_surface = _tile[0];									// Get the actual right side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to right side of tile
					x_pos = _surface + (col_push + 1);
					x_spd = 0;
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
				_spd = max(abs(y_spd), 1) * sign(y_spd);
				
				// If moving down
				if (_spd > 0) {
					// Disable ceiling collision
					D_TILE.tile[1] = 0;
					D_TILE.flip_x[1] = false;
					D_TILE.flip_y[1] = false;
					D_TILE.cell_x[1] = 0;
					D_TILE.cell_y[1] = 0;
					D_TILE.color[1] = c_white;

					_pos = (y_pos + col_height);	// Collision anchor
					_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);	// Get the actual top side of the tile
					_surface = _tile[0];
					
					_diff = _surface - _pos;					// Get distance to the ground
					_dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

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
					if (_pos >= _surface) or (_pos + _spd >= _surface) {
						y_pos = _surface - (col_height + 1);
						in_air = false;
						jumping = false;
						y_spd = 0;
						inertia = x_spd;
						col_angle = _tile[1];
						col_angle_data = global.angle_data[col_angle];
						D_TILE.tile[0] = tile_get_index(_tile[2]);
						D_TILE.flip_x[0] = tile_get_mirror(_tile[2]);
						D_TILE.flip_y[0] = tile_get_flip(_tile[2]);
						D_TILE.cell_x[0] = _tile[3];
						D_TILE.cell_y[0] = _tile[4];
						D_TILE.color[0] = _tile[5] == 0 ? c_green : c_aqua;
					}
				}

				// If moving up
				else if (_spd < 0) {
					// Disable floor collision
					D_TILE.tile[0] = 0;
					D_TILE.flip_x[0] = false;
					D_TILE.flip_y[0] = false;
					D_TILE.cell_x[0] = 0;
					D_TILE.cell_y[0] = 0;
					D_TILE.color[0] = c_white;

					_pos = (y_pos - col_height);	// Collision anchor
					_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1);
					_surface = _tile[0];			// Get the actual bottom side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to bottom side of tile
						y_pos = _surface + (col_height + 1);
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
	
	// Offset sensor on flat ground
	var _y = y + (8 * (col_angle == 0));

	switch(col_angle_data.mode_push){
		case COL_FLOOR:
		{
			var _spd = max(abs(x_spd), 1) * sign(x_spd);

			// If moving right
			if (_spd > 0){
				var _pos = x_pos + col_push;			// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, _y, 1);
				var _surface = _tile[0];				// Get the actual left side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					// Snap to left side of tile
					x_pos = _surface - (col_push + 1);
					x_spd = 0;
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

			// If moving left
			else if (_spd < 0){
				var _pos = x_pos - col_push;				// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, _y, -1);
				var _surface = _tile[0];					// Get the actual right side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to right side of tile
					x_pos = _surface + (col_push + 1);
					x_spd = 0;
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
		case COL_WALL_R:
		{
			var _spd = max(abs(y_spd), 1) * sign(y_spd);

			// If moving up the wall
			if (_spd < 0){
				var _pos = y_pos - col_push;			// Collision anchor
				var _tile = scr_tile_find_vert(col_path, x, _pos, -1);
				var _surface = _tile[0];				// Get the actual bottom side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to bottom side of tile
					y_pos = _surface + (col_push + 1);
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
			else if (_spd > 0){
				var _pos = y_pos + col_push;			// Collision anchor
				var _tile = scr_tile_find_vert(col_path, x, _pos, 1);
				var _surface = _tile[0];				// Get the actual top side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					// Snap to top side of tile
					y_pos = _surface - (col_push + 1);
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
			var _spd = max(abs(x_spd), 1) * sign(x_spd);

			// If moving left
			if (_spd < 0){
				var _pos = x_pos - col_push;				// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, y, -1);
				var _surface = _tile[0];					// Get the actual right side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to right side of tile
					x_pos = _surface + (col_push + 1);
					x_spd = 0;
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

			// If moving right
			else if (_spd > 0){
				var _pos = x_pos + col_push;			// Collision anchor
				var _tile = scr_tile_find_hor(col_path, _pos, y, 1);
				var _surface = _tile[0];				// Get the actual left side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					// Snap to left side of tile
					x_pos = _surface - (col_push + 1);
					x_spd = 0;
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
			var _spd = max(abs(y_spd), 1) * sign(y_spd);

			// If moving down the wall
			if (_spd > 0){
				var _pos = y_pos + col_push;			// Collision anchor
				var _tile = scr_tile_find_vert(col_path, x, _pos, 1);
				var _surface = _tile[0];				// Get the actual top side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					// Snap to top side of tile
					y_pos = _surface - (col_push + 1);
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
			else if (_spd < 0){
				var _pos = y_pos - col_push;			// Collision anchor
				var _tile = scr_tile_find_vert(col_path, x, _pos, -1);
				var _surface = _tile[0];				// Get the actual bottom side of the tile
				
				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to bottom side of tile
					y_pos = _surface + (col_push + 1);
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