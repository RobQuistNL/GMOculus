/// Also a very special function.
// This draws our objects in a specific order. We do this for a couple of reasons:
// 1. We must draw all 3D instances to a surface. We can't use the regular drawing function for that, as we need to force them to draw themselves 
//  at a specific moment.
// 2. For transparant textures (smoke, fire etc.) we must change the order of drawing objects. First everything solid, then, everything transparant.
//  So - for any effects you're planning to make - make the neccecary changes here.

with obj_3d_parent {
    event_perform(ev_draw,0);
}

GMO_disableZBuffer();
with obj_3d_particle {
    event_perform(ev_draw,0);
}
GMO_enableZBuffer();


