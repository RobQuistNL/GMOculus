//Arg0 = the depth of the barrel
//arg1 = the radius in pixels

lenss = argument0
lensr = argument1
//Create the lens surface
lenssurface=surface_create(lensr*2,lensr*2)
surface_set_target(lenssurface)
draw_clear_alpha(c_white,0)
surface_reset_target()

//Creating the lens model, don't worry about this.
q=pi/20
xtex=texture_get_width(surface_get_texture(lenssurface))
ytex=texture_get_height(surface_get_texture(lenssurface))

lens=d3d_model_create()
for (d1=0;d1<2*pi;d1+=q)
{
    d3d_model_primitive_begin(lens,pr_trianglestrip)
    for (d2=0;d2<=pi/2;d2+=q)
    {
        s=sin(d2*lenss)/max(sin(pi/2*lenss),0.0001)
        d3d_model_vertex_texture(lens,
            lensr*cos(d1)*s,
            lensr*sin(d1)*s,
            0,xtex*(0.5+cos(d1)*d2/pi),ytex*(0.5+sin(d1)*d2/pi))
        d3d_model_vertex_texture(lens,
            lensr*cos(d1+q)*s,
            lensr*sin(d1+q)*s,
            0,xtex*(0.5+cos(d1+q)*d2/pi),ytex*(0.5+sin(d1+q)*d2/pi))
    }
    
    d3d_model_primitive_end(lens)
}
