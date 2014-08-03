yaw=0;
pitch=0;
roll=0;

z = 100;

view_wview[0]=GMO_getResolutionWidth();
view_hview[0]=GMO_getResolutionHeight();

window_set_size(view_wview[0],view_hview[0]);
//window_set_fullscreen(0); //Actually you always need this when using the oculus.
