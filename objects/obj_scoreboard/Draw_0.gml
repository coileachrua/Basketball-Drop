// obj_scoreboard – Draw Event
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
var y_pos = 100;
for (var i = 0; i < array_length(global.hole_scores); i++) {
    var strokes = global.hole_scores[i];
    var par = global.hole_pars[i];
    var delta = strokes - par;
    var delta_text;
    if (delta > 0) {
        delta_text = string(delta) + " over";
    } else if (delta < 0) {
        delta_text = string(-delta) + " under";
    } else {
        delta_text = "Even";
    }
    draw_text(48, y_pos, "Hole " + string(i+1) + ": " + string(strokes) + " (" + delta_text + ")");
    y_pos += 20;
}
var total_delta = global.running_total - global.par_total;
var total_text;
if (total_delta > 0) {
    total_text = string(total_delta) + " over";
} else if (total_delta < 0) {
    total_text = string(-total_delta) + " under";
} else {
    total_text = "Even";
}
draw_text(48, y_pos + 20, "Total: " + string(global.running_total) + " (" + total_text + ")");
var col = hover ? c_lime : c_gray;
draw_set_color(col);
draw_rectangle(x, y, x + width, y + height, false);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x + width / 2, y + height / 2, label);
