global.MODEL[MOD_TREE_LEAVES] = d3d_model_create();
global.MODEL[MOD_TREE_TRUNK] = d3d_model_create();
global.MODEL[MOD_FERN] = d3d_model_create();
global.MODEL[MOD_SKYBALL] = d3d_model_create();

range = CAM_ZFAR*2
d3d_model_ellipsoid(global.MODEL[MOD_SKYBALL],-range/2,-range/2,-range/2,range/2,range/2,range/2,1,1,16);

d3d_model_load(global.MODEL[MOD_TREE_LEAVES],working_directory + "\models\tree_leaves.d3d");
d3d_model_load(global.MODEL[MOD_TREE_TRUNK],working_directory + "\models\tree_trunk.d3d");
d3d_model_load(global.MODEL[MOD_FERN],working_directory + "\models\fern.d3d");

