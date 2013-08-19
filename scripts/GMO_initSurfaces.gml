// Create a surface for the left and right eye, half the width resolution each.
global._GMO_SURFACE[SURF_RIGHT]=surface_create(GMO_getResolutionWidth()/2,GMO_getResolutionHeight());
global._GMO_SURFACE[SURF_LEFT]=surface_create(GMO_getResolutionWidth()/2,GMO_getResolutionHeight());

// The regular surface holds the single-eyed camera, or a morphed version of the 2 cameras.
// Basically makes it easier to handle.
global._GMO_SURFACE[SURF_REGULAR]=surface_create(GMO_getResolutionWidth(),GMO_getResolutionHeight());
