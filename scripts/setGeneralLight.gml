/// Just a little script to save a lot of code. This is for the lightning from obj_sky

global._defaultr = 30
global._defaultg = 20
global._defaultb = 50

global._increaseday = 170

add = argument0
global._GENERALLIGHT_ADD = add

rrr = global._defaultr+(global._increaseday*add);
ggg = global._defaultg+(global._increaseday*add);
bbb = global._defaultb+(global._increaseday*add);

d3d_light_define_direction(light1,xdir1,ydir1,zdir1,make_color_rgb(rrr+10,ggg+10,bbb+10))
d3d_light_define_direction(light2,xdir2,ydir2,zdir2,make_color_rgb(rrr-10,ggg-10,bbb-10))
d3d_light_define_ambient(make_color_rgb(rrr,ggg,bbb));
