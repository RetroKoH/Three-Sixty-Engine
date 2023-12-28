// Collision Tile Layers
global.map_id[0] = layer_tilemap_get_id(layer_get_id("Col_Layer_1"));
global.map_id[1] = layer_tilemap_get_id(layer_get_id("Col_Layer_2"));

globalvar PLAYER; PLAYER = instance_create_layer(35, 384, "Instances", obj_player);
globalvar D_TILE; D_TILE = instance_create_layer(0, 0, "Instances", obj_debugtiles);