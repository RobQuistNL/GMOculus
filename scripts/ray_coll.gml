// By: icuurd12b42

// argument0-2: origin point of line
// argument3-5: line direction vector
// argument6-14: three points of the triangle (x1,y1,z1, x2,y2,z2, x3,y3,z3)
var x0,y0,z0, dx,dy,dz, x1,y1,z1, x2,yy2,z2, x3,y3,z3;
var nx,ny,nz, tx,ty,tz, ux,uy,uz, t,mm,nn,C;

x0 = argument0;
y0 = argument1;
z0 = argument2;

dx = argument3;
dy = argument4;
dz = argument5;

x1 = argument6;
y1 = argument7;
z1 = argument8;

x2 = argument9;
y2 = argument10;
z2 = argument11;

x3 = argument12;
y3 = argument13;
z3 = argument14;

nx = (y2-y1)*(z3-z1) - (y3-y1)*(z2-z1);
ny = (z2-z1)*(x3-x1) - (z3-z1)*(x2-x1);
nz = (x2-x1)*(y3-y1) - (x3-x1)*(y2-y1);

C = nx*x1 + ny*y1 + nz*z1;

mm = sign(nx*(x1-x0) + ny*(y1-y0) + nz*(z1-z0));
nn = dx*nx + dy*ny + dz*nz;

if (mm != sign(nn) || mm == 0) {
  // bail out, no collision
  return 0;
}

t = (C - (nx*x0 + ny*y0 + nz*z0))/nn;

tx = dx*t + x0;
ty = dy*t + y0;
tz = dz*t + z0;

ux = (y1-ty)*(z2-tz) - (y2-ty)*(z1-tz);
uy = (z1-tz)*(x2-tx) - (z2-tz)*(x1-tx);
uz = (x1-tx)*(y2-ty) - (x2-tx)*(y1-ty);

if (ux*nx + uy*ny + uz*nz < 0) {
  return 0;
}

ux = (y2-ty)*(z3-tz) - (y3-ty)*(z2-tz);
uy = (z2-tz)*(x3-tx) - (z3-tz)*(x2-tx);
uz = (x2-tx)*(y3-ty) - (x3-tx)*(y2-ty);

if (ux*nx + uy*ny + uz*nz < 0) {
  return 0;
}


ux = (y3-ty)*(z1-tz) - (y1-ty)*(z3-tz);
uy = (z3-tz)*(x1-tx) - (z1-tz)*(x3-tx);
uz = (x3-tx)*(y1-ty) - (x1-tx)*(y3-ty);

if (ux*nx + uy*ny + uz*nz < 0) {
  return 0;
}

return 1;
