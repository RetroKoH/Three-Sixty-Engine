/// @description Draw Mask and Sensors

draw_self();

// Floor sensors (Always at x +/- width, y + height)
draw_sprite_ext(	spr_debug_line,0,	x-col_width,	y,		1,col_height,0, c_green,1);		// Sensor A
draw_sprite(		spr_debug_line,0,	x-col_width,	y+col_height);
draw_sprite_ext(	spr_debug_line,0,	x+col_width,	y,		1,col_height,0, c_teal,1);		// Sensor B
draw_sprite(		spr_debug_line,0,	x+col_width,	y+col_height);

// Ceiling sensors (Always at x +/- width, y + height)
draw_sprite_ext(	spr_debug_line,0,	x-col_width,	y,		1,-col_height,0, c_blue,1);		// Sensor C
draw_sprite(		spr_debug_line,0,	x-col_width,	y-col_height);
draw_sprite_ext(	spr_debug_line,0,	x+col_width,	y,		1,-col_height,0, c_yellow,1);	// Sensor D
draw_sprite(		spr_debug_line,0,	x+col_width,	y-col_height);

// Wall sensors (Always at x +/- width, y - height)
draw_sprite_ext(	spr_debug_line,0,	x,				y+8,	-col_push,1,0,c_blue,1);		// Sensor E
draw_sprite(		spr_debug_line,0,	x-col_push,		y+8);
draw_sprite_ext(	spr_debug_line,0,	x,				y+8,	col_push,1,0,c_red,1);			// Sensor F
draw_sprite(		spr_debug_line,0,	x+col_push,		y+8);

// Draw center
draw_sprite(		spr_debug_center,0,	x,				y+8);