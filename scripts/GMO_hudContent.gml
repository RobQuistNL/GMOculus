//Here goes HUD drawing code, in a 960*1080 area representing each eye

draw_set_alpha(0.5);
draw_set_color(c_white);
draw_set_alpha(0.8);
draw_rectangle(960/2-175,1080/2-50,960/2+175,1080/2+50,0);
draw_set_color(c_black);
draw_set_font(fnt_hud);
draw_text(960/2-150,1080/2-25,"Pitch: "+string(pitch)+
                    ", Yaw: "+string(yaw)+
                    ", Roll: "+string(roll)+
                    "#Device: X=" + string(dx) + " Y=" + string(dy) + " Z=" + string(dz) + " #This is an example of a simple HUD");
draw_set_alpha(1);
