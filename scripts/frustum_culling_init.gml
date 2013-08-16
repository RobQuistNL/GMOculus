// frustum_culling_init(xfrom, yfrom, zfrom, xto, yto, zto, xup, yup, zup, angle, aspect, znear, zfar)
var d;

global.frustum_culling_xfrom = argument0;
global.frustum_culling_yfrom = argument1;
global.frustum_culling_zfrom = argument2;

global.frustum_culling_xto = argument3-global.frustum_culling_xfrom;
global.frustum_culling_yto = argument4-global.frustum_culling_yfrom;
global.frustum_culling_zto = argument5-global.frustum_culling_zfrom;
d = sqrt(global.frustum_culling_xto*global.frustum_culling_xto+global.frustum_culling_yto*global.frustum_culling_yto+global.frustum_culling_zto*global.frustum_culling_zto);
global.frustum_culling_xto /= d;
global.frustum_culling_yto /= d;
global.frustum_culling_zto /= d;

global.frustum_culling_xup = argument6;
global.frustum_culling_yup = argument7;
global.frustum_culling_zup = argument8;
d = global.frustum_culling_xup*global.frustum_culling_xto+global.frustum_culling_yup*global.frustum_culling_yto+global.frustum_culling_zup*global.frustum_culling_zto;
global.frustum_culling_xup -= d*global.frustum_culling_xto;
global.frustum_culling_yup -= d*global.frustum_culling_yto;
global.frustum_culling_zup -= d*global.frustum_culling_zto;
d = sqrt(global.frustum_culling_xup*global.frustum_culling_xup+global.frustum_culling_yup*global.frustum_culling_yup+global.frustum_culling_zup*global.frustum_culling_zup);
global.frustum_culling_xup /= d;
global.frustum_culling_yup /= d;
global.frustum_culling_zup /= d;

global.frustum_culling_xcross = global.frustum_culling_yup*global.frustum_culling_zto-global.frustum_culling_zup*global.frustum_culling_yto;
global.frustum_culling_ycross = global.frustum_culling_zup*global.frustum_culling_xto-global.frustum_culling_xup*global.frustum_culling_zto;
global.frustum_culling_zcross = global.frustum_culling_xup*global.frustum_culling_yto-global.frustum_culling_yup*global.frustum_culling_xto;

global.frustum_culling_ytan = tan(degtorad(argument9)/2);
global.frustum_culling_xtan = global.frustum_culling_ytan*argument10;
global.frustum_culling_xsec = sqrt(1+sqr(global.frustum_culling_xtan));
global.frustum_culling_ysec = sqrt(1+sqr(global.frustum_culling_ytan));
global.frustum_culling_znear = argument11;
global.frustum_culling_zfar = argument12;
