//Draws the HUD contents to the individual eye surfaces

if (!enablehud) exit;


d3d_set_hidden(0);
d3d_set_lighting(0);

surface_set_target(GMO_getSurface(SURF_HUD));
    draw_clear_alpha(c_white,0);
    GMO_hudContent();
surface_reset_target();

hud_sprite = sprite_create_from_surface(GMO_getSurface(SURF_HUD),0,0,960,1080,0,0,960/2,1080/2);

surface_set_target(GMO_getSurface(SURF_RIGHT));
    draw_sprite_ext(hud_sprite,0,960/2-global._GMO_HUD_DEPTH,1080/2,1,1,0,c_white,1);
surface_reset_target();

surface_set_target(GMO_getSurface(SURF_LEFT));
    draw_sprite_ext(hud_sprite,0,960/2+global._GMO_HUD_DEPTH,1080/2,1,1,0,c_white,1);
surface_reset_target();

d3d_set_hidden(1);
d3d_set_lighting(1);
sprite_delete(hud_sprite);

