// obj_scoreboard – Step Event
var mx = device_mouse_x(0);
var my = device_mouse_y(0);
hover = (mx >= x && mx <= x + width && my >= y && my <= y + height);
if (hover && mouse_check_button_pressed(mb_left)) {
    global.can_spawn_ball = false;
    if (global.next_room != -1) {
        var target = global.next_room;
        global.next_room = -1;
        room_goto(target);
    } else {
        var idx = array_length(global.loaded_data.attempts) + 1;
        var delta_total = global.running_total - global.par_total;
        var entry = { name: "attempt " + string(idx), score: delta_total };
        array_push(global.loaded_data.attempts, entry);
        save_game(global.save_filename, global.loaded_data);
        global.running_total = 0;
        global.hole_scores = [];
        global.hole_pars = [];
        global.par_total = 0;
        global.next_room = -1;
        room_goto(rm_main_menu);
    }
}
