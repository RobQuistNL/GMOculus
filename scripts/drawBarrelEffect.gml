/*

argument0 = x

argument1 = y

argument2 = the background used for the texture.

argument3 = radius of the wave

argument4 = width of the wave

argument5 = the textures offset - the lower this is, the more invisible is the wave will look.

argument6 = the number of pieces, that the wave should be drawed in.
The higer you set argument6, the smoother the circle will be, but the game might also run slower.

argument7 = the surface to use
*/

//sets the variabres, R (radius) and W (width of the wave)

r=argument3
w=argument4
o=argument5

//sets the variable A (angle). The wave is drawed in many pieces, and this variable counts what piece comes next.

a=0

//sets the variable D (degrees). This indicate how many degrees of the circle, one piece should be.

d=360/argument6

//set some drawing-variables

back=argument2
draw_set_color(c_white)
tex=surface_get_texture(argument7)
tex_w=texture_get_width(tex)
tex_h=texture_get_height(tex)
back_w=surface_get_width(argument7)//+view_xview
back_h=surface_get_height(argument7)//+view_yview
//...and start drawing the wave

draw_primitive_begin_texture(pr_trianglestrip,tex)

//this part, will draw trapez's, together so they form a ring.
//It's to complicated to explain, but you sould try take a look at i yourself!

repeat(argument6+1)
{
xx=argument0+lengthdir_x(r,a*d)
yy=argument1+lengthdir_y(r,a*d)

draw_vertex_texture
    (xx,
    yy,
    tex_w/back_w*(xx+lengthdir_x(o,a*d)),
    tex_h/back_h*(yy+lengthdir_y(o,a*d)))

xx=argument0+lengthdir_x(r-w,a*d)
yy=argument1+lengthdir_y(r-w,a*d)

draw_vertex_texture
    (xx,
    yy,
    tex_w/back_w*(xx),
    tex_h/back_h*(yy))

a+=1
/*
xx=argument0+lengthdir_x(r,a*d)
yy=argument1+lengthdir_y(r,a*d)

draw_vertex_texture
    (xx,
    yy,
    tex_w/back_w*(xx+lengthdir_x(o,a*d)),
    tex_h/back_h*(yy+lengthdir_y(o,a*d)))
    
xx=argument0+lengthdir_x(r-w,a*d)
yy=argument1+lengthdir_y(r-w,a*d)

draw_vertex_texture
    (xx,
    yy,
    tex_w/back_w*(xx),
    tex_h/back_h*(yy))*/
}
draw_primitive_end()
