// obj_level_title – Draw GUI Event
draw_set_font(Font1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_text_transformed(room_width/2, room_height/2, title, scale, scale, 0);
draw_set_alpha(1);
