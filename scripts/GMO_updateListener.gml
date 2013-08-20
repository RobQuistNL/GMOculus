/// Update the position of the listner. This function is not optimal. Could be done better!
// arg0 int x
// arg1 int y
// arg2 int z
// arg3 int yaw
// arg4 int roll


r = GMO_getIPD()/2;
hdir = argument3;
vdir = argument4;

xadd = r*cos(degtorad(hdir))*cos(degtorad(vdir));
yadd = -r*sin(degtorad(hdir))*cos(degtorad(vdir));
zadd = r*sin(degtorad(vdir));

//Update the sound position
audio_listener_position(argument0, argument1, argument2)
audio_listener_orientation(-xadd*100,-yadd*100,zadd*100,0,0,40);
