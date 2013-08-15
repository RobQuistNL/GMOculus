/*===========================================*/
//argument0 = x offset
//argument1 = y offset
//argument2 = z offset
//argument3 = xdirection
//argument4 = ydirection
//argument5 = zdirection

//Returns Z Spot
/*===========================================*/

//Load up temp vars
X=argument0
Y=argument0
Z=argument0

//X Rotate
newz=(Z*cos(degtorad(-argument1)))+(Y*sin(degtorad(-argument1)))
Z=newz

//Y Rotate
newz=(Z*cos(degtorad(-argument2)))-(X*sin(degtorad(-argument2)))
Z=newz

//Z Rotate
newx=(X*cos(degtorad(-argument3)))-(Y*sin(degtorad(-argument3)))

//Return Z
return(Z)
