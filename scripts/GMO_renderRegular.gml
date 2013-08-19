//Draw all the 3D instances
surface_set_target(GMO_getSurface(SURF_REGULAR));
    draw_clear_alpha(c_black,0);
    d3d_set_lighting(true);
    d3d_set_projection_simple(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
    GMO_draw3DInstances(); // Take a look at this function.
//Reset some settings, just in case
surface_reset_target();
d3d_transform_set_identity();
d3d_set_lighting(false);
draw_set_alpha(1);
d3d_set_projection_ortho(0,0,window_get_width(),window_get_height(),0);
