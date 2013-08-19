global._LIGHTS=0;
global._X=0;
global._Y=0;
global._Z=0;
global.__CAM_MODE = CAM_MODE_OCULUS;

OVR_Init(); //Initialize Oculus DLL

// Load external files
loadTextures();
loadModels();

//Start our 3D engine
init3D();
