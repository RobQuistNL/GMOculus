file = argument0
alpha = argument1

if (!file_exists(working_directory + "\gfx\effects\"+string(file))) {
    show_message("Texture '"+string(file)+"' not found! Using default test texture.");
    return background_get_texture(tex_test);
}

back = background_add(working_directory + "\gfx\effects\"+string(file),0,0);
alphaback =  background_add(working_directory + "\gfx\effects\"+string(alpha),0,0);
background_set_alpha_from_background(back,alphaback);

return background_get_texture(back);
