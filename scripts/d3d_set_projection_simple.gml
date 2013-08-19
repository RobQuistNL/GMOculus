//d3d_set_projection_simple() made by Rafferty97
//arg0 - x
//arg1 - y
//arg2 - z (height above ground)
//arg3 - yaw (looking at)
//arg4 - pitch (0=looking forward, 90=looking straight up, -90=looking straight down)
//arg5 - roll (0 = Normal, 90 = Leaning Right, 180 = Upside down, 270/-90 = Leaning Left)

var xx, yy, zz, tx, ty, tz, ux, uy, uz, nx, ny, nz, ax, ay, az;
xx = argument0
yy = argument1
zz = argument2
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

//setting_projection
d3d_set_projection_ext(xx,yy,zz,xx+tx,yy+ty,zz+tz,ux,uy,uz,argument6, argument7, argument8, argument9)
if (CAM_FRUSTUM) {
frustum_culling_init  (xx,yy,zz,xx+tx,yy+ty,zz+tz,ux,uy,uz,argument6, argument7, argument8, argument9)
}

