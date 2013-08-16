l = getLightId();
d3d_light_define_direction(l,0,0,1,c_dkgray)
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,1,0,0,make_color_rgb(207,198,75))
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,-1,0,0,make_color_rgb(49,46,73))
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,0,1,0,make_color_rgb(170,136,72))
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,0,-1,0,make_color_rgb(54,40,77))
d3d_light_enable(l,true)
