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

    global.oc_GetX = external_define(dllfile, 'getX', dll_cdecl, ty_real, 0); // Real
    global.oc_GetY = external_define(dllfile, 'getY', dll_cdecl, ty_real, 0); // Real
    global.oc_GetZ = external_define(dllfile, 'getZ', dll_cdecl, ty_real, 0); // Real    
    
    //DK2 (New DLL) functions;
    global.oc_getVersion = external_define(dllfile, 'getVersion', dll_cdecl, ty_real, 0);
    global.oc_getHMDName = external_define(dllfile, 'getHMDName', dll_cdecl, ty_string, 0);
    global.oc_linkWindowHandle = external_define(dllfile, "linkWindowHandle", dll_cdecl, ty_real, 1, ty_string);  

    global.oc_moveWindow = external_define(dllfile, "moveWindow", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real);
    global.oc_enableTextureFiltering = external_define(dllfile, "enableTextureFiltering", dll_cdecl, ty_real, 1, ty_real);      
    
    global.oc_beginFrame = external_define(dllfile, 'beginFrame', dll_cdecl, ty_real, 0);
    global.oc_endFrame = external_define(dllfile, 'endFrame', dll_cdecl, ty_real, 0);
    global.oc_getEyePos = external_define(dllfile, 'getEyePos', dll_cdecl, ty_real, 1, ty_real);
    
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

global._GMO_DEVICE_NAME = OVR_getHMDName();
global._GMO_DLL_VERSION = OVR_getVersion();
show_debug_message('Found device: ' + string(global._GMO_DEVICE_NAME) + ' - DLL Version:' + string(global._GMO_DLL_VERSION));

return initDevice;
