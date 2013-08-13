// Make the right eye view fill the right part of the screen
view_wview[1] = window_get_width()/2;
view_hview[1] = window_get_height();
view_xview[1] = 120;
view_yview[1] = 120;
view_hport[1] = window_get_height();
view_wport[1] = window_get_width()/2;
view_xport[1] = window_get_width()/2;

// Make the left eye view fill the whole screen
view_wview[0] = window_get_width();
view_hview[0] = window_get_height();
view_xview[0] = 0;
view_yview[0] = 0;
view_wport[0] = window_get_width();
view_hport[0] = window_get_height();

view_visible[0] = true;
view_visible[1] = false;
