/// @description Render current tile

for (var _i = 0; _i < 3; _i++)
	if (tile[_i])
		draw_sprite_ext(sprite_index, tile[_i],
						cell_x[_i] + (16 * flip_x[_i]),
						cell_y[_i] + (16 * flip_y[_i]),
						flip_x[_i] == false ? 1 : -1,
						flip_y[_i] == false ? 1 : -1,
						0, color[_i], 1);