var ball = instance_nearest(x, y, obj_ball);
if (ball != noone) {
    var dx = ball.x - x;
    var dy = ball.y - y;
    var dist_sq = dx * dx + dy * dy;
    var radius = ball.sprite_width * 0.5;
    if (dist_sq < radius * radius) {
        physics_apply_impulse(id, x, y, ball.phy_speed_x * 0.2, ball.phy_speed_y * 0.2);
    }
}
