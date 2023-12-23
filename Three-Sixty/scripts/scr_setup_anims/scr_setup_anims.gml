/// @function scr_setup_anim(table, name, sprite, mask, mask_left, sub_anim, loop_times, loop_frame, loop_anim)
function scr_setup_anim(_table, _name, _sprite, _mask_1, _mask_2, _sub_anim, _loop_times, _loop_frame, _loop_anim){
	var _table_entry = {
		name		: _name,
		sprite		: _sprite,
		mask		: _mask_1,
		mask_l		: _mask_2,
		sub_anim	: _sub_anim,
		loop_times	: _loop_times,
		loop_frame	: _loop_frame,
		loop_anim	: _loop_anim,
		frames		: [],
		speeds		: []
	}
	
	array_push(_table, _table_entry);
}

/// @function scr_setup_anim_frame(table, frame_index, frame_speed)
function scr_setup_anim_frame(_table, _frame, _speed){
	var i = array_length(_table) - 1;
	
	array_push(_table[i].frames, _frame);
	array_push(_table[i].speeds, _speed);
}