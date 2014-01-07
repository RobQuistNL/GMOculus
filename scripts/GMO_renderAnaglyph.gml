/*
Please not that this doesn't work well. Its a start. And its sad. But before you fix this, first try to make a good, 3D-to-surface rendering method.
If that works good we can look at this.
*/

glassColor = argument10 //Can be;
//red-blue
//red-green
//red-cyan

// Calculate positions
r = GMO_getIPD()/2
//hdir = argument3+90;
//vdir = argument5;

xadd = r*cos(degtorad(hdir))*cos(degtorad(vdir));
yadd = r*sin(degtorad(hdir))*cos(degtorad(vdir));


surface_set_target(GMO_getSurface(SURF_REG_LEFT));
    draw_clear_alpha(c_black,0);
    d3d_set_lighting(true);
    d3d_set_projection_simple(argument0+xadd,argument1+yadd,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
    GMO_draw3DInstances(); // Take a look at this function.
    d3d_transform_set_identity();
//Reset some settings, just in case
surface_reset_target();


surface_set_target(GMO_getSurface(SURF_REG_RIGHT));
    draw_clear_alpha(c_black,0);
    d3d_set_lighting(true);
    d3d_set_projection_simple(argument0-xadd,argument1-yadd,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
    GMO_draw3DInstances(); // Take a look at this function.
    d3d_transform_set_identity();
//Reset some settings, just in case
surface_reset_target();
    
//Draw both surfaces on the regular surface
surface_set_target(GMO_getSurface(SURF_REGULAR));
draw_clear(c_white);
    w = GMO_getResolutionWidth()
    h = GMO_getResolutionHeight()

    // Make textures from the surfaces
    surfaceLeft = GMO_getSurface(SURF_REG_LEFT);
    surfaceRight = GMO_getSurface(SURF_REG_RIGHT);

    // Apply shader
    shader_set(GMO_colorFilter_shader);
        shader_set_uniform_f(global._GMO_anaglyph_channel_mask, 1,0,0,1);  //Only red
        draw_surface_ext(surfaceLeft,0,h,1,-1,0,c_white,0.5);
        
        switch (glassColor) { //The right eye colour may differ.
            case 'red-green':
                shader_set_uniform_f(global._GMO_anaglyph_channel_mask, 0,1,0,1);  //Only green
                break;
            case 'red-blue':
                shader_set_uniform_f(global._GMO_anaglyph_channel_mask, 0,0,1,1);  //Only blue
                break;
            case 'red-cyan':
            default:
                shader_set_uniform_f(global._GMO_anaglyph_channel_mask, 0,1,1,1);  //Only cyan
                break;
        }
        draw_surface_ext(surfaceRight,0,h,1,-1,0,c_white,0.5);
    shader_reset();

//Reset some settings, just in case
surface_reset_target();
d3d_transform_set_identity();
d3d_set_lighting(false);
draw_set_alpha(1);
d3d_set_projection_ortho(0,0,window_get_width(),window_get_height(),0);
