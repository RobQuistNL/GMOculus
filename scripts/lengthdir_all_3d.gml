//lengthdir_x_3d(dir,zdir,dis);
//Remember to replace this in this way to get a full working function...
//argument0=direction
//argument1=zdirection (must lie between -90 and 90.. )
//argument2=Distance
var _lm;

_lm=lengthdir_x(1,argument1);

return (lengthdir_x(argument2*_lm,argument0));