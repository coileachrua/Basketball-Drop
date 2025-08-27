/// obj_controller – Draw GUI Event
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Highlight the valid spawn zone with a pulsing glow
if (global.can_spawn_ball) {
    var pulse = 0.25 + 0.15 * sin(spawn_zone_pulse);
    draw_set_alpha(pulse);
    gpu_set_blendmode(bm_add);
    draw_rectangle(0, 0, room_width, global.spawn_zone_height, false);
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (is_struct(loaded_data)) {
    draw_text(48, 16, "SFX:   " + string(loaded_data.sfx_enabled ? "ON" : "OFF"));
    draw_text(48, 36, "Music: " + string(loaded_data.music_enabled ? "ON" : "OFF"));
} else {
    draw_text(48, 16, "Save data not loaded.");
}


// Autosave countdown
var time_left = max(0, AUTOSAVE_INTERVAL - autosave_timer);
draw_text(48, 56, "Next Autosave In: " + string(round(time_left)) + "s");

// Display current strokes and par during gameplay
if (global.can_spawn_ball) {
    draw_text(48, 76, "Strokes: " + string(global.strokes) + " / Par: " + string(global.current_par));
    if (global.classification != "") {
        draw_text(48, 96, global.classification);
    }
}

// Show attempt history on the main menu
if (room == rm_main_menu && is_struct(global.loaded_data) && variable_struct_exists(global.loaded_data, "attempts")) {
    var y_pos = 96;
    for (var i = 0; i < array_length(global.loaded_data.attempts); i++) {
        var entry = global.loaded_data.attempts[i];
        var score_text;
        if (entry.score > 0) {
            score_text = string(entry.score) + " over";
        } else if (entry.score < 0) {
            score_text = string(-entry.score) + " under";
        } else {
            score_text = "Even";
        }
        draw_text(48, y_pos, entry.name + ": " + score_text);
        y_pos += 20;
    }
}
