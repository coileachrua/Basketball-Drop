draw_set_color(c_white);
for (var j = 0; j < rows; j++) {
    for (var i = 0; i < cols; i++) {
        var idx = j * cols + i;
        var node = nodes[idx];
        if (!instance_exists(node)) continue;
        if (i < cols - 1) {
            var right = nodes[idx + 1];
            if (instance_exists(right)) draw_line(node.x, node.y, right.x, right.y);
        }
        if (j < rows - 1) {
            var below = nodes[idx + cols];
            if (instance_exists(below)) draw_line(node.x, node.y, below.x, below.y);
        }
    }
}
