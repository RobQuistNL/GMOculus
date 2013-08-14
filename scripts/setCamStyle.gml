// Changes the camera style, in-game.
// argument0 = CAM_REGULAR | CAM_OCULUS


switch (argument0) {
    case CAM_REGULAR:      
        // Make the left eye view fill the whole screen
        global.camera_style = CAM_REGULAR;
        break;
        
    case CAM_OCULUS:       
        // Make the left eye view fill the left part of the screen
        global.camera_style = CAM_OCULUS;
        break;
    
    default:
        show_message("Unknown argument to setCamStyle: "+string(argument0)+" - Must be CAM_REGULAR or CAM_OCULUS.");
        break;
}

