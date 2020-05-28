/// @description Insert description here
// You can write your code in this editor
if instance_exists(player) with player {
	 draw_set_color(c_orange);
	 draw_text(100, 620, string("Tactical:"));
	 
	 draw_set_color(c_white);
	 if tactDelay > 0 {
		draw_sprite_ext(sTact_status, 0, 150, 600, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}else {
		draw_sprite_ext(sTact_status, 1, 150, 600, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	 draw_set_color(c_orange);
	 draw_text(300, 620, string("Ammo:"));
	  draw_set_color(c_white);
	 draw_sprite_ext(sAmmo, myAmmo, 450, 620, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}