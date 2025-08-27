/// obj_toggle_button – Step Event

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

// Hover test
hover = point_in_rectangle(mx, my, x, y, x + width, y + height);

if (hover && mouse_check_button_pressed(mb_left)) {
    global.can_spawn_ball = false;

    var controller = global.controller;
    var current = variable_struct_get(controller.settings, toggle_key);
        var flipped = !current;
        variable_struct_set(controller.settings, toggle_key, flipped);
		
        // Mirror into the save struct
        variable_struct_set(controller.loaded_data, toggle_key, flipped);
        save_game(controller.filename, controller.loaded_data);
	var music_enabled = variable_struct_get(controller.settings, "music_enabled");

		if (music_enabled) {
			 if (!audio_is_playing(bounce)) {
			    audio_play_sound(bounce, 1, true); 
			 }
		}
    
}
