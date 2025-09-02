// Initialize movement parameters and position
if (!variable_instance_exists(id, "start_x")) start_x = x;
if (!variable_instance_exists(id, "start_y")) start_y = y;
if (!variable_instance_exists(id, "end_x")) end_x = x;
if (!variable_instance_exists(id, "end_y")) end_y = y;
if (!variable_instance_exists(id, "speed")) speed = 2;
dir = 1;
phy_position_x = start_x;
phy_position_y = start_y;
