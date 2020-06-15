/// @description Insert description here
// You can write your code in this editor
if instance_exists(player) with player {
	 draw_set_color(c_dkgray);
	 //draw_text(100, 620, string("Tactical:"));
	 draw_rectangle(0,600,400,700,false);
	 draw_set_color(c_red);
	 draw_rectangle(0,600,400,700,true);
	 draw_sprite_ext(sButton_Space, 1, 50, 650, 4, 4, image_angle, image_blend, image_alpha);
	 
	// draw_set_color(c_white);
	 if tactDelay > 0 {
		draw_sprite_ext(sTact_status, 0, 70, 600, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}else {
		draw_sprite_ext(sTact_status, 1, 70, 600, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	// draw_set_color(c_orange);
	// draw_text(300, 620, string("Ammo:"));
	//  draw_set_color(c_white);
	  
	  if states = states.reload {
	  draw_sprite_ext(sAmmo, 7, 250, 650, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	  }else {
	 draw_sprite_ext(sAmmo, myAmmo, 250, 650, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	  }
}