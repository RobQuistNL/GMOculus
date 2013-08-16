global.MODEL[MOD_TREE_LEAVES] = d3d_model_create();
global.MODEL[MOD_TREE_TRUNK] = d3d_model_create();
global.MODEL[MOD_FERN] = d3d_model_create();

d3d_model_load(global.MODEL[MOD_TREE_LEAVES],working_directory + "\models\tree_leaves.d3d");
d3d_model_load(global.MODEL[MOD_TREE_TRUNK],working_directory + "\models\tree_trunk.d3d");
d3d_model_load(global.MODEL[MOD_FERN],working_directory + "\models\fern.d3d");
