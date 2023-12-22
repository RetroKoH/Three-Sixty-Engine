/// @description Insert description here
// You can write your code in this editor

if DEBUG
	exit;

if ground_only and PLAYER.in_air
	exit;

// Update active collision layer if player passed through the object
if !point_in_rectangle(	floor(PLAYER.x_pos), floor(PLAYER.y_pos),
						floor(x + trigger_left), floor(y + trigger_top),
						floor(x + trigger_right - 1), floor(y + trigger_bottom - 1))
{
	if (state)
	{
		if floor(PLAYER.x_pos) > x and dir_right != "None"
			PLAYER.col_path = global.map_id[dir_right];

		else if floor(PLAYER.x_pos) < x and dir_left != "None"
			PLAYER.col_path = global.map_id[dir_left];

		state = 0;
	}
}

else	// Increment state
	state = 1;