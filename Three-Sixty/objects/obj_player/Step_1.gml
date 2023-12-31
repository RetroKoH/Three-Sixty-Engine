/// @description Player Control

// Keyboard checks
key_left		= keyboard_check(ord("A"));
key_right		= keyboard_check(ord("D"));
key_up			= keyboard_check(ord("W"));
key_down		= keyboard_check(ord("S"));
key_jump		= keyboard_check(ord("J"));
key_jump_press	= keyboard_check_pressed(ord("J"));

scr_ctrl_player();

if keyboard_check_pressed(vk_space)
	DEBUG ^= true;