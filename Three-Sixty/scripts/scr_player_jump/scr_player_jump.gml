///@function scr_player_jump()
function scr_player_jump(){
	if (key_jump_press){
		x_spd		-= jmp_spd * col_angle_data.sine;
		y_spd		-= jmp_spd * col_angle_data.cosine;
		in_air		= true;
		pushing		= false;
		jumping		= true;
		move_lock	= 0;
		col_height	= HEIGHT_ROLL;
		col_width	= WIDTH_ROLL;
		anim_ID		= ANI_PLAYER.ROLL;
		rolling		= true;
		y_pos		+= col_height_def - col_height;	// Reposition according to height change
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