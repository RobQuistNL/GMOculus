file = argument0
alpha = argument1

back = background_add(working_directory + "\gfx\"+string(file),0,0);
alphaback =  background_add(working_directory + "\gfx\"+string(alpha),0,0);
background_set_alpha_from_background(back,alphaback);

return background_get_texture(back);
