///@function scr_player_jump()
function scr_player_jump(){
	if (key_jump){
		x_spd -= jmp_spd * col_angle_data.sine;
		y_spd -= jmp_spd * col_angle_data.cosine;
		in_air = true;
		jumping = true;

		return true;
	}
	
	return false;
}

///@function scr_player_jump_height()
function scr_player_jump_height(){
	if (jumping) {
		if !(key_jump)
			if (y_spd < -4)
				y_spd = -4;	// Curb jump height if button not held
	}
}