var net = instance_create_layer(x, y, layer, obj_net);
with (net) {
    anchor_a_x = other.x - other.sprite_width * 0.5;
    anchor_a_y = other.y;
    anchor_b_x = other.x + other.sprite_width * 0.5;
    anchor_b_y = other.y;
}
