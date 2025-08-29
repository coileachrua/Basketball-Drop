// obj_attempt_table – Draw Event
var attempts = global.loaded_data.attempts;

// Title
var title_y = 50;
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(50, title_y, "Attempts");

// List each attempt with its score
var start_y = title_y + 50;
for (var i = 0; i < array_length(attempts); i++) {
    var entry = attempts[i];
    var row_y = start_y + i * 32;
    draw_text(50, row_y, entry.name);
    draw_text(250, row_y, string(entry.score));
}
