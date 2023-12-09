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
					_pos = x_pos + col_push;									// Collision anchor
					_surface = scr_tile_find_hor(col_path, _pos, y + 8, 1)[0];	// Get the actual left side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos >= _surface) or (_pos + _spd >= _surface) {
						// Snap to left side of tile
						x_pos = _surface - (col_push + 1);
						x_spd = 0;
					}
				}

				// If moving left
				else if (_spd < 0) {
					_pos = x_pos - col_push;									// Collision anchor
					_surface = scr_tile_find_hor(col_path, _pos, y + 8, -1)[0];	// Get the actual right side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to right side of tile
						x_pos = _surface + (col_push + 1);
						x_spd = 0;
					}
				}
			#endregion

			#region Checking floor below player
				_spd = max(y_spd, 1);
				_pos = y_pos + col_height;	// Collision anchor
				_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);
				_surface = _tile[0];

				_diff = _surface - _pos;					// Get distance to the ground
				_dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

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
			#endregion
		}
		break;
		
		case COL_WALL_R:
		{
			#region Checking walls on right side
				_spd = max(x_spd, 1);

				_pos = x_pos + col_push;									// Collision anchor
				_surface = scr_tile_find_hor(col_path, _pos, y + 8, 1)[0];	// Get the actual left side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos >= _surface) or (_pos + _spd >= _surface) {
					// Snap to left side of tile
					x_pos = _surface - (col_push + 1);
					x_spd = 0;
				}
			#endregion

			#region Checking ceilings above and floors below
				_spd = max(abs(y_spd), 1) * sign(y_spd);
				
				// If moving down
				if (_spd > 0) {
					_pos = (y_pos + col_height);	// Collision anchor
					_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);	// Get the actual top side of the tile
					_surface = _tile[0];
					
					_diff = _surface - _pos;					// Get distance to the ground
					_dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

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

				// If moving up
				else if (_spd < 0) {
					_pos = (y_pos - col_height);	// Collision anchor
					_surface = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1)[0];	// Get the actual bottom side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to bottom side of tile
						y_pos = _surface + (col_height + 1);
						y_spd = 0;
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
					_pos = x_pos + col_push;									// Collision anchor
					_surface = scr_tile_find_hor(col_path, _pos, y + 8, 1)[0];	// Get the actual left side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos >= _surface) or (_pos + _spd >= _surface) {
						// Snap to left side of tile
						x_pos = _surface - (col_push + 1);
						x_spd = 0;
					}
				}

				// If moving left
				else if (_spd < 0) {
					_pos = x_pos - col_push;									// Collision anchor
					_surface = scr_tile_find_hor(col_path, _pos, y + 8, -1)[0];	// Get the actual right side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to right side of tile
						x_pos = _surface + (col_push + 1);
						x_spd = 0;
					}
				}
			#endregion
			
			#region Checking ceilings above
				_spd = min(y_spd, -1);
				_pos = (y_pos - col_height);	// Collision anchor
				_surface = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1)[0];	// Get the actual bottom side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to bottom side of tile
					y_pos = _surface + (col_height + 1);
					y_spd = 0;
				}
			#endregion
		}
		break;
		
		case COL_WALL_L:
		{
			#region Checking walls on left side
				_spd = min(x_spd, -1);

				_pos = x_pos - col_push;									// Collision anchor
				_surface = scr_tile_find_hor(col_path, _pos, y + 8, -1)[0];	// Get the actual left side of the tile

				// Check if we are at/within the tile's actual surface
				if (_pos <= _surface) or (_pos + _spd <= _surface) {
					// Snap to right side of tile
					x_pos = _surface + (col_push + 1);
					x_spd = 0;
				}
			#endregion

			#region Checking ceilings above and floors below
				_spd = max(abs(y_spd), 1) * sign(y_spd);
				
				// If moving down
				if (_spd > 0) {
					_pos = (y_pos + col_height);	// Collision anchor
					_tile = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, 1);	// Get the actual top side of the tile
					_surface = _tile[0];
					
					_diff = _surface - _pos;					// Get distance to the ground
					_dist = min(4 + abs(floor(x_pos)), 14);		// From Orbinaut Framework

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

				// If moving up
				else if (_spd < 0) {
					_pos = (y_pos - col_height);	// Collision anchor
					_surface = scr_tile_find_vert2(col_path, x-col_width, _pos, x+col_width, _pos, -1)[0];	// Get the actual bottom side of the tile

					// Check if we are at/within the tile's actual surface
					if (_pos <= _surface) or (_pos + _spd <= _surface) {
						// Snap to bottom side of tile
						y_pos = _surface + (col_height + 1);
						y_spd = 0;
					}
				}
			#endregion
		}
		break;
	}
}