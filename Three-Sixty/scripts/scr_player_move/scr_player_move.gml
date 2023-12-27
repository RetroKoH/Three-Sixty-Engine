///@function scr_player_move_ground()
function scr_player_move_ground(){
	var _dir = (key_right - key_left) * (move_lock == 0);

	// Pressing Left
	if (_dir == -1){
		if (inertia > 0){		// if moving to the right
			inertia -= decel;	// decelerate
			if (col_angle_data.mode_ground == COL_FLOOR) and inertia >= 4 {
				// If character is on Floor angles, and inertia is at/above 4, skid.
				if anim_ID != ANI_PLAYER.SKID {
					anim_ID = ANI_PLAYER.SKID;
					// Skid Sound
				}
			}
		}

		else{
			// If already moving left or not moving
			if (orientation == 1){	// If not facing left
				orientation = -1;	// Player is now facing left.
				pushing = false;	// Player is not pushing.
			}
			if (inertia > -top_spd){	// If moving slower than max speed to the left...
				inertia -= accel;		// accelerate
				anim_ID = ANI_PLAYER.WALK;
				if (inertia < -top_spd)
					inertia = -top_spd;	// impose top speed limit
			}
		}
	}

	// Pressing Right
	else if (_dir == 1){
		if (inertia < 0){		// if moving to the left
			inertia += decel;	// decelerate
			if (col_angle_data.mode_ground == COL_FLOOR) and inertia <= -4 {
				// If character is on Floor angles, and inertia is at/below -4, skid.
				if anim_ID != ANI_PLAYER.SKID {
					anim_ID = ANI_PLAYER.SKID;
					// Skid Sound
				}
			}
		}

		else{
			// If already moving right or not moving
			if (orientation == -1){	// If not facing right
				orientation = 1;	// Player is now facing right.
				pushing = false;	// Player is not pushing.
			}
			if (inertia < top_spd){		// If moving to the right
				inertia += accel;		// accelerate
				anim_ID = ANI_PLAYER.WALK;
				if (inertia > top_spd)
					inertia = top_spd;	// impose top speed limit
			}
		}
	}

	// If idle on flat ground
	else{
		if (col_angle_data.mode_ground == COL_FLOOR) and (inertia == 0){
			pushing = false;			// Player is not pushing.
			anim_ID = ANI_PLAYER.IDLE;	// Set idle animation.
		
			// Looking up and down
			if (key_up and !move_lock)
				anim_ID = ANI_PLAYER.LOOK_UP;

			else if (key_down and !move_lock)
				anim_ID = ANI_PLAYER.DUCK;
		}

		// Apply Friction
		inertia -= min(abs(inertia), fric) * sign(inertia);
	}
	
	// Use inertia and angle data to obtain proper speeds
	x_spd = inertia * col_angle_data.cosine;
	y_spd = inertia * -(col_angle_data.sine);
}

///@function scr_player_slope_resist()
function scr_player_slope_resist(){
	// Exit if on ceiling.
	if (col_angle_data.mode_ground == COL_CEILING)
		exit;
	
	var _slp = 0.125 * col_angle_data.sine;
	
	if (abs(_slp) > 0.05078125)
		inertia -= _slp;
}

///@function scr_player_slope_repel()
function scr_player_slope_repel(){	
	if (move_lock)
		move_lock--;

	if !(move_lock){
		// Should player slip?
		if (col_angle >= $18 and col_angle <= $E7 and abs(inertia) < 2.5){
            move_lock = 30;	// Lock controls (slip)
			
			// Should player fall?
			if (col_angle >= $30 and col_angle <= $CF)
				in_air = true;	// Fall into air state.
			
			// If not, slide player down the slope
			else
				inertia += col_angle > $80 ? 0.5 : -0.5;
		}
	}
}

///@function scr_player_move_air()
function scr_player_move_air(){
	var _dir = (key_right - key_left);
	
	if (col_angle){
		col_angle = 0;
		col_angle_data = global.angle_data[col_angle];
	}

	// Pressing Left
	if (_dir == -1){
		orientation = -1;		// Player is now facing left.
		if (x_spd > -top_spd)	// if moving under top speed
		{
			x_spd -= accel * 2;		// accelerate
			if (x_spd < -top_spd)
				x_spd = -top_spd;	// impose top speed limit
		}
	}

	// Pressing Right
	else if (_dir == 1){
		orientation = 1;		// Player is now facing right.
		if (x_spd < top_spd)	// if moving under top speed
		{
			x_spd += accel * 2;		// accelerate
			if (x_spd > top_spd)
				x_spd = top_spd;	// impose top speed limit
		}
	}

	// Air Drag
	if y_spd < 0 and y_spd > -4
		x_spd -= floor(x_spd / .125) / 256;
}