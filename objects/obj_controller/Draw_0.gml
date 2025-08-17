/// obj_controller – Draw GUI Event
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (is_struct(loaded_data)) {
    draw_text(48, 16, "SFX:   " + string(loaded_data.sfx_enabled ? "ON" : "OFF"));
    draw_text(48, 36, "Music: " + string(loaded_data.music_enabled ? "ON" : "OFF"));
} else {
    draw_text(48, 16, "Save data not loaded.");
}


// Autosave countdown
var time_left = max(0, AUTOSAVE_INTERVAL - autosave_timer);
draw_text(48, 56, "Next Autosave In: " + string(round(time_left)) + "s");
