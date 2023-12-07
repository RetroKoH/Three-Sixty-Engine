/// @description Debug data

draw_text(4, 4,
	string_hash_to_newline(
		"X (Actual): "+string(x)+
		"#X (Screen): "+string(x_pos)+
		"#X Speed: "+string(x_spd)+
		"#Y (Actual): "+string(y)+
		"#Y (Screen): "+string(y_pos)+
		"#Y Speed: "+string(y_spd)
	)
);