/// @description Early Player Movement

// Keyboard checks
key_left	= keyboard_check(vk_left);
key_right	= keyboard_check(vk_right);
key_up		= keyboard_check(vk_up);
key_down	= keyboard_check(vk_down);

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

	// Use speed to move player
	x_pos += x_spd;
}