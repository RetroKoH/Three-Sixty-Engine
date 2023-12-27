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

col_width		= 9;
col_height		= $13;	// (19)
col_push		= 10;	// constant
col_path		= global.map_id[0];
col_angle		= 0;
col_angle_data	= global.angle_data[col_angle];

orientation		= 1;		// 1 = RIGHT. -1 = LEFT.
in_air			= false;
jumping			= false;
landing			= false;
pushing			= false;

scr_gfunc_anim_init(true, global.AnimTable_PlayerSonic, 0);