// Changes the camera style, in-game.
// argument0 = CAM_REGULAR | CAM_OCULUS


switch (argument0) {
    case CAM_REGULAR:      
        // Make the left eye view fill the whole screen
        view_wview[0] = window_get_width();
        view_hview[0] = window_get_height();
        view_xview[0] = 0;
        view_yview[0] = 0;
        view_wport[0] = window_get_width();
        view_hport[0] = window_get_height();
        
        view_visible[0] = true;
        view_visible[1] = false;
        
        global.camera_style = CAM_REGULAR;
        break;
        
    case CAM_OCULUS:
       
        // Make the left eye view fill the left part of the screen
        view_wview[0] = window_get_width()/2;
        view_hview[0] = window_get_height();
        view_xview[0] = 0;
        view_yview[0] = 0;
        view_hport[0] = window_get_height();
        view_wport[0] = window_get_width()/2;
        view_xport[0] = 0;
        
        view_visible[0] = true;
        view_visible[1] = true;
        
        global.camera_style = CAM_OCULUS;
        break;
    
    default:
        show_message("Unknown argument to setCamStyle: "+string(argument0)+" - Must be CAM_REGULAR or CAM_OCULUS.");
        break;
}

