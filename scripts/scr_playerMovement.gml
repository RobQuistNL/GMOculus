// scr_playerMovement(speed, strafe speed, back speed)

var fs = argument0;
var ss = argument1;
var bs = argument2;

friction = 1;
if speed>1 speed = 1;

if (keyboard_check(ord("W"))){
    motion_add(dir,fs);
}
if (keyboard_check(ord("S"))){
    motion_add(dir+180,bs);
}

if (keyboard_check(ord("A"))){
    motion_add(dir+90,ss);
}
if (keyboard_check(ord("D"))){
    motion_add(dir-90,ss);
}

var r = 16;

var sy = sign(vspeed);
var sx = sign(hspeed);

var hiz = height/3;

var x1 = x-5
var x2 = x+5
var y1 = y-5
var y2 = y+5

var ang = -1;
/*
for(var i=0;i<=360;i+=45){

    if (line_col(obj_room.list,x,y,z+hiz,x+lengthdir_x(16,i),y+lengthdir_y(16,i),z+hiz)>-1)
    {
        for(var j=16;j>=0;j-=.3){
            if (line_col(obj_room.list,x,y,z+hiz,x+lengthdir_x(j,i),y+lengthdir_y(j,i),z+hiz)==-1)
            {
                dis = j;
                break;
            }
        }

        x=x+lengthdir_x(16-dis,i+180)
        y=y+lengthdir_y(16-dis,i+180)
    }
}*/
//(line_col(x,y,z+hiz,x+lengthdir_x(j,i),y+lengthdir_y(j,i),z+hiz)>-1)


/*
ang = -1;
for(var i=0;i<=360;i+=20){
    if (collision_line(x,y,x+lengthdir_x(16,i),y+lengthdir_y(16,i),object1,1,1))
    {
        draw_line(x,y,x+lengthdir_x(16,i),y+lengthdir_y(16,i))

        for(var j=0;j<=16;j++){
            if (collision_line(x,y,x+lengthdir_x(j,i),y+lengthdir_y(j,i),object1,1,1))
            {
                dis = j;
                break;
            }
        }

        x=x+lengthdir_x(16-dis,i+180)
        y=y+lengthdir_y(16-dis,i+180)
    }
}
(line_col(x,y,x+lengthdir_x(16,i),y+lengthdir_y(16,i))>-1)

/*
if (
line_col(obj_room.list,  x1,y1,z+hiz,  x2,y1,z+hiz)>-1 ||
line_col(obj_room.list,  x2,y1,z+hiz,  x2,y2,z+hiz)>-1 ||
line_col(obj_room.list,  x2,y2,z+hiz,  x1,y2,z+hiz)>-1 ||
line_col(obj_room.list,  x1,y2,z+hiz,  x1,y1,z+hiz)>-1
)
{
  x = xprevious;
  y = yprevious;
  if (abs(hspeed) >= abs(vspeed) && line_col(obj_room.list,  x,y,z+hiz,  x+hspeed,y,z+hiz) == -1)//place_meeting(x+hspeed,y,other)) 
{ x += hspeed; exit;}
 if (abs(vspeed) >= abs(hspeed) && line_col(obj_room.list,  x,y,z+hiz,  x,y+vspeed,z+hiz) == -1)//not place_meeting(x,y+vspeed,other)) 
{ y += vspeed; exit;}
  speed = 0;
}


/*
if (
line_col(obj_room.list,  x,y,z+hiz,  x,y+(sy*r)+vspeed,z+hiz) ||
line_col(obj_room.list,  x+(1*sx),y,z+hiz,  x+(1*sx),y+(sy*r)+vspeed,z+hiz) ||
line_col(obj_room.list,  x+(2*sx),y,z+hiz,  x+(2*sx),y+(sy*r)+vspeed,z+hiz) ||
line_col(obj_room.list,  x+(3*sx),y,z+hiz,  x+(4*sx),y+(sy*r)+vspeed,z+hiz) ||
line_col(obj_room.list,  x+(4*sx),y,z+hiz,  x+(3*sx),y+(sy*r)+vspeed,z+hiz)
)
{
    vspeed = 0;
}

if (line_col(obj_room.list,  x,y,z+hiz,  x+(sx*r)+hspeed,y,z+hiz) ||
line_col(obj_room.list,  x,y+(1*sx),z+hiz,  x+(sx*r)+hspeed,y+(1*sx),z+hiz) ||
line_col(obj_room.list,  x,y+(2*sx),z+hiz,  x+(sx*r)+hspeed,y+(2*sx),z+hiz) ||
line_col(obj_room.list,  x,y+(3*sx),z+hiz,  x+(sx*r)+hspeed,y+(3*sx),z+hiz) ||
line_col(obj_room.list,  x,y+(4*sx),z+hiz,  x+(sx*r)+hspeed,y+(4*sx),z+hiz)
){
    hspeed = 0;
}

