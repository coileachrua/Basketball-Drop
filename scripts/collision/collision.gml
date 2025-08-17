enum CollisionState {
    NONE,
    ENTER,
    STAY,
    EXIT
}

	

function check_collision_state(obj, current_state_ref, time_ref, interval_us, spr_none, spr_enter, spr_stay, spr_exit) {

time_ref += delta_time;
var controller = global.controller;
var sfx_enabled = variable_struct_get(controller.settings, "sfx_enabled");
var music_enabled = variable_struct_get(controller.settings, "music_enabled");

var is_colliding =
    physics_test_overlap(x, y + sprite_height / 2 + 1, 0, obj) || // bottom
    physics_test_overlap(x, y - sprite_height / 2 - 1, 0, obj) || // top
    physics_test_overlap(x + sprite_width / 2 + 1, y, 0, obj) ||  // right
    physics_test_overlap(x - sprite_width / 2 - 1, y, 0, obj);    // leftj);

    if (time_ref >= interval_us) {
        time_ref = 0;

        switch (current_state_ref) {
            case CollisionState.NONE:
                if (is_colliding) {
                    current_state_ref = CollisionState.ENTER;
                    sprite_index = spr_enter;
                    if (sfx_enabled) {
                        audio_play_sound(short_click_7, 1, false);
                    }
                    show_debug_message("ENTER: " + string(obj));
                }else {
					
				}	
                break;

            case CollisionState.ENTER:
                current_state_ref = CollisionState.STAY;
                sprite_index = spr_stay;
                show_debug_message("STAY: " + string(obj));
                break;

            case CollisionState.STAY:
                if (!is_colliding) {
                    current_state_ref = CollisionState.EXIT;
                    sprite_index = spr_exit;
                    show_debug_message("EXIT: " + string(obj));
                }
				else {
					show_debug_message("STILL COLLIDING, STAYING: " + string(obj));
				}					
                break;

            case CollisionState.EXIT:
                if (!is_colliding) {
                    current_state_ref = CollisionState.NONE;
                    sprite_index = spr_none;
                    show_debug_message("NONE: " + string(obj));
                } else {
                    current_state_ref = CollisionState.ENTER;
                    sprite_index = spr_enter;
                    show_debug_message("RE-ENTER: " + string(obj));
                }
                break;
        }
    }

    return [current_state_ref, time_ref];
}
