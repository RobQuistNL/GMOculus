with obj_3d_parent {
    event_perform(ev_draw,0);
}

disable_zbuffer();
with obj_3d_particle {
    event_perform(ev_draw,0);
}
enable_zbuffer();


/*
This is a test-way of drawing. It kinda works, but not good.

Pro's: The texture transparancy works! Its not visible OR invisible, its blended based on the alpha channel (the way its supposed to work)
Cons: The fire gets behind the wood model, and not _in_ it.

To active this, you must disable the z-buffer in init3D.

You should also set the obj_sky depth to 100000 (so it gets drawn first) - then set the obj_grass to 10000, so it gets drawn after obj_sky,
then the rest will be drawn based on distance.

i=0;
instance_array[0]=noone;
with (obj_3d_parent) {
    other.instance_array[other.i] = id;
    if (depth==0) {
        ___dist=point_distance(x,y,player_fps.x,player_fps.y);
        //___dist=0
    } else {
        ___dist=depth
    }

    other.i++;
}
sorted = ds_priority_create();
length = i;

for (i = 0; i < length; i += 1) {
    ds_priority_add(sorted, instance_array[i], instance_array[i].___dist); 
}
  
for (i = 0; i < length; i += 1)
  instance_array[i] = ds_priority_delete_max(sorted);

ds_priority_destroy(sorted);

for (i=0; i<length; i++) {
    with (instance_array[i]) {
        event_perform(ev_draw,0);
    }
}
*/
