/// obj_controller – Step Event

// Advance timer (seconds)
autosave_timer += delta_time / 1_000_000;

// When it reaches the interval...
if (autosave_timer >= AUTOSAVE_INTERVAL) {
    // Only if we have valid save data
    if (is_struct(loaded_data)) {
        save_game(filename, loaded_data);
        show_debug_message("Autosave triggered.");
    }
    // Start counting again
    autosave_timer = 0;
}


var controller = global.controller;


if (controller.settings.music_enabled && !audio_is_playing(bounce)) {

    audio_play_sound(bounce, 1, true);
}
if (!controller.settings.music_enabled) {

    audio_stop_sound(bounce);
}