///@function scr_setup_game()
function scr_setup_game(){
	scr_setup_macros();
	scr_setup_globals();
	scr_setup_collision();
	scr_setup_animations();

	random_set_seed(randomise());
	room_goto(zone_GHZ1);
}

///@function scr_setup_macros()
function scr_setup_macros(){
// Collision Tile macro
	#macro TILE_COUNT		256
	#macro TILE_SIZE		16

	// Collision Quadrant macro
	#macro COL_FLOOR		0
	#macro COL_WALL_R		1
	#macro COL_CEILING		2
	#macro COL_WALL_L		3

	// Tile type macro
	#macro TILE_FULLSOLID	1
	#macro TILE_TOPSOLID	2
	#macro TILE_LRBSOLID	4

	// Player Size macro
	#macro HEIGHT_MAIN		$13	// Standard height (19)
	#macro HEIGHT_SHORT		$F	// Tails' standing height (15)
	#macro HEIGHT_ROLL		$E	// Rolling height (14)
	#macro HEIGHT_GLIDE		$A	// Gliding height (10)
	#macro WIDTH_MAIN		9	// Standard Width
	#macro WIDTH_ROLL		7	// Rolling Width
	#macro WIDTH_GLIDE		$A	// Gliding Width (10)
	#macro WIDTH_PUSH		$A	// Pushing Width (10)
}

///@function scr_setup_globals()
function scr_setup_globals(){
	globalvar DEBUG, STAGE, PLAYER, D_TILE;
	
	DEBUG = false;
}

///@function scr_setup_collision()
function scr_setup_collision(){
	global.map_id		= array_create(2, -1);
	global.spr_id		= -1;
	global.chunks_id	= -1;
	global.chunks_count	= 0;

	global.tile_heights	= [];
	global.tile_widths	= [];
	global.tile_angles	= [];
	global.angle_data	= [];

	// Load Tile Heights and Angles
	scr_load_col_maps(global.tile_heights, "heightmap.bin");
	scr_load_col_maps(global.tile_widths, "widthmap.bin");
	scr_load_col_angles(global.tile_angles, "anglemap.bin");

	// Angle Data
	var _factor = 360/256;
	for (var _i = 0; _i < 256; _i++) {
		var _ang = _i * _factor;
		global.angle_data[_i] = {
			angle		: _ang,
			sine		: dsin(_ang),
			cosine		: dcos(_ang),
			mode_ground	: scr_setup_angle_quadrants_ground(_i),
			mode_push	: scr_setup_angle_quadrants_air(_i),
		}
	}

	// Collision Tile Layers
	global.map_id[0] = layer_tilemap_get_id(layer_get_id("Col_Layer_1"));
	global.map_id[1] = layer_tilemap_get_id(layer_get_id("Col_Layer_2"));
}

///@function scr_setup_animations()
function scr_setup_animations(){
	global.AnimsIndex = [];	// Every script below pushes an animation into this index

	animtable_PLAYERS();
}