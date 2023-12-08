/// @description Init Player

key_left	= false;
key_right	= false;
key_up		= false;
key_down	= false;

x_pos		= x;
y_pos		= y;
x_spd		= 0;
y_spd		= 0;

accel		= 0.046875;
decel		= 0.5;
fric		= 0.046875;
top_spd		= 6;

col_width	= 9;
col_height	= $13;	// (19)
col_push	= 10;	// constant
col_path	= layer_tilemap_get_id("Collision");

in_air		= false;