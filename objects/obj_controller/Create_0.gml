
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


