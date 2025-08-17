function delete_game(_filename){
	
	show_debug_message("START_DELETE_DATA")
	
    var path = "saves/" + _filename;

    if (file_exists(path)) {
        file_delete(path);
        show_debug_message("Save file deleted: " + path);

        // Optionally reset in-memory data
        loaded_data = {
            version: SAVE_VERSION,
            name: "Nigel",
            health: 100,
            coins: 50,
            inventory: []
        };
    } else {
        show_debug_message("No save file found to delete.");
    }
	
	show_debug_message("END_DELETE_DATA")
}

