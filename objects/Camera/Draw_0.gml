/// @description - - DRAW THE DEBUG IN ROOM

// Draw the debug over all things
depth = -9999;

// ==============================================================
// ------------------------	DRAW THE DEBUG INSIDE THE ROOM	-------------------------------
// ==============================================================
#region Draw all the debug elements that are inside the room

// Basic drawing settings
draw_set_font(uc_fnt_dpcomic);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

if (camera_debug_mode) {
	
	// Draw the target
	var t_size = 6;
	
	draw_set_color(debug_color);
	draw_set_alpha(.5);
	
	if (uc_get_mode()!=CMODE.MOUSE_BORDERS) {
		var tx = uc_get_target_x();
		var ty = uc_get_target_y();
	} else {
		var tx = x + cam_mouse_borders_hspd;
		var ty = y + cam_mouse_borders_vspd;
	}
	
	for ( var i=0; i<5 ; i++ ) { // This for is made for drawing with size
		draw_circle(tx, ty, t_size-0.2*i, true);	
	}
	draw_line_width(tx-t_size+1, ty, tx+t_size-1, ty, 1);
	draw_line_width(tx, ty-t_size+1, tx, ty+t_size-1, 1);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	// Draw the position of the camera
	var c_size = 3;
	var c_color = c_white;
	draw_circle_color( x, y, c_size, c_color, c_color, false);
}

#endregion