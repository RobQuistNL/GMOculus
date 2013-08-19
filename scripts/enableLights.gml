add = global._GENERALLIGHT_ADD;
rrr = global._defaultr+(global._increaseday*add);
ggg = global._defaultg+(global._increaseday*add);
bbb = global._defaultb+(global._increaseday*add);
d3d_light_define_ambient(make_color_rgb(rrr,ggg,bbb));
