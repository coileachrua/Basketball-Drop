function create_rope(x1, y1, x2, y2, segments) {
    if (segments <= 0) return;

    var pinA = instance_create_layer(x1, y1, "Instances", obj_pin);
    var pinB = instance_create_layer(x2, y2, "Instances", obj_pin);

    var prev = pinA;
    var dx = (x2 - x1) / segments;
    var dy = (y2 - y1) / segments;

    for (var i = 1; i < segments; i++) {
        var sx = x1 + dx * i;
        var sy = y1 + dy * i;
        var seg = instance_create_layer(sx, sy, "Instances", obj_rope_segment);
        physics_joint_distance_create(prev, seg, prev.x, prev.y, seg.x, seg.y, false);
        prev = seg;
    }

    physics_joint_distance_create(prev, pinB, prev.x, prev.y, pinB.x, pinB.y, false);
}
