// obj_level_title – Draw GUI Event
// Save current draw settings so we don't interfere with other GUI draws
var _font   = draw_get_font();
var _halign = draw_get_halign();
var _valign = draw_get_valign();
var _alpha  = draw_get_alpha();

draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_text_transformed(room_width/2, room_height/2, title, scale, scale, 0);

// Restore previous draw settings
draw_set_alpha(_alpha);
draw_set_halign(_halign);
draw_set_valign(_valign);
draw_set_font(_font);
