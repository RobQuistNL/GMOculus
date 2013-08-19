l = getLightId();
d3d_light_define_direction(l,0,0,1,c_dkgray)
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,1,0,0,make_color_rgb(207/4,198/4,75))
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,-1,0,0,make_color_rgb(49/4,46/4,73))
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,0,1,0,make_color_rgb(170/4,136/4,72))
d3d_light_enable(l,true)

l = getLightId();
d3d_light_define_direction(l,0,-1,0,make_color_rgb(54/4,40/4,77))
d3d_light_enable(l,true)

