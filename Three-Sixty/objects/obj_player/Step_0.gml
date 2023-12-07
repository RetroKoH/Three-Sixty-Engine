/// @description Early Player Movement

// Keyboard checks
key_left	= keyboard_check(vk_left);
key_right	= keyboard_check(vk_right);
key_up		= keyboard_check(vk_up);
key_down	= keyboard_check(vk_down);

// Apply speeds
x_spd = (key_right - key_left) * 2;
y_spd = (key_down - key_up) * 2;

// NEW FUNCTION: Check for walls

x_pos += x_spd;

// NEW FUNCTION: Check for floors/ceilings

y_pos += y_spd;

// Set positions
x = x_pos;
y = y_pos;