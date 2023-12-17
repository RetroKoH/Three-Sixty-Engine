/// @description Debug data

draw_text(4, 4,
	string_hash_to_newline(
		"Inertia: "+string(inertia)+
		"#X (Actual): "+string(x_pos)+
		"#X (Screen): "+string(x)+
		"#X Speed: "+string(x_spd)+
		"#Y (Actual): "+string(y_pos)+
		"#Y (Screen): "+string(y)+
		"#Y Speed: "+string(y_spd)+
		"#Angle: "+string(global.angle_data[col_angle].angle)+
		"#In Air: " + (in_air ? "YES" : "NO")
	)
);