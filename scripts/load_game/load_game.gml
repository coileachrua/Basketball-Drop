function load_game(_filename) {
    show_debug_message("START_LOAD_DATA");

    var path = "saves/" + _filename;

    if (file_exists(path)) {
        var file = file_text_open_read(path);
        var raw = file_text_read_string(file);
        file_text_close(file);

        var sep = string_pos("|", raw);
        if (sep == 0) {
            show_debug_message("Invalid save format (missing |).");
            return undefined;
        }

        var header = string_copy(raw, 1, sep - 1);
        show_debug_message(header);
        var encoded = string_copy(raw, sep + 1, string_length(raw));
        show_debug_message(encoded);
        var json = xor_decrypt_from_base64(encoded, SAVE_KEY);
        show_debug_message("Decrypted JSON: " + json);

        var data;
        try {
            data = json_parse(json);
        } catch (err) {
            show_debug_message("ERROR: Failed to parse JSON.");
            return undefined;
        }

        var original_version = data.version;
        var upgraded_data = upgrade_save(data);

        if (upgraded_data.version != original_version) {
            show_debug_message("[Save Upgrade] Version updated from " + string(original_version) + " to " + string(upgraded_data.version));
            save_game(_filename, upgraded_data);
        }

        show_debug_message("END_LOAD_DATA");
        return upgraded_data;
    }

    // No file — create new save
    show_debug_message("Creating a new save file");

    var new_data = {
        version: SAVE_VERSION,
        sfx_enabled: true,
		music_enabled: true
    };

    save_game(_filename, new_data);
    show_debug_message("END_LOAD_DATA");
    return new_data;
}
