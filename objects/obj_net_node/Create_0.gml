var fixture = physics_fixture_create();
physics_fixture_set_circle_shape(fixture, 2);
physics_fixture_set_density(fixture, 0.01);
physics_fixture_set_restitution(fixture, 0);
physics_fixture_set_friction(fixture, 0.2);
physics_fixture_set_linear_damping(fixture, 0.1);
physics_fixture_set_angular_damping(fixture, 0.1);
physics_fixture_set_sensor(fixture, true);
physics_fixture_bind(fixture, id);
physics_fixture_delete(fixture);

image_alpha = 0;
start_x = x;
start_y = y;
