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

if (GMO_getCameraMode() == 1) { //Regular
    GMO_renderRegular(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
} else if (GMO_getCameraMode() == 2) { //Oculus
    GMO_renderOculus(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9);
}
    

// Check if we are using 3D audio
if (GMO_getUse3DSound()) {
    //We do!
    GMO_updateListener(argument0, argument1, argument2,argument3,argument5); 
}
