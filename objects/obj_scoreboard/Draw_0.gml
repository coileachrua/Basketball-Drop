// obj_scoreboard – Draw Event
draw_set_color(c_white);
draw_set_valign(fa_top);

if (global.next_room == -1) {
    draw_set_halign(fa_center);
    draw_text(room_width / 2, 32, "Final Scores");
}

// Show classification for the most recently completed hole
var hole_index = array_length(global.hole_scores);
if (hole_index > 0 && global.classification != "") {
    draw_set_halign(fa_center);
    draw_text(room_width / 2, 64, "Hole " + string(hole_index) + ": " + global.classification);
}

// table layout
var cols = 4;
var col_w = 80;
var start_x = room_width / 2 - col_w * cols / 2;
var y_pos = 100;

// draw header
draw_set_halign(fa_center);
draw_text(start_x + col_w * 0.5, y_pos, "Hole");
draw_text(start_x + col_w * 1.5, y_pos, "Par");
draw_text(start_x + col_w * 2.5, y_pos, "Score");
draw_text(start_x + col_w * 3.5, y_pos, "Total");
y_pos += 20;

// per-hole rows
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
    draw_text(start_x + col_w * 0.5, y_pos, string(i + 1));
    draw_text(start_x + col_w * 1.5, y_pos, string(par));
    draw_text(start_x + col_w * 2.5, y_pos, string(strokes));
    draw_text(start_x + col_w * 3.5, y_pos, delta_text);
    y_pos += 20;
}

// totals row
var total_delta = global.running_total - global.par_total;
var total_text;
if (total_delta > 0) {
    total_text = string(total_delta) + " over";
} else if (total_delta < 0) {
    total_text = string(-total_delta) + " under";
} else {
    total_text = "Even";
}
draw_text(start_x + col_w * 0.5, y_pos, "Total");
draw_text(start_x + col_w * 1.5, y_pos, string(global.par_total));
draw_text(start_x + col_w * 2.5, y_pos, string(global.running_total));
draw_text(start_x + col_w * 3.5, y_pos, total_text);
var col = hover ? c_lime : c_gray;
draw_set_color(col);
draw_rectangle(x, y, x + width, y + height, false);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x + width / 2, y + height / 2, label);
