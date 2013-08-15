// mod_to_triList(mod)
// returns a list of lists made up of the 9 values of the 3d triangle

var x1,x2,x3,y1,y2,y3,z1,z2,z3;

var _mod = argument0;

var line = ""; 
var main_list = ds_list_create();


var file = file_text_open_read(_mod); //100

file_text_readln(file); //number of lines
line = file_text_read_string(file);
var number_of_lines = (real(line) - 2) /3 -1;

file_text_readln(file); //the meat
for(var i=0; i<=number_of_lines; i++){
    var list = ds_list_create();
    
    repeat(3){
        file_text_readln(file);
        
        line = file_text_read_string(file);
        ds_list_add(list,real( string_copy(line, 3, string_pos(".", line)-3) ));
        
        line = string_copy(line, string_pos(".", line)+6, string_length(line));
        ds_list_add(list,real( string_copy(line, 0, string_pos(".", line)-1) ));
        
        line = string_copy(line, string_pos(".", line)+6, string_length(line));
        ds_list_add(list,real( string_copy(line, 0, string_pos(".", line)-1) ));
    }
    
    ds_list_add(main_list,list);
}

file_text_close(file);

return main_list;
