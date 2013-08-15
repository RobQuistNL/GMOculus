globalvar dllfile;
dllfile = working_directory+'\RiftSharpDll.dll';

global.oc_Initialize = external_define(dllfile, 'Initialize', dll_cdecl, ty_real, 0); // Bool

global.oc_Destroy = external_define(dllfile, 'Uninitialize', dll_cdecl, ty_real, 0); // Bool

global.oc_GetYaw = external_define(dllfile, 'GetYaw', dll_cdecl, ty_real, 0); // Real

global.oc_GetPitch = external_define(dllfile, 'GetPitch', dll_cdecl, ty_real, 0); // Real

global.oc_GetRoll = external_define(dllfile, 'GetRoll', dll_cdecl, ty_real, 0); // Real

//global.oc_IsSensorPresent = external_define(dllfile, 'OVR_IsSensorPresent', dll_cdecl, ty_real, 1, ty_real); // returns true/false on ID check

globalvar init;
init=OVR_Device_init();

if init=false{
show_message("Oculus Rift Device not connected. Shutting down.");
game_end();
}

/*
show_message("OVR_IsSensorPresent(0):" + string(OVR_IsSensorPresent(0)));
show_message("OVR_IsSensorPresent(1):" + string(OVR_IsSensorPresent(1)));
show_message("OVR_IsSensorPresent(2):" + string(OVR_IsSensorPresent(2)));
