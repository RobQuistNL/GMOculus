// Changes the camera style, in-game.
// argument0 = CAM_MODE_REGULAR | CAM_MODE_OCULUS

switch (argument0) {
    case CAM_MODE_REGULAR:
        // Make the left eye view fill the whole screen
        global.__CAM_MODE = CAM_MODE_REGULAR;
        break;
        
    case CAM_MODE_OCULUS:
        // Make the left eye view fill the left part of the screen
        global.__CAM_MODE = CAM_MODE_OCULUS;
        break;
    
    default:
        show_message("Unknown argument to setCameraMode: "+string(argument0)+" - Must be CAM_MODE_REGULAR or CAM_MODE_OCULUS.");
        break;
}
