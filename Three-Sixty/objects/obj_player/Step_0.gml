/// @description Early Player Movement

// Keyboard checks
key_left	= keyboard_check(vk_left);
key_right	= keyboard_check(vk_right);
key_up		= keyboard_check(vk_up);
key_down	= keyboard_check(vk_down);

// Apply speeds
x_spd = (key_right - key_left) * 3.0625;
y_spd = (key_down - key_up) * 3.0625;

// Wall Tile Collision
scr_check_walls();
x_pos += x_spd;

// Floor Tile Collision
scr_check_floors();
y_pos += y_spd;

// Set positions on screen
x = floor(x_pos);
y = floor(y_pos);