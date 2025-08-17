if (mouse_check_button(mb_left) && (alarm[0] < 0)) {
    if (room != rm_main_menu && room != rm_options) {
        instance_create_layer(mouse_x, mouse_y, layer, obj_ball);
        alarm[0] = 5;
    }
}
