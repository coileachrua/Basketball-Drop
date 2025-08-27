var controller = global.controller;
var sfx_enabled = variable_struct_get(controller.settings, "sfx_enabled");
var music_enabled = variable_struct_get(controller.settings, "music_enabled");

if (sfx_enabled) {
    audio_play_sound(phaser, 10, false);
}

global.can_spawn_ball = false;
array_push(global.hole_scores, global.strokes);
global.running_total += global.strokes;
var delta = global.strokes - global.current_par;
if (delta <= -2) {
    global.classification = (delta <= -3) ? "Albatross" : "Eagle";
} else if (delta == -1) {
    global.classification = "Birdie";
} else if (delta == 0) {
    global.classification = "Par";
} else if (delta == 1) {
    global.classification = "Bogey";
} else {
    global.classification = string(delta) + " over";
}

if (room_next(room) != -1) {
    room_goto_next();
} else {
    var idx = array_length(global.loaded_data.attempts) + 1;
    var delta_total = global.running_total - global.par_total;
    var entry = { name: "attempt " + string(idx), score: delta_total };
    array_push(global.loaded_data.attempts, entry);
    save_game(global.save_filename, global.loaded_data);
    global.running_total = 0;
    global.hole_scores = [];
    global.par_total = 0;
    room_goto(rm_main_menu);
}
