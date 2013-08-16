d3d_start();

display_reset(8,true) // Antialias 8x, Vertical Sync enabled
d3d_set_culling(false); 
d3d_set_hidden(true);
d3d_set_shading(true);
d3d_set_lighting(true);

draw_set_alpha_test(true);
draw_enable_alphablend(true);
draw_set_alpha_test_ref_value(128);
draw_set_color(c_white);

//Some niceties
d3d_light_define_ambient(c_dkgray)
texture_set_blending(true);
