/// obj_toggle_button – Draw Event


var  on_off = variable_struct_get( global.controller.settings, toggle_key);


// Background color depends on state
draw_set_color(on_off ? bg_on : bg_off);
draw_rectangle(x, y, x + width, y + height, false);

// Label + state text
draw_set_color(text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(
    x + width/2,
    y + height/2,
    label + ": " + (on_off ? "ON" : "OFF")
);
