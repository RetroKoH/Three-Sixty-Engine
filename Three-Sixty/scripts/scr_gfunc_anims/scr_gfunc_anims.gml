///@function scr_gfunc_anim_init(has_anims, table, ID)
function scr_gfunc_anim_init(has_anims = false, table = -1, ID = -1){
	anim_flag			= has_anims;				// If true, this object has animations
	anim_table			= table;					// Animations Table
	anim_ID				= ID;						// Start with the ENTRY animation
	scr_gfunc_anims_reset();
}

///@function scr_gfunc_anims_reset()
function scr_gfunc_anims_reset(){
	if anim_flag {
		var at				= anim_table[anim_ID];
		anim_prev			= -1;						// No previous animation
		anim_sprite			= at.sprite					// Get animation sprite index
		anim_spriteframe	= 0;						// Reset sprite frame index
		anim_mask[0]		= at.mask					// Get primary sprite mask
		anim_mask[1]		= at.mask_l					// Get mirrored sprite mask
		anim_frame			= 0;						// Reset animation frame
		anim_framecount		= array_length(at.frames);	// Get number of frames in animation
		anim_looptimes		= at.loop_times				// Get # of loopbacks in animation.
		anim_loopframe		= at.loop_frame				// Get the frame for the animation to loop back to.
		anim_loopanim		= at.loop_anim				// Get the animation for the animation to loop back to.
		anim_direction		= 1;						// Direction of the animation
		anim_angle			= 0;						// Angle of the animation
		anim_xscale			= 1;						// Scale of the animation
		anim_yscale			= 1;						// Scale of the animation
		anim_speedmod		= 1;						// Speed mod factor, for running, and certain other animations.
		anim_framemod		= 0;						// General frame modifier, for certain instances such as running.
		anim_finished		= false;
		anim_reset			= true;
	}
	else {
		anim_prev			= -1;
		anim_sprite			= sprite_index
		anim_spriteframe	= 0;
		anim_mask[0]		= mask_index
		anim_mask[1]		= mask_index
		anim_frame			= 0;
		anim_framecount		= 0;
		anim_looptimes		= 0;
		anim_loopframe		= 0;
		anim_loopanim		= 0;
		anim_direction		= 1;
		anim_angle			= 0;
		anim_xscale			= 1;
		anim_yscale			= 1;
		anim_speedmod		= 1;
		anim_framemod		= 0;
		anim_finished		= false;
		anim_reset			= true;
	}
}

/// @function gfunc_anims_update([spr_override])
function gfunc_anims_update(spr_override = noone) {
	// Perform a value check. If number is outside the range of available animations, set ID to -1 and exit.
	if (anim_ID == -1) exit;

	if (anim_prev != anim_ID)
	{
	    anim_prev = anim_ID
    
		// Get information on current active animation. (Only perform on new animation).
		var at			= anim_table[anim_ID];

		if (spr_override == noone)
			spr_override = at.sprite;

		anim_sprite		= spr_override				// Get animation sprite index
		anim_mask[0]	= at.mask					// Get collision sprite mask
		anim_mask[1]	= at.mask_l					// Get mirrored collision sprite mask
		anim_frame		= 0;						// Reset animation frame
		anim_framecount	= array_length(at.frames);	// Get number of frames in animation
		anim_looptimes	= at.loop_times				// Get # of loopbacks in animation.
		anim_loopframe	= at.loop_frame				// Get the frame for the animation to loop back to.
		anim_loopanim	= at.loop_anim				// Get the animation for the animation to loop back to.
		anim_framemod	= 0;
		anim_finished	= false;
	}

	// ===== Animation System =====
	// If the animation finished, or char is dead, no need to go through all this again.
	if (anim_finished) exit;

	// Otherwise, proceed. Show the frame based on the animation. If we reach the end
	// of the animation, check for a loop or linked animation, etc.

	// Advance anim_frame by animation frame speed (Only if able to).
	if (floor(anim_frame) < anim_framecount)
		anim_frame += anim_table[anim_ID].speeds[floor(anim_frame)]*anim_speedmod;
	// The added check prevents bugs due to anim_frame being too high when jumping to linked animations.

	// If we have reached the total number of frames...
	if (floor(anim_frame) >= anim_framecount)
	{
	    // Loop back to loop frame while we can repeat.
	    if (anim_looptimes != 0)
	    {
	        anim_frame = anim_loopframe;
	        if (anim_looptimes > 0) anim_looptimes-=1; // -1 = the loop is infinite.
	    }
	    else
	    {
	        // The animation ends here. Change animation to the next linked one if such one exists.
	        // If not, simply set AnimationFinished on.
	        anim_frame             = anim_framecount-1;
	        anim_finished          = true;
	        if (anim_loopanim!=-1) anim_ID=anim_loopanim;
	        exit;
	    }
	}

	// Get sprite frame ID to draw, based on current animation frame.
	anim_spriteframe = anim_table[anim_ID].frames[floor(anim_frame)] + anim_framemod;

	// Store last used animation for next step's Animation handling.
	anim_prev = anim_ID;
}

/// @function scr_gfunc_anims_draw()
function scr_gfunc_anims_draw(){
	if anim_flag {
		if (anim_ID != -1)
			// --- Draw main animation -----------------------------------------------------
			draw_sprite_ext(anim_sprite, floor(anim_spriteframe), x, y,
							anim_direction*anim_xscale, anim_yscale, anim_angle,
							c_white, image_alpha);

		/*if sub_anims {
			if (subanim_ID != -1)
			// --- Draw sub-animation -----------------------------------------------------
			draw_sprite_ext(subanim_sprite, floor(subanim_spriteframe), floor(x), floor(y),
				            subanim_direction*subanim_xscale, subanim_yscale, subanim_angle,
				            c_white, image_alpha);
		}*/
	}
	else
		draw_self();
}