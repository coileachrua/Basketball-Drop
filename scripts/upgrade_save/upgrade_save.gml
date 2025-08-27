function upgrade_save(_data) {
    show_debug_message("START_UPGRADE_DATA");

    switch (_data.version) {
        case 1:
            show_debug_message("[Save Upgrade] Upgrading from v1 to v2");

            if (!variable_struct_exists(_data, "inventory")) {
                show_debug_message("[Save Upgrade] Added missing 'inventory' field");
                _data.inventory = [];
            } else {
                show_debug_message("[Save Upgrade] 'inventory' field already exists; preserving data");
            }

            _data.version = 2;
            // fallthrough to apply further upgrades
        case 2:
            show_debug_message("[Save Upgrade] Upgrading from v2 to v3");
            if (!variable_struct_exists(_data, "sfx_enabled")) {
                _data.sfx_enabled = true;
            }
            if (!variable_struct_exists(_data, "music_enabled")) {
                _data.music_enabled = true;
            }
            if (!variable_struct_exists(_data, "attempts")) {
                _data.attempts = [];
            }
            _data.version = 3;
            break;
        default:
            if (!variable_struct_exists(_data, "attempts")) {
                _data.attempts = [];
            }
            show_debug_message("[Save Upgrade] No upgrade needed for version " + string(_data.version));
            break;
    }

    show_debug_message(_data);
    show_debug_message("END_UPGRADE_DATA");
    return _data;
}
