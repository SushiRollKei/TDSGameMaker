/// @description Insert description here
// You can write your code in this editor
/// @desc Surface

// Ensure the surface renders

if (!surface_exists(surface))
{
    surface = surface_create(room_width,room_height);
}

//Set up surface

surface_set_target(surface);
	//Set Up Room Surface
    draw_clear_alpha(c_black, myAlpha);
    //draw_set_color(c_white);
	
	//Building 1
    if (player.x > 256) and (player.x < 767) and (player.y < 1119) and (player.y > 880)
    {
        myAlpha = approach(myAlpha,0.8,0.1);
        gpu_set_blendmode(bm_subtract);
        draw_set_colour(c_black);
        draw_rectangle(256,1119,767,880, false);
        gpu_set_blendmode(bm_normal);
    } else 
    {
        myAlpha = approach(myAlpha,0,0.1);
     // if myAlpha > 0 {
     //  gpu_set_blendmode(bm_subtract);
     //  draw_set_colour(c_black);
	 //	 draw_rectangle(256,1119,767,880, false);
     //  gpu_set_blendmode(bm_normal);
     //  } else{
			 gpu_set_blendmode(bm_normal);
			 draw_set_colour(c_black);
			 draw_set_alpha(0.9);
			 draw_rectangle(256,1119,767,880, false);
			 draw_set_alpha(1);
	}



surface_reset_target();

draw_surface(surface, 0,0);