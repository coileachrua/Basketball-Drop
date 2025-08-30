cols = 4;
rows = 4;
spacing = 8;
nodes = array_create(cols * rows, noone);

for (var j = 0; j < rows; j++) {
    for (var i = 0; i < cols; i++) {
        var nx = x + (i - (cols - 1) * 0.5) * spacing;
        var ny = y + j * spacing;
        var node = instance_create_layer(nx, ny, layer, obj_net_node);
        node.pinned = (j == 0);
        if (node.pinned) {
            with (node) phy_kinematic = true;
        }
        var idx = j * cols + i;
        nodes[idx] = node;
        if (i > 0) {
            var left = nodes[idx - 1];
            if (instance_exists(left)) physics_joint_distance_create(node, left, node.x, node.y, left.x, left.y, spacing);
        }
        if (j > 0) {
            var above = nodes[idx - cols];
            if (instance_exists(above)) physics_joint_distance_create(node, above, node.x, node.y, above.x, above.y, spacing);
        }
    }
}
