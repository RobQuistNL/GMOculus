dir -= ((display_mouse_get_x()) - display_get_width() /2) /8;
//pitch += ((display_mouse_get_x()) - display_get_height() /2) /2;
/*
if (pitch >= 80) pitch = 80;
if (pitch <= -80) pitch = -80;*/

display_mouse_set(display_get_width() / 2, display_get_height() / 2); 
