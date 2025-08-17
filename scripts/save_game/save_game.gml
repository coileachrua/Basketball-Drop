function save_game(_filename, _data) {
    show_debug_message("START_SAVE_DATA");

    _data.version = SAVE_VERSION;
    var json = json_stringify(_data);
    show_debug_message("Raw JSON: " + json);

    var encrypted = xor_encrypt_to_base64(json, SAVE_KEY);
    var final_text = "SAVEV" + string(SAVE_VERSION) + "|" + encrypted;

    var path = "saves/" + _filename;
    if (!directory_exists("saves")) {
        show_debug_message("Directory does not exist. Creating.");
        directory_create("saves");
    }

    var file = file_text_open_write(path);
    file_text_write_string(file, final_text);
    file_text_close(file);

    show_debug_message("Encrypted + Encoded: " + final_text);
    show_debug_message("END_SAVE_DATA");
}
