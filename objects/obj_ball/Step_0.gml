// --- Collision state update: floor ---
var result_floor = check_collision_state(
    obj_floor, collision_state_floor, time_floor, interval_ms,
    spr_circle, spr_enter, spr_stay, spr_exit
);
collision_state_floor = result_floor[0];
time_floor = result_floor[1];

// --- Collision state update: pin ---
var result_pin = check_collision_state(
    obj_pin, collision_state_pin, time_pin, interval_ms,
    spr_circle, spr_enter, spr_stay, spr_exit
);
collision_state_pin = result_pin[0];
time_pin = result_pin[1];

// --- Collect all other balls ---
var all_balls = array_create(0);
with (obj_ball) {
    if (id != other.id) {
        array_push(all_balls, id);
    }
}

var controller = global.controller;
var sfx_enabled = variable_struct_get(controller.settings, "sfx_enabled");
var music_enabled = variable_struct_get(controller.settings, "music_enabled");

// --- Check contact with each other ball ---
for (var i = 0; i < array_length(all_balls); i++) {
    var other_ball = all_balls[i];

    // Get or initialize collision state
    var state = CollisionState.NONE;
    if (ds_map_exists(ball_collision_state_map, other_ball)) {
        state = ball_collision_state_map[? other_ball];
    }

    // Handle contact state
    if (are_balls_touching(id, other_ball)) {
        if (state != CollisionState.STAY) {
            // Avoid overlapping sound playback
            if (sfx_enabled && !audio_is_playing(short_click_6)) {
                audio_play_sound(short_click_6, 1, false);
            }
            ds_map_set(ball_collision_state_map, other_ball, CollisionState.STAY);
        }
    } else {
        if (state != CollisionState.NONE) {
            ds_map_set(ball_collision_state_map, other_ball, CollisionState.NONE);
        }
    }
}
