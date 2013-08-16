//top-down
d3d_light_define_direction(2,0,0,1,c_dkgray)

d3d_light_define_direction(3,1,0,0,make_color_rgb(207,198,75))
d3d_light_define_direction(4,-1,0,0,make_color_rgb(49,46,73))
d3d_light_define_direction(5,0,1,0,make_color_rgb(170,136,72))
d3d_light_define_direction(6,0,-1,0,make_color_rgb(54,40,77))

//sunlight
d3d_light_enable(2,true)
d3d_light_enable(3,true)
d3d_light_enable(4,true)
d3d_light_enable(5,true)
d3d_light_enable(6,true)
