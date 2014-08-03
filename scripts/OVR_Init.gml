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
    global._GMO_DLL_LOADED = true;
}

initDevice = OVR_Device_init();
switch (initDevice) {
       case 0:
            show_debug_message('No oculus device found');
            break;
       case 1:
            show_debug_message('Oculus device found and working!');
            break;
       case 2:
            show_debug_message('Oculus device found but display disabled');
            break;
}

return initDevice;
