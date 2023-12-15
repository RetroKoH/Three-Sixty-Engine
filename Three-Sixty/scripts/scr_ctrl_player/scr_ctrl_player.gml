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
	if scr_player_jump()	exit;
	scr_player_move_ground();
	scr_check_walls();

	// Use speeds to move player
	x_pos += x_spd;	y_pos += y_spd;

	scr_player_check_floors_ground();
}

///@function scr_ctrl_player_air()
function scr_ctrl_player_air() {
	scr_player_jump_height();
	scr_player_move_air();
	x_pos += x_spd;
	y_pos += y_spd;
	y_spd += .21875;				// Apply gravity
	scr_player_check_floors_air();	// New ground check to exit air state
}