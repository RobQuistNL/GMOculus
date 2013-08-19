// Reset the surfaces (e.g. after the resolution has changed)

if (surface_exists(global._GMO_SURFACE[SURF_RIGHT])) {
    surface_free(global._GMO_SURFACE[SURF_RIGHT]);
}
if (surface_exists(global._GMO_SURFACE[SURF_LEFT])) {
    surface_free(global._GMO_SURFACE[SURF_LEFT]);
}
if (surface_exists(global._GMO_SURFACE[SURF_REGULAR])) {
    surface_free(global._GMO_SURFACE[SURF_REGULAR]);
}

GMO_initSurfaces();
