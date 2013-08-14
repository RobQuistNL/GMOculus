dllfile = 'OculusPlugin.dll'

global.oc_Initialize = external_define(dllfile, 'OVR_Initialize', dll_cdecl, ty_string, 0); // Bool
global.oc_Destroy = external_define(dllfile, 'OVR_Destroy', dll_cdecl, ty_string, 0); // Bool

global.oc_GetSensorCount = external_define(dllfile, 'OVR_GetSensorCount', dll_cdecl, ty_string, 0); // Real
global.oc_IsHMDPresent = external_define(dllfile, 'OVR_IsHMDPresent', dll_cdecl, ty_string, 0); // Bool
global.oc_IsSensorPresent = external_define(dllfile, 'OVR_IsSensorPresent', dll_cdecl, ty_string, 1, ty_real); // returns true/false on ID check



global.oc_GetScreenResolution = external_define(dllfile, 'OVR_GetScreenResolution', dll_cdecl, ty_string, 0);

