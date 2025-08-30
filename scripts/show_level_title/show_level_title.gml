function show_level_title(_title) {
    var inst = instance_create_layer(0, 0, "Instances", obj_level_title);
    inst.title = _title;
    return inst;
}
