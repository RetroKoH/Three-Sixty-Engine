// Collision Tile macro
#macro TILE_COUNT	48
#macro TILE_SIZE	16

// Collision Quadrant macro
#macro COL_FLOOR		0
#macro COL_WALL_R		1
#macro COL_CEILING		2
#macro COL_WALL_L		3

globalvar DEBUG;	DEBUG = false;

// Collision Data
global.tile_heights = [];
global.tile_widths = [];
global.tile_angles = [];
global.angle_data = [];

// Load Tile Heights and Angles
scr_load_col_maps(global.tile_heights, "heightmap.bin");
scr_load_col_maps(global.tile_widths, "widthmap.bin");
scr_load_col_angles(global.tile_angles, "anglemap.bin");

// Angle Data
var _factor = 360/256;
for (var _i = 0; _i < 256; _i++) {
	var _ang = _i * _factor;
	global.angle_data[_i] = {
		angle : _ang,
		sine : dsin(_ang),
		cosine : dcos(_ang)
	}
}

instance_create_layer(320, 164, "Instances", obj_player);