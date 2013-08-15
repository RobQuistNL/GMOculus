offset = argument0

array[0] = 1;
array[1] = 0;
array[2] = 0;
array[3] = offset;

array[4] = 0;
array[5] = 1;
array[6] = 0;
array[7] = 0;

array[8] = 0;
array[9] = 0;
array[10] = 1;
array[11] = 0;

array[12] = 0;
array[13] = 0;
array[14] = 0;
array[15] = 1;

shader_params = shader_get_uniform(stereo_offset_left, "leftMat");
shader_set_uniform_matrix_array(shader_params, array);

shader_params = shader_get_uniform(stereo_offset_right, "leftMat");
array[3] = -array[3]; //Reverse
shader_set_uniform_matrix_array(shader_params, array);
