///@function scr_player_roll()
function scr_player_roll(){
	
	if !forced_roll and (key_left or key_right)
		exit;
		
	// Check if we should roll up
	var _manual_roll = false;

	if (key_down) and (abs(inertia) >= 1.03125)
		_manual_roll = true;
	
	if ((_manual_roll) or (forced_roll)){
		// Roll if absolute gsp is past a certain threshold (SK sets to 1. I had it at 1.03125)
		rolling		= true;				// Set rolling flag
		col_height	= HEIGHT_ROLL;		// Set tile collision radius
		col_width	= WIDTH_ROLL;
		anim_ID		= ANI_PLAYER.ROLL;
		y_pos		+= col_height_def - col_height;	// Reposition character according to height change
		// Play SFX
	}
}