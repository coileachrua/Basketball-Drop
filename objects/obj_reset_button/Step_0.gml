// obj_reset_button – Step Event
/// Handle hover & click to reset save data
var mx = device_mouse_x(0);
var my = device_mouse_y(0);

// Check if the pointer is over the button
hover = (mx >= x && mx <= x + width && my >= y && my <= y + height);

// On click, delete and recreate save data
if (hover && mouse_check_button_pressed(mb_left)) {
    global.can_spawn_ball = false;
    var controller = global.controller;
    delete_game(controller.filename);
    controller.loaded_data = load_game(controller.filename);
    global.loaded_data = controller.loaded_data;
    controller.settings.sfx_enabled = controller.loaded_data.sfx_enabled;
    controller.settings.music_enabled = controller.loaded_data.music_enabled;
}
