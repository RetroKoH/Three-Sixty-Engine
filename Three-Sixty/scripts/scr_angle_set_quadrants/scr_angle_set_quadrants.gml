///@function scr_angle_set_floor_quadrants(angle)
function scr_angle_set_floor_quadrants(_angle){
	if _angle <= $20 or _angle >= $E0		// 0-45; 315-360
		return COL_FLOOR;

	else if _angle >= $21 and _angle <= $5F	// 46-134
		return COL_WALL_R;

	else if _angle >= $60 and _angle <= $A0	// 135-225
		return COL_CEILING;

	else if _angle >= $A1 and _angle <= $DF	// 226-314
		return COL_WALL_L;
}