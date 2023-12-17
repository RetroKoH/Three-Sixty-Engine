///@function scr_ctrl_player()
function scr_ctrl_player(){
	if (DEBUG)
		scr_ctrl_player_debug();

	else {
		if (in_air)
			scr_ctrl_player_air();

		else
			scr_ctrl_player_normal();
	}
}

///@function scr_ctrl_player_debug()
function scr_ctrl_player_debug(){
	// Apply speeds
	x_spd = (key_right - key_left) * 3.0625;
	y_spd = (key_down - key_up) * 3.0625;

	// Wall Tile Collision
	scr_check_walls();
	x_pos += x_spd;

	// Floor Tile Collision
	scr_check_floors();
	y_pos += y_spd;
}

///@function scr_ctrl_player_normal()
function scr_ctrl_player_normal(){
	if scr_player_jump()	exit;		// *** Check for starting a jump.
	scr_player_slope_resist();			// Adjust inertia based on collision angle.
	scr_player_move_ground();			// Move along the ground and apply friction/deceleration.
	scr_player_check_walls();			// Check for walls along the ground
	x_pos += x_spd;	y_pos += y_spd;		// Use speeds to move player
	scr_player_check_floors_ground();	// Floor collision and angle check occurs.
	//scr_player_slope_repel();			// Push down slopes and fall from walls/ceilings/loops.
}

///@function scr_ctrl_player_air()
function scr_ctrl_player_air() {
	scr_player_jump_height();
	scr_player_move_air();
	x_pos += x_spd;
	y_pos += y_spd;
	y_spd += .21875;					// Apply gravity
	scr_player_check_floors_air();		// New ground check to exit air state or detect walls in air
}