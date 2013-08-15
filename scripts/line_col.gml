//line_col(list,  x1,y1,z1,  x2,y2,z2)

var x1 = argument1
var y1 = argument2
var z1 = argument3

var x2 = argument4
var y2 = argument5
var z2 = argument6

//var e = -1

var size = ds_list_size(argument0)
for(var i=0;i<size;i++){
    var points = ds_list_find_value(argument0,i)
    if (ray_coll(x1,y1,z1,  x2-x1, y2-y1,z2-z1,  
          ds_list_find_value(points,0), ds_list_find_value(points,1), ds_list_find_value(points,2),
          ds_list_find_value(points,3), ds_list_find_value(points,4), ds_list_find_value(points,5),
          ds_list_find_value(points,6), ds_list_find_value(points,7), ds_list_find_value(points,8))   &&
        ray_coll(x2,y2,z2,  x1-x2, y1-y2,z1-z2,  
          ds_list_find_value(points,0), ds_list_find_value(points,1), ds_list_find_value(points,2),
          ds_list_find_value(points,3), ds_list_find_value(points,4), ds_list_find_value(points,5),
          ds_list_find_value(points,6), ds_list_find_value(points,7), ds_list_find_value(points,8)) )
    {
        return i;
    }
}


return -1;



/*





