/// @description Render current tile

if (tile)
	draw_sprite_ext(sprite_index, tile, cell_x + (16 * flip_x), cell_y + (16 * flip_y),
					flip_x == false ? 1 : -1, flip_y == false ? 1 : -1, 0,
					color, 1);