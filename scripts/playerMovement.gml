// playerMovement(speed, strafe speed, back speed)

var fs = argument0;
var ss = argument1;
var bs = argument2;

if (keyboard_check(ord("W"))){
    x += lengthdir_x(fs, direction);
    y += lengthdir_y(fs, direction);
}
if (keyboard_check(ord("S"))){
    x += lengthdir_x(bs, direction+180);
    y += lengthdir_y(bs, direction+180);
}

if (keyboard_check(ord("A"))){
    x += lengthdir_x(ss, direction+90);
    y += lengthdir_y(ss, direction+90);
}
if (keyboard_check(ord("D"))){
    x += lengthdir_x(ss, direction-90);
    y += lengthdir_y(ss, direction-90);
}
