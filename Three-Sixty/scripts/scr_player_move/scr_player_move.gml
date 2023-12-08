///@function scr_player_move_ground()
function scr_player_move_ground(){
	var _dir = (key_right - key_left);

	// Pressing Left
	if _dir == -1 {
		if (x_spd > 0) // if moving to the right
			x_spd -= decel; // decelerate

		else if (x_spd > -top_spd) // if moving to the left
		{
			x_spd -= accel; // accelerate
			if (x_spd < -top_spd)
				x_spd = -top_spd; // impose top speed limit
		}
	}

	// Pressing Right
	else if _dir == 1 {
		if (x_spd < 0) // if moving to the left
			x_spd += decel; // decelerate

		else if (x_spd < top_spd) // if moving to the right
		{
			x_spd += accel; // accelerate
			if (x_spd > top_spd)
				x_spd = top_spd; // impose top speed limit
		}
	}

	// Pressing Nothing
	else
		x_spd -= min(abs(x_spd), fric) * sign(x_spd); // apply friction
}

///@function scr_player_move_air()
function scr_player_move_air(){
	var _dir = (_right - _left);

	// Pressing Left
	if _dir == -1 {
		if (x_spd > -top_spd) // if moving under top speed
		{
			x_spd -= accel_air; // accelerate
			if (x_spd < -top_spd)
				x_spd = -top_spd; // impose top speed limit
		}
	}

	// Pressing Right
	else if _dir == 1 {
		if (x_spd < top_spd) // if moving under top speed
		{
			x_spd += accel_air; // accelerate
			if (x_spd > top_spd)
				x_spd = top_spd; // impose top speed limit
		}
	}

	// Air Drag
	if y_spd < 0 and y_spd > -4
		x_spd -= floor(x_spd / .125) / 256;
}