/// @description Insert description here
// You can write your code in this editor

// Toggle forced rolling if player passed through the object
if !point_in_rectangle(	floor(PLAYER.x_pos), floor(PLAYER.y_pos),
						floor(x + trigger_left), floor(y + trigger_top),
						floor(x + trigger_right - 1), floor(y + trigger_bottom - 1))
{
	if (state)
	{
		if !(PLAYER.forced_roll){
			PLAYER.forced_roll = true;

			if (abs(PLAYER.inertia) < 2)
				PLAYER.inertia = 2 * PLAYER.orientation;
		}

		else
			PLAYER.forced_roll = false;

		state = 0;
	}
}

else	// Increment state
	state = 1;