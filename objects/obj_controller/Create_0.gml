
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
    rm_1: 2,
    rm_2: 4,
	rm_3: 3
};

// Mapping of rooms to their spawn zone extents (normalised 0-1)
// zone extends from x = 0.5 to 1 (right half) and y = 0 to 0.25 (top quarter).
spawn_zones = {
    rm_1: { x1: 0, y1: 0, x2: 1,   y2: 0.125 }, // top eighth of screen
    rm_2: { x1: 0, y1: 0, x2: 0.5, y2: 0.25  },  // top-left quarter
    rm_3: { x1: 0.5, y1: 0, x2: 1,   y2: 0.25  }  // top-right quarter

};

// Initialise score tracking globals
global.current_par   = 0;
global.strokes       = 0;
global.running_total = 0;
global.hole_scores   = [];
global.par_total     = 0;
global.classification = "";
global.hole_pars     = [];
global.next_room     = -1;

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

// Boundaries of the valid spawn zone
global.spawn_zone_left   = 0;
global.spawn_zone_top    = 0;
global.spawn_zone_right  = 0;
global.spawn_zone_bottom = 0;

// Pulse timer used for the glowing spawn zone indicator
spawn_zone_pulse = 0;

// Track the current room to detect transitions
last_room = room;


// List every Sound asset name GameMaker knows about
global.bounce_snds = [ bounce_1, bounce_2, bounce_3, bounce_4 ];
global.swish_snds  = [ swish_1 ];

// Debug flag to toggle drawing of autosave and audio settings
show_debug_info = false;
