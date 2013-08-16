global._X=0;
global._Y=0;
global._Z=0;

OVR_Init(); //Initialize Oculus DLL

// Load external files
loadTextures();
loadModels();

//Start our 3D engine
init3D();
