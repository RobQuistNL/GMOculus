direction -= ((mouse_x) - window_get_width() /2) /2;
pitch -= ((mouse_y) - window_get_height() /2) /2;

if (pitch >= 85) pitch = 85;
if (pitch <= -85) pitch = -85;

window_mouse_set(window_get_width() / 2, window_get_height() / 2); 
