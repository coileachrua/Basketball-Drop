cols = 4;
rows = 4;
spacing = 8; // vertical spacing between rows

if (!variable_instance_exists(id, "anchor_a_x")) anchor_a_x = x - (cols - 1) * spacing * 0.5;
if (!variable_instance_exists(id, "anchor_a_y")) anchor_a_y = y;
if (!variable_instance_exists(id, "anchor_b_x")) anchor_b_x = x + (cols - 1) * spacing * 0.5;
if (!variable_instance_exists(id, "anchor_b_y")) anchor_b_y = y;

nodes = array_create(cols * rows, noone);
built = false;
