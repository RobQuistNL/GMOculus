/// Set surface resolution
// Default 1920x1080
// arg0 int   width in pixels
// arg1 int   height in pixels
global._GMO_WRES = argument0;
global._GMO_HRES = argument1;

//Also reset the surfaces
GMO_resetSurfaces();
