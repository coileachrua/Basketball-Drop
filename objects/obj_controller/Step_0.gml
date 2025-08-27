/// obj_controller – Step Event

// Reset spawn permission on room changes
if (room != last_room) {
    global.can_spawn_ball = (room != rm_main_menu && room != rm_options);
    if (global.can_spawn_ball) {
        // Delay initial spawning to avoid accidental drops on room entry
        global.spawn_ball_cooldown = 10;
        // Limit spawning to the top quarter of the room
        global.spawn_zone_height = room_height / 4;
    }
    else {
        // Outside gameplay rooms the zone is disabled
        global.spawn_zone_height = 0;
    }
    last_room = room;
}

// Countdown the spawn cooldown if active
if (global.spawn_ball_cooldown > 0) {
    global.spawn_ball_cooldown--;
}

// Advance the glow animation for the spawn zone
spawn_zone_pulse += 0.05;

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
