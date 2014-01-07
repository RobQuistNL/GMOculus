draw_clear(c_black); //Clear the display

// Now draw our main surface to the screen.

if (GMO_getCameraMode() == CAM_MODE_OCULUS) {
    //Somehow this one is upside down.
    draw_surface_ext(GMO_getCameraSurface(), 0, GMO_getResolutionHeight(), 1, -1,0,c_white,1);
} else {
    draw_surface_stretched(GMO_getCameraSurface(), 0, 0, GMO_getResolutionWidth(), GMO_getResolutionHeight());
}
