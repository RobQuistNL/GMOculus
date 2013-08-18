//updateAudioListener() adapted from Rafferty97
//arg0 - x
//arg1 - y
//arg2 - z (height above ground)
//arg3 - yaw (looking at)
//arg4 - pitch (0=looking forward, 90=looking straight up, -90=looking straight down)
//arg5 - roll (0 = Normal, 90 = Leaning Right, 180 = Upside down, 270/-90 = Leaning Left)
/*
var xx, yy, zz, tx, ty, tz, ux, uy, uz, nx, ny, nz, ax, ay, az;

tx = lengthdir_x(1,argument3)
ty = lengthdir_y(1,argument3)
tz = 0
ax = lengthdir_x(1,argument3+90)
ay = lengthdir_y(1,argument3+90)
az = 0
ux = 0
uy = 0
uz = 1
//look up/down
nx = vector_rotate(tx,ty,tz,ax,ay,az,argument4*(pi/180),0)
ny = vector_rotate(tx,ty,tz,ax,ay,az,argument4*(pi/180),1)
nz = vector_rotate(tx,ty,tz,ax,ay,az,argument4*(pi/180),2)
tx = nx
ty = ny
tz = nz
nx = vector_rotate(ux,uy,uz,ax,ay,az,argument4*(pi/180),0)
ny = vector_rotate(ux,uy,uz,ax,ay,az,argument4*(pi/180),1)
nz = vector_rotate(ux,uy,uz,ax,ay,az,argument4*(pi/180),2)
ux = nx
uy = ny
uz = nz
//rolling
nx = vector_rotate(ux,uy,uz,tx,ty,tz,-argument5*(pi/180),0)
ny = vector_rotate(ux,uy,uz,tx,ty,tz,-argument5*(pi/180),1)
nz = vector_rotate(ux,uy,uz,tx,ty,tz,-argument5*(pi/180),2)
ux = nx
uy = ny
uz = nz
*/
/*
xx = argument0
yy = argument1
zz = argument2
pit = argument4
rol = argument5
audio_listener_position(xx,yy,zz);
lookat_x = lengthdir_x_3d(1,argument3,argument4);
lookat_y = lengthdir_y_3d(1,argument3,argument4);
lookat_z = lengthdir_z_3d(1,argument5,argument4);
audio_listener_orientation(lookat_x,lookat_y,0,0,0,10);
*/


/* OLD
//arg0 = x
//arg1 = y
//arg2 = z
//arg3 = direction (yaw)
//arg4 = zdirection (pitch)

xt = argument0 + cos(degtorad(argument3));
yt = argument1 - sin(degtorad(argument3));
zt = argument2 - sin(degtorad(argument4));
audio_listener_position(argument0, argument1, argument2)
audio_listener_orientation(xt, yt, zt, 0, 0, 1)
*/
