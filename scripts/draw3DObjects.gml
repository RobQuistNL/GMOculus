/// Since 3D objects will be drawn on a default surface, we need to call the drawing bit 
// on our own, from the camera. He selects the drawing surface.

// This needs to be done better. Problems:
// 1. Everything gets drawn twice. The camera draws it, but also the object draws itself.
// 2. We don't want an ugly list like this.

// I suggest we make a 3D parent object and copy the draw event to a user defined event.
// Then clear the draw event and only call the user defined event when we want to.
// That should solve both problems.
with (obj_tree) {
    event_perform(ev_draw,0);
}
with (obj_wall) {
    event_perform(ev_draw,0);
}
with (obj_skybox) {
    event_perform(ev_draw,0);
}
