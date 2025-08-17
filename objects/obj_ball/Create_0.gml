sprite_index = spr_circle;
interval_ms = 250 * 100; 


// Time and state tracking for floor
time_floor = 0;
collision_state_floor = CollisionState.NONE;

// Time and state tracking for pin
time_pin = 0;
collision_state_pin = CollisionState.NONE;

ball_collision_state_map = ds_map_create(); // key = other ID, value = state

var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, sprite_width / 2);
physics_fixture_set_density(fixture, 0.1);
physics_fixture_set_restitution(fixture, 0.9);
physics_fixture_set_angular_damping(fixture, 0.1);
physics_fixture_set_linear_damping(fixture, 0.1);
physics_fixture_set_friction(fixture, 0.5);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);
