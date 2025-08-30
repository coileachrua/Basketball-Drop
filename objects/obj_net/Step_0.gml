if (built) exit;

var dx = anchor_b_x - anchor_a_x;
var dy = anchor_b_y - anchor_a_y;
var h_spacing = point_distance(anchor_a_x, anchor_a_y, anchor_b_x, anchor_b_y) / max(cols - 1, 1);

for (var j = 0; j < rows; j++) {
    for (var i = 0; i < cols; i++) {
        var t = (cols > 1) ? i / (cols - 1) : 0;
        var base_x = anchor_a_x + dx * t;
        var base_y = anchor_a_y + dy * t;
        var nx = base_x;
        var ny = base_y + j * spacing;
        var node = instance_create_layer(nx, ny, layer, obj_net_node);
        node.pinned = (j == 0);
        var idx = j * cols + i;
        nodes[idx] = node;
        if (i > 0) {
            var left = nodes[idx - 1];
            if (instance_exists(left)) physics_joint_distance_create(node, left, node.x, node.y, left.x, left.y, h_spacing);
        }
        if (j > 0) {
            var above = nodes[idx - cols];
            if (instance_exists(above)) physics_joint_distance_create(node, above, node.x, node.y, above.x, above.y, spacing);
        }
    }
}

built = true;
