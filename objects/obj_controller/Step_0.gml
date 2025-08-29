/// obj_controller – Step Event

// Reset spawn permission on room changes
if (room != last_room) {
    var room_name = room_get_name(room);
    if (variable_struct_exists(par_values, room_name)) {
        global.current_par = variable_struct_get(par_values, room_name);
    } else {
        global.current_par = 0;
    }
    global.strokes = 0;
    global.classification = "";
    global.can_spawn_ball = (room != rm_main_menu && room != rm_options && room != rm_score && room != rm_highscores);
    if (global.can_spawn_ball) {
        global.par_total += global.current_par;
        // Delay initial spawning to avoid accidental drops on room entry
        global.spawn_ball_cooldown = 10;

        if (variable_struct_exists(spawn_zones, room_name)) {
            var zone = variable_struct_get(spawn_zones, room_name);
            global.spawn_zone_left   = zone.x1 * room_width;
            global.spawn_zone_top    = zone.y1 * room_height;
            global.spawn_zone_right  = zone.x2 * room_width;
            global.spawn_zone_bottom = zone.y2 * room_height;
        } else {
            // Default to the top eighth of the screen
            global.spawn_zone_left   = 0;
            global.spawn_zone_top    = 0;
            global.spawn_zone_right  = room_width;
            global.spawn_zone_bottom = room_height / 8;
        }
    }
    else {
        // Outside gameplay rooms the zone is disabled
        global.spawn_zone_left   = 0;
        global.spawn_zone_top    = 0;
        global.spawn_zone_right  = 0;
        global.spawn_zone_bottom = 0;
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


if (controller.settings.music_enabled && !audio_is_playing(flow)) {

    audio_play_sound(flow, 1, true);
}
if (!controller.settings.music_enabled) {

    audio_stop_sound(flow);
}

if (controller.settings.sfx_enabled && !audio_is_playing(rain)) {

    audio_play_sound(rain, 1, true);
}
if (!controller.settings.sfx_enabled) {

    audio_stop_sound(rain);
}
