if (global.can_spawn_ball && global.spawn_ball_cooldown <= 0 && mouse_check_button(mb_left) && alarm[0] < 0) {
    instance_create_layer(mouse_x, mouse_y, layer, obj_ball);
    alarm[0] = 5;
}
