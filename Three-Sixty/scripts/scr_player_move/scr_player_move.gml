///@function scr_player_move_ground()
function scr_player_move_ground(){
	var _dir = (key_right - key_left);

	if !(move_lock){
		// Pressing Left
		if (_dir == -1){
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
		else if (_dir == 1){
			if (inertia < 0) // if moving to the left
				inertia += decel; // decelerate

			else if (inertia < top_spd) // if moving to the right
			{
				inertia += accel; // accelerate
				if (inertia > top_spd)
					inertia = top_spd; // impose top speed limit
			}
		}
	}

	// Apply Friction if pressing nothing
	if (_dir == 0)
		inertia -= min(abs(inertia), fric) * sign(x_spd);
	
	// Use inertia and angle data to obtain proper speeds
	x_spd = inertia * col_angle_data.cosine;
	y_spd = inertia * -(col_angle_data.sine);
}

///@function scr_player_slope_resist()
function scr_player_slope_resist(){
	if (inertia)
		inertia -= 0.125 * col_angle_data.sine;
}

///@function scr_player_slope_repel()
function scr_player_slope_repel(){	
	if (move_lock)
		move_lock--;

	if !(move_lock){
		var _a = col_angle_data.angle;

		// Should player slip?
		if (_a >= 35.16 and _a <= 326.25 and abs(inertia) < 2.5){
            move_lock = 30;	// Lock controls (slip)
			
			// Should player fall?
			if (_a >= 68.91 and _a <= 292.5)
				in_air = true;	// Fall into air state.
			
			// If not, slide player down the slope
			else
				inertia += _a > 180 ? 0.5 : -0.5;
		}
	}
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