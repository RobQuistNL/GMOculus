/// Set our camera mode. 1 = regular (1 cam), 2 = oculus
// Default 1
// arg0 integer

if (argument0 == 2) {
   show_debug_message('Linking window handle');
   link = OVR_linkWindowHandle();
   show_debug_message("Receive:" + string(link));
}

if (argument0 == 2 && global._GMO_DLL_LOADED == false) {
    show_message("Oculus mode not supported! The Oculus has not been initialized.");
} else {
    global._GMO_CAMERA_MODE = argument0;
}
