var ball_inst = instance_nearest(x, y, obj_ball);
if (ball_inst != noone) {
    var dx = ball_inst.x - x;
    var dy = ball_inst.y - y;
    var dist_sq = dx * dx + dy * dy;
    var radius = ball_inst.sprite_width * 0.5;
    if (dist_sq < radius * radius) {
        physics_apply_impulse(x, y, ball_inst.phy_speed_x * 0.2, ball_inst.phy_speed_y * 0.2);
    }
}
