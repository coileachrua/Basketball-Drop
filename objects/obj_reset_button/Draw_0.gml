// obj_room_button – Draw Event
var col = #FF5F0A;
/// Draw the button rectangle and its label centered
draw_set_color(hover ? hover_color :col );
draw_rectangle(x, y, x + width, y + height, false);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(text_color);
if (font != -1){
	draw_set_font(font);
}
draw_text(x + width/2, y + height/2, label);
