/**
 * This is a rather special function. 
 * We use this function to "attach" the camera to the body. We have our player object
 * on which we want to place the head / camera.
 */
 
// argument0    instance    The instance to follow
// requires Requires the instance to follow to have the following variables:
//  x
//  y
//  z
//  height //The z-height (on top of the main z) where the eyes should be.

x = argument0.x
y = argument0.y
z = argument0.z + argument0.height
