/// obj_toggle_button – Create Event
// Ensure toggle_key and label are set via Instance Variables, otherwise default them:
if (!variable_instance_exists(id, "label"))      label      = "Toggle";
if (!variable_instance_exists(id, "toggle_key")) toggle_key = "sfx_enabled";

// Visual defaults
hover      = false;
width      = 200;
height     = 48;
bg_on      = c_lime;
bg_off     = c_red;
text_color = c_white;
