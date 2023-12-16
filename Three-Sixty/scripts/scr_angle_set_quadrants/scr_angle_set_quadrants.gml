///@function scr_angle_set_ground_quadrants(angle)
function scr_angle_set_ground_quadrants(_angle){
	if _angle <= $20 or _angle >= $E0		// 0-45; 315-360
		return COL_FLOOR;

	else if _angle >= $21 and _angle <= $5F	// 46-134
		return COL_WALL_R;

	else if _angle >= $60 and _angle <= $A0	// 135-225
		return COL_CEILING;

	else if _angle >= $A1 and _angle <= $DF	// 226-314
		return COL_WALL_L;
}

///@function scr_angle_set_push_quadrants(angle)
function scr_angle_set_push_quadrants(_angle){
	if _angle < $20 or _angle >= $E1		// 0-44; 316-360
		return COL_FLOOR;

	else if _angle >= $20 and _angle <= $60	// 45-135
		return COL_WALL_R;

	else if _angle >= $61 and _angle <= $9F	// 136-224
		return COL_CEILING;

	else if _angle >= $A0 and _angle <= $E0	// 225-315
		return COL_WALL_L;
}