var x1 = x;
var y1 = y;
var x2_local = x + 100;
var y2_local = y;
var segs = 8;

if (variable_instance_exists(id, "x2")) x2_local = x2;
if (variable_instance_exists(id, "y2")) y2_local = y2;
if (variable_instance_exists(id, "segments")) segs = segments;

create_rope(x1, y1, x2_local, y2_local, segs);
instance_destroy();
