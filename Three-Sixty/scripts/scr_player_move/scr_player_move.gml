///@function scr_player_move_ground()
function scr_player_move_ground(){
	var _dir = (key_right - key_left);

	// Pressing Left
	if _dir == -1 {
		if (inertia > 0) // if moving to the right
			inertia -= decel; // decelerate

		else if (inertia > -top_spd) // if moving to the left
		{
			inertia -= accel; // accelerate
			if (inertia < -top_spd)
				inertia = -top_spd; // impose top speed limit
		}
	}

	// Pressing Right
	else if _dir == 1 {
		if (inertia < 0) // if moving to the left
			inertia += decel; // decelerate

		else if (inertia < top_spd) // if moving to the right
		{
			inertia += accel; // accelerate
			if (inertia > top_spd)
				inertia = top_spd; // impose top speed limit
		}
	}

	// Pressing Nothing
	else
		inertia -= min(abs(inertia), fric) * sign(x_spd); // apply friction
	
	// Use inertia and angle data to obtain proper speeds
	x_spd = inertia * col_angle_data.cosine;
	y_spd = inertia * -(col_angle_data.sine);
}

///@function scr_player_move_air()
function scr_player_move_air(){
	var _dir = (key_right - key_left);

	// Pressing Left
	if _dir == -1 {
		if (x_spd > -top_spd) // if moving under top speed
		{
			x_spd -= accel * 2; // accelerate
			if (x_spd < -top_spd)
				x_spd = -top_spd; // impose top speed limit
		}
	}

	// Pressing Right
	else if _dir == 1 {
		if (x_spd < top_spd) // if moving under top speed
		{
			x_spd += accel * 2; // accelerate
			if (x_spd > top_spd)
				x_spd = top_spd; // impose top speed limit
		}
	}

	// Air Drag
	if y_spd < 0 and y_spd > -4
		x_spd -= floor(x_spd / .125) / 256;
}