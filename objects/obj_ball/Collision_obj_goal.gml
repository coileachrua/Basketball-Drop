var controller = global.controller;
var sfx_enabled = variable_struct_get(controller.settings, "sfx_enabled");
var music_enabled = variable_struct_get(controller.settings, "music_enabled");

if (sfx_enabled) {
    audio_play_sound(phaser, 10, false);
}

if (room_next(room) != -1) {
    room_goto_next();
} else {
    room_goto(rm_main_menu);
}
