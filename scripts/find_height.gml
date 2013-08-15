// find_height(x,y,tri_id)

var points = ds_list_find_value(obj_room.list,argument2);

x0 = ds_list_find_value(points,0);
y0 = ds_list_find_value(points,1);
z0 = ds_list_find_value(points,2);

x1 = ds_list_find_value(points,3);
y1 = ds_list_find_value(points,4);
z1 = ds_list_find_value(points,5);

x2 = ds_list_find_value(points,6);
y2 = ds_list_find_value(points,7);
z2 = ds_list_find_value(points,8);

dx=x0;
dy=y0;
dz=z0;

nX=(y1-y0)*(z2-z0)-(z1-z0)*(y2-y0);
nY=(z1-z0)*(x2-x0)-(x1-x0)*(z2-z0);
nZ=(x1-x0)*(y2-y0)-(y1-y0)*(x2-x0);

return dz+(nX*(x-dx)+nY*(y-dy))/-nZ;
