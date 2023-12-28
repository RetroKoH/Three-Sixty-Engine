///@function scr_setup_level_layout(zone)
function scr_setup_level_layout(_zone = 0){
	/*switch(_zone)
	{
		case ZONE.GHZ:
			dat_layout = layout_GHZ;
			dat_aniart = aniart_GHZ;
		break;
	}*/
	var _layout = layout_GHZ;
	var _aniart = aniart_GHZ;

	global.chunks_count = 0;
	var _t = 0, _tx = 0, _ty = 0;

	// For every 128x128 Chunk, we need to set collision tiles based on the chunk present
	// This needs to be done twice, once for each collision plane
	for (var _i = 0; _i < 2; _i++) {
		for (var _ix = 0; _ix < room_width div 128; _ix++) {
			for (var _iy = 0; _iy < room_height div 128; _iy++) {
				_t = tilemap_get(global.chunks_id, _ix, _iy);
				if (_t) {
					_tx = _ix*8; _ty = _iy*8;
					
					// _i=collision plane; _t=tile ID; _tx=tile_x; _ty=tile_y;
					script_execute(_layout, _i, _t, _tx, _ty);
					if (_i == 0)
						script_execute(_aniart, _t, _ix*128, _iy*128);
					global.chunks_count++;
				}
			}
		}
	} show_message(global.chunks_count);
}