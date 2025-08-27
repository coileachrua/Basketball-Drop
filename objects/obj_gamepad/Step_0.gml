if (global.can_spawn_ball &&
    global.spawn_ball_cooldown <= 0 &&
    mouse_check_button(mb_left) &&
    mouse_y < global.spawn_zone_height &&
    alarm[0] < 0) {
    instance_create_layer(mouse_x, mouse_y, layer, obj_ball);
    global.strokes++;
    alarm[0] = 5;
}
