/// @description Draw Mask and Sensors

/*var _rot = (col_angle_data.mode_ground * 90);
if col_path = global.map_id[0]
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, _rot, c_white, 1);
else
	draw_sprite_ext(sprite_index, 1, x, y, 1, 1, _rot, c_white, 1);
*/

scr_gfunc_anims_draw();

if (in_air){
	// Floor sensors (Always at x +/- width, y + height)
	draw_sprite_ext(	spr_debug_line,0,	x-col_width,	y,		1,col_height,0, c_green,1);		// Sensor A
	draw_sprite(		spr_debug_line,0,	x-col_width,	y+col_height);
	draw_sprite_ext(	spr_debug_line,0,	x+col_width,	y,		1,col_height,0, c_teal,1);		// Sensor B
	draw_sprite(		spr_debug_line,0,	x+col_width,	y+col_height);
	// Ceiling sensors (Always at x +/- width, y + height)
	draw_sprite_ext(	spr_debug_line,0,	x-col_width,	y,		1,-col_height,0, #0088EE,1);	// Sensor C
	draw_sprite(		spr_debug_line,0,	x-col_width,	y-col_height);
	draw_sprite_ext(	spr_debug_line,0,	x+col_width,	y,		1,-col_height,0, c_yellow,1);	// Sensor D
	draw_sprite(		spr_debug_line,0,	x+col_width,	y-col_height);
	// Wall sensors (Always at x +/- push, y)
	draw_sprite_ext(	spr_debug_line,0,	x,				y,		-col_push,1,0,c_blue,1);		// Sensor E
	draw_sprite(		spr_debug_line,0,	x-col_push,		y);
	draw_sprite_ext(	spr_debug_line,0,	x,				y,		col_push,1,0,c_red,1);			// Sensor F
	draw_sprite(		spr_debug_line,0,	x+col_push,		y);
}

else switch(col_angle_data.mode_ground) {
	case COL_FLOOR:
		// Floor sensors (Always at x +/- width, y + height)
		draw_sprite_ext(	spr_debug_line,0,	x-col_width,	y,		1,col_height,0, c_green,1);			// Sensor A
		draw_sprite(		spr_debug_line,0,	x-col_width,	y+col_height);
		draw_sprite_ext(	spr_debug_line,0,	x+col_width,	y,		1,col_height,0, c_teal,1);			// Sensor B
		draw_sprite(		spr_debug_line,0,	x+col_width,	y+col_height);
		// Ceiling sensors (Always at x +/- width, y + height)
		draw_sprite_ext(	spr_debug_line,0,	x-col_width,	y,		1,-col_height,0, #0088EE,1);		// Sensor C
		draw_sprite(		spr_debug_line,0,	x-col_width,	y-col_height);
		draw_sprite_ext(	spr_debug_line,0,	x+col_width,	y,		1,-col_height,0, c_yellow,1);		// Sensor D
		draw_sprite(		spr_debug_line,0,	x+col_width,	y-col_height);
		// Push sensors (Always at x +/- 10px, y + offset)
		var _y = y + 8 * (col_angle == 0);
		draw_sprite_ext(	spr_debug_line,0,	x,				_y,		-col_push,1,0,c_blue,1);			// Sensor E
		draw_sprite(		spr_debug_line,0,	x-col_push,		_y);
		draw_sprite_ext(	spr_debug_line,0,	x,				_y,		col_push,1,0,c_red,1);				// Sensor F
		draw_sprite(		spr_debug_line,0,	x+col_push,		_y);
	break;
	
	case COL_WALL_R:
		// Floor sensors (Always at x + height, y +/- width)
		draw_sprite_ext(spr_debug_line, 0,	x,				y+col_width,	col_height,1,0, c_green,1);		// Sensor A
		draw_sprite(spr_debug_line, 0,		x+col_height,	y+col_width);
		draw_sprite_ext(spr_debug_line, 0,	x,				y-col_width,	col_height,1,0, c_teal,1);		// Sensor B
		draw_sprite(spr_debug_line, 0,		x+col_height,	y-col_width);
		// Ceiling sensors (Always at x - height, y +/- width)
		draw_sprite_ext(spr_debug_line, 0,	x,				y+col_width,	-col_height,1,0, #0088EE,1);	// Sensor C
		draw_sprite(spr_debug_line, 0,		x-col_height,	y+col_width);
		draw_sprite_ext(spr_debug_line, 0,	x,				y-col_width,	-col_height,1,0, c_yellow,1);	// Sensor D
		draw_sprite(spr_debug_line, 0,		x-col_height,	y-col_width);
		// Push sensors (Always at x, y +/- 10px)
		draw_sprite_ext(spr_debug_line, 0,	x,				y,				1,col_push,0, c_blue,1);		// Sensor E
		draw_sprite(spr_debug_line, 0,		x,				y+col_push);
		draw_sprite_ext(spr_debug_line, 0,	x,				y,				1,-col_push,0, c_red,1);		// Sensor F
		draw_sprite(spr_debug_line, 0,		x,				y-col_push);
	break;
	
	case COL_CEILING:
		// Floor sensors (Always at x +/- width, y - height)
		draw_sprite_ext(spr_debug_line, 0,	x+col_width,	y,				1,-col_height,0, c_green,1);	// Sensor A
		draw_sprite(spr_debug_line, 0,		x+col_width,	y-col_height);
		draw_sprite_ext(spr_debug_line, 0,	x-col_width,	y,				1,-col_height,0, c_teal,1);		// Sensor B
		draw_sprite(spr_debug_line, 0,		x-col_width,	y-col_height);
		// Ceiling sensors (Always at x +/- width, y - height)
		draw_sprite_ext(spr_debug_line, 0,	x+col_width,	y,				1,col_height,0, #0088EE,1);		// Sensor C
		draw_sprite(spr_debug_line, 0,		x+col_width,	y+col_height);
		draw_sprite_ext(spr_debug_line, 0,	x-col_width,	y,				1,col_height,0, c_yellow,1);	// Sensor D
		draw_sprite(spr_debug_line, 0,		x-col_width,	y+col_height);
		// Push sensors (Always at x +/- 10px, y)
		draw_sprite_ext(spr_debug_line, 0,	x,				y,				col_push,1,0, c_fuchsia,1);		// Sensor E
		draw_sprite(spr_debug_line, 0,		x+col_push,		y);
		draw_sprite_ext(spr_debug_line, 0,	x,				y,				-col_push,1,0, c_red,1);		// Sensor F
		draw_sprite(spr_debug_line, 0,		x-col_push,		y);
	break;
	
	case COL_WALL_L:
		// Floor sensors (Always at x + height, y +/- width)
		draw_sprite_ext(spr_debug_line, 0,	x,				y-col_width,	-col_height,1,0, c_green,1);	// Sensor A
		draw_sprite(spr_debug_line, 0,		x-col_height,	y-col_width);
		draw_sprite_ext(spr_debug_line, 0,	x,				y+col_width,	-col_height,1,0, c_teal,1);		// Sensor B
		draw_sprite(spr_debug_line, 0,		x-col_height,	y+col_width);
		// Ceiling sensors (Always at x - height, y +/- width)
		draw_sprite_ext(spr_debug_line, 0,	x,				y-col_width,	col_height,1,0, #0088EE,1);		// Sensor C
		draw_sprite(spr_debug_line, 0,		x+col_height,	y-col_width);
		draw_sprite_ext(spr_debug_line, 0,	x,				y+col_width,	col_height,1,0, c_yellow,1);	// Sensor D
		draw_sprite(spr_debug_line, 0,		x+col_height,	y+col_width);
		// Push sensors (Always at x (or x + offset), y +/- 10px)
		draw_sprite_ext(spr_debug_line, 0,	x,				y,				1,-col_push,0, c_blue,1);		// Sensor E
		draw_sprite(spr_debug_line, 0,		x,				y-col_push);
		draw_sprite_ext(spr_debug_line, 0,	x,				y,				1,col_push,0, c_red,1);			// Sensor F
		draw_sprite(spr_debug_line, 0,		x,				y+col_push);
	break;
}

// Draw center
draw_sprite(spr_debug_center, 0, x, y);