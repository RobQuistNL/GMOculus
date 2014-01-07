/// This is a very important part of our code.
// This piece renders the right camera to the right surface.
// arg0 = xfrom
// arg1 = yfrom
// arg2 = zfrom
// arg3 = yaw
// arg4 = pitch
// arg5 = roll
// arg6 = angle
// arg7 = aspect
// arg8 = znear
// arg9 = zfar

// Extra check because of bug
if (!surface_exists(GMO_getSurface(SURF_REGULAR))) {
    show_debug_message("Surface does not exist. Re-initializing surfaces.");
    GMO_initSurfaces();
}

if (GMO_getCameraMode() == CAM_MODE_REGULAR) { //Regular
    GMO_renderRegular(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
} else if (GMO_getCameraMode() == CAM_MODE_OCULUS) { //Oculus
    GMO_renderOculus(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
} else if (GMO_getCameraMode() == CAM_MODE_ANA_R_C) { //Anaglyph-red-cyan
    GMO_renderAnaglyph(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9, 'red-cyan');
} else if (GMO_getCameraMode() == CAM_MODE_ANA_R_G) { //Anaglyph-red-green
    GMO_renderAnaglyph(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9, 'red-green');
} else if (GMO_getCameraMode() == CAM_MODE_ANA_R_B) { //Anaglyph-red-blue
    GMO_renderAnaglyph(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9, 'red-blue');
}
    

// Check if we are using 3D audio
if (GMO_getUse3DSound()) {
    //We do!
    GMO_updateListener(argument0, argument1, argument2,argument3,argument5); 
}
