// Move between defined start and end coordinates
var target_x = dir > 0 ? end_x : start_x;
var target_y = dir > 0 ? end_y : start_y;
var dx = target_x - phy_position_x;
var dy = target_y - phy_position_y;
var dist = point_distance(phy_position_x, phy_position_y, target_x, target_y);
if (dist <= speed) {
    phy_position_x = target_x;
    phy_position_y = target_y;
    dir *= -1;
} else {
    phy_position_x += (dx / dist) * speed;
    phy_position_y += (dy / dist) * speed;
}
