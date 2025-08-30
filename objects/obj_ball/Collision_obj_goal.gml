var controller = global.controller;
var sfx_enabled = variable_struct_get(controller.settings, "sfx_enabled");
var music_enabled = variable_struct_get(controller.settings, "music_enabled");

if (sfx_enabled) {
    audio_play_sound(swish_1, 10, false);
}

global.can_spawn_ball = false;
array_push(global.hole_scores, global.strokes);
array_push(global.hole_pars, global.current_par);
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


global.next_room = room_next(room);
alarm[0] = room_speed;

