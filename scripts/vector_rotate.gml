//vector_rotate() made by Rafferty97
// x, y, z, ux, uy, uz, angle, r(x = 0, y = 1, z = 2)
var xx, yy, zz, ux, uy, u, angle, r, mx, my, mz, s, c;
xx = argument0
yy = argument1
zz = argument2
ux = argument3
uy = argument4
uz = argument5
angle = argument6
s = sin(angle)
c = cos(angle)
r = argument7
if r=0 {return (xx*(  sqr(ux)+((1-sqr(ux))*c)  ))+(yy*(  (ux*uy*(1-c))-(uz*s)  ))+(zz*(  (ux*uz*(1-c))+(uy*s)  ))}
if r=1 {return (xx*(  (ux*uy*(1-c))+(uz*s)  ))+(yy*(  sqr(uy)+((1-sqr(uy))*c)  ))+(zz*(  (uy*uz*(1-c))-(ux*s)  ))}
if r=2 {return (xx*(  (ux*uz*(1-c))-(uy*s)  ))+(yy*(  (uy*uz*(1-c))+(ux*s)  ))+(zz*(  sqr(uz)+((1-sqr(uz))*c)  ))}
