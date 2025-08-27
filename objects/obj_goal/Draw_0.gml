// Draw goal and white net that moves when hit
var prev_col = draw_get_color();

draw_self();

draw_set_color(c_white);
var top = y + sprite_get_height(sprite_index) / 2;
var height = 20;
var bottom = top + height;

for (var i = -10; i <= 10; i += 5) {
    draw_line(x + i, top, x + i, bottom + net_offset);
}
for (var j = 0; j <= height; j += 5) {
    var y_line = top + j + net_offset * (j / height);
    draw_line(x - 10, y_line, x + 10, y_line);
}
draw_set_color(prev_col);
