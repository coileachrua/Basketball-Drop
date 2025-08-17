// obj_room_button – Step Event
/// Handle hover & click
var mx = device_mouse_x(0);
var my = device_mouse_y(0);

// Check if the pointer is over the button
hover = (mx >= x && mx <= x + width && my >= y && my <= y + height);

// On click, change room
if (hover && mouse_check_button_pressed(mb_left)) {
    if (room_exists(target_room)) {
        room_goto(target_room);
    }
}
