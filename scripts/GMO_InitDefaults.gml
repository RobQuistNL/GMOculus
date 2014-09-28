/** 
 * These are the GMOculus default values. Its better not to touch these, 
 * and simply use the setters and getters instead.
 */

global._GMO_VERSION = 0.30;
global._GMO_DLL_VERSION = 0.1;
global._GMO_VERSION_STRING = string(global._GMO_VERSION)+' (non-stable)';
 
global._GMO_USE_3D_SOUND = true;
global._GMO_CAMERA_MODE = 1; //1 = Regular 2 = Oculus
global._GMO_IPD = 2.6;
global._GMO_CAMERA_ANGLE = 111; // See GMO_setCameraAngle for documentation.
global._GMO_CAM_ZNEAR = 1;
global._GMO_CAM_ZFAR = 2048;
global._GMO_WRES = 1920;
global._GMO_HRES = 1080;
global._GMO_DLL_LOADED = false;
global._GMO_DLL_FILENAME = 'lib\GMOculus.dll'
global._GMO_DEVICE_NAME = 'Unknown Device';

GMO_initSurfaces(); //Create surfaces
