//Draws the HUD contents to the individual eye surfaces

if (!enablehud) exit;


d3d_set_hidden(0);
d3d_set_lighting(0);

surface_set_target(GMO_getSurface(SURF_HUD));
    draw_clear_alpha(c_white,0);
    GMO_hudContent();
surface_reset_target();

surface_set_target(GMO_getSurface(SURF_RIGHT));
    draw_surface_ext(GMO_getSurface(SURF_HUD), 2-global._GMO_HUD_DEPTH, 0, 1, 1, 0, c_white, 1);
surface_reset_target();

surface_set_target(GMO_getSurface(SURF_LEFT));
    draw_surface_ext(GMO_getSurface(SURF_HUD), 2+global._GMO_HUD_DEPTH, 0, 1, 1, 0, c_white, 1);
surface_reset_target();

d3d_set_hidden(1);
d3d_set_lighting(1);
