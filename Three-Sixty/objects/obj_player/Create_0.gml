/// @description Init Player

key_left		= false;
key_right		= false;
key_up			= false;
key_down		= false;
key_jump		= false;
key_jump_press	= false;

x_pos			= x;
y_pos			= y;
x_spd			= 0;
y_spd			= 0;
inertia			= 0;
move_lock		= 0;

accel			= 0.046875;
decel			= 0.5;
fric			= 0.046875;
top_spd			= 6;
jmp_spd			= 6.5;

col_width		= WIDTH_MAIN;
col_height		= HEIGHT_MAIN;
col_height_def	= col_height;
col_push		= WIDTH_PUSH;	// constant
col_path		= global.map_id[0];
col_angle		= 0;
col_angle_data	= global.angle_data[col_angle];

orientation		= 1;		// 1 = RIGHT. -1 = LEFT.
in_air			= false;
rolling			= false;
pushing			= false;
jumping			= false;
landing			= false;

forced_roll		= false;

scr_gfunc_anim_init(true, global.AnimTable_PlayerSonic, 0);