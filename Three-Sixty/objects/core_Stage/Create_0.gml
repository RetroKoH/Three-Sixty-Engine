/// @description Setup current stage

// Set up layer IDs (Move to stage setup script later)
var _layer_id = layer_get_id("Col_Layer_1");
global.map_id[0] = layer_tilemap_get_id(_layer_id);
_layer_id = layer_get_id("Col_Layer_2");
global.map_id[1] = layer_tilemap_get_id(_layer_id);
global.spr_id = layer_get_id("Animations");
_layer_id = layer_get_id("Foreground");
global.chunks_id = layer_tilemap_get_id(_layer_id);

// Move to stage setup script later and use parameter
scr_setup_level_layout();

// In the future, load object index from array of obj_Players (Move to stage setup script later)
PLAYER = instance_create_layer(90, 903, "Instances", obj_player);
D_TILE = instance_create_layer(0, 0, "Instances", obj_debugtiles);