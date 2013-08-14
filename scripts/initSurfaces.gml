/** 
 * Square surfaces work better, as told by the GM documentation
 * But i believe that the d3d drawing functions draw everything on the size of the surface.
 * And if we'd draw the 3D on 2048x2048 and then draw the surface on a 1920x1080 screen, you'd get to see
 * only half of the game, which we don't want. Thats why the FullHD resolution is set here.
 */
global.SURFACE[SURF_REGULAR] = surface_create(1920,1080); 

// These 2 will get stuffed together to fit in half the resolution, lateron.
global.SURFACE[SURF_LEFT]  = surface_create(1920,1080); 
global.SURFACE[SURF_RIGHT] = surface_create(1920,1080); 
