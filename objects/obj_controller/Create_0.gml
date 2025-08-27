
// 0) Persist between rooms
persistent = true;

// ————————————————
// 1) Single‐Instance Guard
// ————————————————
if (!variable_global_exists("controller")) {
    // First controller: register it
    global.controller = id;
} else {
    // A controller already exists: destroy this duplicate
    if (instance_exists(global.controller) && global.controller != id) {
        instance_destroy();
        exit;  // stop running this event on the duplicate
    }
}

// ————————————————
// 2) Filename & Load Save
// ————————————————
filename    = "slot1.json";
loaded_data = load_game(filename);
global.loaded_data = loaded_data;
global.save_filename = filename;

// Mapping of rooms to their par values
par_values = {
    rm_1: 3
};

// Initialise score tracking globals
global.current_par   = 0;
global.strokes       = 0;
global.running_total = 0;
global.hole_scores   = [];
global.classification = "";

// ————————————————
// 3) Initialize Runtime Settings
// ————————————————
settings = {
    sfx_enabled:   (is_struct(loaded_data) && variable_struct_exists(loaded_data, "sfx_enabled")) ? loaded_data.sfx_enabled   : true,
    music_enabled: (is_struct(loaded_data) && variable_struct_exists(loaded_data, "music_enabled")) ? loaded_data.music_enabled : true
};

// ————————————————
// 4) Autosave Timer
// ————————————————
autosave_timer = 0;

// Flag controlling whether balls can be spawned
global.can_spawn_ball = false;
// Frames to wait after enabling before spawning is allowed
global.spawn_ball_cooldown = 0;

// Height of the valid spawn zone (top section of the screen)
global.spawn_zone_height = 0;

// Pulse timer used for the glowing spawn zone indicator
spawn_zone_pulse = 0;

// Track the current room to detect transitions
last_room = room;

