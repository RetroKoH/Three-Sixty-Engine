#macro TILE_COUNT	32
#macro TILE_SIZE	16

// Collision Data
global.tile_heights = [];
global.tile_widths = [];
global.tile_angles = [];
global.angle_data = [];

// Load Tile Heights
scr_load_col_maps(global.tile_heights, "heightmap.bin");
scr_load_col_maps(global.tile_widths, "widthmap.bin");