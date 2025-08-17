function are_balls_touching(ball1, ball2) {
    if (!instance_exists(ball1) || !instance_exists(ball2)) return false;
    if (ball1.id == ball2.id) return false;

    var dx = ball1.x - ball2.x;
    var dy = ball1.y - ball2.y;
    var dist_sq = dx * dx + dy * dy;

    // Assume radius is half of sprite width
    var radius1 = ball1.sprite_width * 0.5;
    var radius2 = ball2.sprite_width * 0.5;
    var combined_radius = radius1 + radius2;

    return dist_sq <= (combined_radius * combined_radius);
}