file = argument0
alpha = argument1

if (!file_exists(working_directory + "\gfx\textures\"+string(file))) {
    show_message("Texture '"+string(file)+"' not found! Using default test texture.");
    return background_get_texture(tex_test);
}

back = background_add(working_directory + "\gfx\textures\"+string(file),argument1,argument1);
if (argument1) {
    aback = background_add(working_directory + "\gfx\textures\"+string(file),argument1,argument1);
    background_set_alpha_from_background(back,aback);
}
tex = background_get_texture(back);
return tex;
