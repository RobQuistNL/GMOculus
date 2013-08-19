d3d_start();

display_reset(CAM_ANTIALIAS,CAM_VSYNC);
d3d_set_culling(false); 
d3d_set_hidden(true);
d3d_set_shading(true);
d3d_set_lighting(true);
enable_zbuffer();

draw_set_alpha_test_ref_value(20);
draw_enable_alphablend(true);
texture_set_interpolation(true);
texture_set_blending(true);

// ==== Use this code when d3d_set_zwriteenable is true.

// ==== Comment it out when you want our own drawing order code.


//Some niceties
d3d_light_define_ambient(c_dkgray)

