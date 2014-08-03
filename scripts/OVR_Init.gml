show_debug_message("Initializing Oculus Rift DLL...");

if (global._GMO_DLL_LOADED == false) {

    dllfile = working_directory+'\'+string(global._GMO_DLL_FILENAME);
    
    if (!file_exists(dllfile)) {
        show_debug_message("The Oculus Rift DLL could not be located at '"+string(dllfile)+"'");
        show_message(dllfile + " not found! Oculus support disabled.");
        return false;
    }
    
    global.oc_Initialize = external_define(dllfile, 'initialize', dll_cdecl, ty_real, 0); // Bool
    global.oc_Destroy = external_define(dllfile, 'uninitialize', dll_cdecl, ty_real, 0); // Bool

    global.oc_GetYaw = external_define(dllfile, 'getYaw', dll_cdecl, ty_real, 0); // Real
    global.oc_GetPitch = external_define(dllfile, 'getPitch', dll_cdecl, ty_real, 0); // Real
    global.oc_GetRoll = external_define(dllfile, 'getRoll', dll_cdecl, ty_real, 0); // Real

    if (OVR_Device_init() == false) {
        show_debug_message("Oculus Rift Device not found.");
        show_message("Oculus Rift Device not found.");
        return false;
    } else {
        show_debug_message("Oculus Rift DLL loaded and initialized!");
        global._GMO_DLL_LOADED = true;
        return true;
    }
} else {
    show_debug_message("The Oculus Rift DLL is already loaded and initialized.");
    return true;
}

