/*===========================================*/
//argument0 = x offset
//argument1 = y offset
//argument2 = z offset
//argument3 = xdirection
//argument4 = ydirection
//argument5 = zdirection

//Returns X Spot
/*===========================================*/

//Load up temp vars
X=argument0
Y=argument0
Z=argument0

//X Rotate
newy=(Y*cos(degtorad(-argument1)))-(Z*sin(degtorad(-argument1)))
newz=(Z*cos(degtorad(-argument1)))+(Y*sin(degtorad(-argument1)))
Y=newy
Z=newz

//Y Rotate
newx=(X*cos(degtorad(-argument2)))+(Z*sin(degtorad(-argument2)))
X=newx

//Z Rotate
newy=(Y*cos(degtorad(-argument3)))+(X*sin(degtorad(-argument3)))
X=newx

//Return X
return(X)
