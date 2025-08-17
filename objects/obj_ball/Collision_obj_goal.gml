var controller = global.controller;
var sfx_enabled = variable_struct_get(controller.settings, "sfx_enabled");
var music_enabled = variable_struct_get(controller.settings, "music_enabled");

if (sfx_enabled) {
    audio_play_sound(phaser, 10, false);
}
