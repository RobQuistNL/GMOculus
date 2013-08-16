camobj = cam_fps
xx=argument0
yy=argument1
zz=argument2

if (point_direction(xx,yy,camobj.x,camobj.y) < camobj.direction-CAM_ANGLE/2) {
    return 0;
}
if (point_direction(xx,yy,camobj.x,camobj.y) > camobj.direction+CAM_ANGLE/2) {
    return 0;
}

return 1;
