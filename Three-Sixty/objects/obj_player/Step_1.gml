/// @description Early Player Movement

// Keyboard checks
key_left	= keyboard_check(ord("A"));
key_right	= keyboard_check(ord("D"));
key_up		= keyboard_check(ord("W"));
key_down	= keyboard_check(ord("S"));
key_jump	= keyboard_check(ord("J"));

if DEBUG {
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

else {
	if (in_air) {
		scr_player_jump_height();
		scr_player_move_air();
		scr_check_walls();
		x_pos += x_spd;
		y_pos += y_spd;
		y_spd += .21875;				// Apply gravity
		scr_player_check_floors_air();	// New ground check to exit air state
	}

	else {
		if !scr_player_jump(){
			scr_player_move_ground();
			scr_check_walls();

			// Use speeds to move player
			x_pos += x_spd;
			y_pos += y_spd;

			scr_player_check_floors_ground();
		}
	}
}