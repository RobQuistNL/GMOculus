file = argument0

if (!file_exists(working_directory + "\gfx\effects\"+string(file))) {
    show_message("Texture '"+string(file)+"' not found! Using default test texture.");
    return background_get_texture(tex_test);
}

back = background_add(working_directory + "\gfx\effects\"+string(file),0,0);
tex = background_get_texture(back);
return tex;
