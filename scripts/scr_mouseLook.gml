dir -= ((display_mouse_get_x()) - display_get_width() /2) /2;
pitch += ((display_mouse_get_y()) - display_get_height() /2) /2;

if (pitch >= 85) pitch = 85;
if (pitch <= -85) pitch = -85;

display_mouse_set(display_get_width() / 2, display_get_height() / 2); 
