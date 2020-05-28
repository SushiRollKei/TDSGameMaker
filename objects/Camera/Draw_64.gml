/// @description - - DRAW DEBUG AND EFFECTS

// ==============================================================
// -----------------------------------------------	DRAW THE EFFECTS	----------------------------------
// ==============================================================
#region Draw the bars and the flash

// Auxiliar parameters so I dont have to type a lot :)
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

	#region Bars

	// Smoothly calculate the bars position.
	bars_position = uc_fixed_lerp(bars_position, bars_enabled*gui_height*bars_percentage, bars_acceleration);
	
	// Draw the bars.
	draw_rectangle_color(0, 0, gui_width, bars_position/2, bars_color, bars_color, bars_color, bars_color, false);
	draw_rectangle_color(0, gui_height-bars_position/2, gui_width, gui_height, bars_color, bars_color, bars_color, bars_color, false);

	#endregion
	
	#region Flash

	// Calculate the falsh intensity.
	flash_alpha = uc_fixed_lerp(flash_alpha, flash_max_alpha*flash_enable, flash_enable?flash_in_speed:flash_out_speed);
	if (flash_alpha>flash_max_alpha-flash_threshold) {
		flash_enable = false;	
	}

	// Draw the flash-
	draw_set_alpha(flash_alpha);
	draw_rectangle_color(0, 0, gui_width, gui_height, flash_color, flash_color, flash_color, flash_color, false);
	draw_set_alpha(1);

	#endregion

#endregion

// ==============================================================
// -----------------------------------------------	DRAW THE DEBUG	----------------------------------
// ==============================================================
#region Draw all the text of the debug

if (camera_debug_mode) {
	
	// Basic drawing settings
	draw_set_color(debug_color);
	draw_set_font(uc_fnt_dpcomic);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);

	// Error messages
	#region BOTTOM SIDE
	
		// Parameters of the debug drawing
		var d_bord = 20;
	
	
		// Write the error list
		var err_size = array_length_1d(error_list);
		var num_errors_displayed = 6;
	
		for ( var i=0; i <  min(num_errors_displayed, err_size) ; i++ ) {
			// Write a maxim of <num_error_displayed> errors and with a fading alpha
			draw_set_alpha(1 - i*(1/num_errors_displayed))
			draw_text( d_bord, gui_height - 30*i -d_bord, error_list[err_size-i-1]);
		}
		draw_set_alpha(1);
	
	#endregion
	
	// Camera parameters
	#region TOP-LEFT
		
		// Align the text to the top
		draw_set_valign(fa_top);
		
		// List with what we want to draw
		var basic_info;
		
		#region General information
		
		basic_info[0] = "FPS: " + string(fps) + "/" + string(room_speed);
		basic_info[1] = "X: " + string(x) + "    Y: " + string(y);
		basic_info[2] = "View - width: " + string(view_width) + "    Height: " + string(view_height);
		basic_info[3] = "Port - width: " + string(port_width) + "    Height: " + string(port_height);
		basic_info[4] = "Scale: " + string(view_scale) + "    Auto scale: " + string(view_auto_scale) + "    Inclination: " + string(view_inclination);
		basic_info[5] = "";
		basic_info[6] = "Camera " + cam_mode_string_list[cam_mode] + " mode variables";
		basic_info[7] = "Target - X: " + string(x) + "    Y: " + string(y);
		
		#endregion
		
		#region Mode information
		
		switch(Camera.cam_mode) {
			
			case CMODE.STATIC:
				basic_info[8] = "Acceleration: " + string(cam_static_acceleration);
			break;
			
			case CMODE.OBJECT_FOLLOWING:
				basic_info[8] = "Acceleration: " + string(cam_object_following_acceleration);
			break;
			
			case CMODE.OBJECT_BORDERS:
				basic_info[8] = "Horizontal border: " + string(cam_object_borders_horizontal_size);
				basic_info[9] = "Horizontal border: " + string(cam_object_borders_vertical_size);
				basic_info[10] = "Acceleration: " + string(cam_object_borders_acceleration);
			break;
			
			case CMODE.MOUSE_BORDERS:
				basic_info[8] = "Borders size: " + string(cam_mouse_borders_size);
				basic_info[9] = "Direction: " + string(cam_mouse_borders_movdir);
				basic_info[10] = "Acceleration: " + string(cam_mouse_borders_acceleration);
				basic_info[11] = "Max speed: " + string(cam_mouse_borders_acceleration);
				basic_info[12] = "Hspd: " + string(cam_mouse_borders_hspd) + "    Vspd: " + string(cam_mouse_borders_vspd);
			break;
			
			case CMODE.MOUSE_SHOOTER:
				basic_info[8] = "Percentage: " + string(cam_mouse_shooter_percentage);
				basic_info[9] = "Acceleration: " + string(cam_mouse_shooter_acceleration);
			break;
			
			case CMODE.MOUSE_DRAG:
				basic_info[8] = "Window mouse_x: " + string(cam_mouse_drag_mx) + "    mouse_y "  + string(cam_mouse_drag_my);
				basic_info[9] = "Camera on clic X: " + string(cam_mouse_drag_cx) + "    Y "  + string(cam_mouse_drag_cy);
				basic_info[10] = "Acceleration: " + string(cam_mouse_drag_acceleration);
				basic_info[11] = "Hspd: " + string(cam_mouse_drag_hspd) + "    Vspd: " + string(cam_mouse_drag_vspd);
			break;
		}
		
		#endregion
		
		#region Effect information
		
		// Blank space
		var basic_info_len = array_length_1d(basic_info);
		
		if (bars_enabled) {
			basic_info[basic_info_len] = "";
			basic_info[basic_info_len+1] = "Bars information";
			basic_info[basic_info_len+2] = "Position: " + string(bars_position);
			basic_info[basic_info_len+3] = "Percentage: " + string(bars_percentage);
			basic_info[basic_info_len+4] = "Acceleration: " + string(bars_acceleration);
			basic_info[basic_info_len+5] = "Color: " + string(bars_color);
		}
		
		if (shake_current) {
			basic_info_len = array_length_1d(basic_info);
			basic_info[basic_info_len] = "";
			basic_info[basic_info_len+1] = "Shake information";
			basic_info[basic_info_len+2] = "Intensity: " + string(shake_current);
		}
		
		if (hit_length) {
			basic_info_len = array_length_1d(basic_info);
			basic_info[basic_info_len] = "";
			basic_info[basic_info_len+1] = "Hit information";
			basic_info[basic_info_len+2] = "Length: " + string(hit_length);
			basic_info[basic_info_len+3] = "Direction: " + string(hit_direction);
			basic_info[basic_info_len+4] = "Intensity: " + string(hit_intensity);
			basic_info[basic_info_len+5] = "Recovery: " + string(hit_recovery);
		}
		
		if (flash_enable) {
			basic_info_len = array_length_1d(basic_info);
			basic_info[basic_info_len] = "";
			basic_info[basic_info_len+1] = "Flash information";
			basic_info[basic_info_len+2] = "Alpha: " + string(flash_alpha) + "    Max alpha: " + string(flash_max_alpha);
			basic_info[basic_info_len+3] = "In speed: " + string(flash_in_speed) + "    Out speed: " + string(flash_out_speed);
			basic_info[basic_info_len+4] = "Color: " + string(flash_color);
		}
		
		#endregion
		
		#region Draw the information
		
		basic_info_len = array_length_1d(basic_info);
		
		for ( var i=0 ; i<basic_info_len ; i++ ) {
			draw_text( d_bord, d_bord + d_bord*i*1.5, basic_info[i]);	
		}
		
		#endregion
	
	#endregion
	
	// Following list
	#region TOP-RIGHT
	
		// Write the name of the instance/s being followed
		draw_set_halign(fa_right);
		var fol_size = ds_list_size(cam_following_list);
		var num_instances_displayed = 10;
	
		for ( var i=0; i <  min(num_instances_displayed, fol_size) ; i++ ) {
			if (uc_get_instance_following_list(i) != NULL) {
					if (i) {
						draw_set_alpha(1 - i*(1/num_instances_displayed))
						draw_text( gui_width-d_bord, 30*i + d_bord, object_get_name(uc_get_instance_following_list(i).object_index));
					} else {
						draw_text( gui_width-d_bord, d_bord, "Following:  " + string(object_get_name(uc_get_instance_following_list(0).object_index)));
					}
			}
		}
		draw_set_alpha(1);
	
	#endregion
	
	// Camera mode
	#region TOP-MIDDLE
	
		// Write the current camera mode
		draw_set_halign(fa_middle);
		draw_text( gui_width/2, d_bord, "CMOD: " + uc_get_mode_name());
	
	#endregion
	
	// Camera borders
	#region Object Borders
	if (cam_mode==CMODE.OBJECT_BORDERS) {
		var ww = window_get_width();
		var wh = window_get_height();
		var cx = ww/2;
		var cy = wh/2;
		var g2v = ww/view_width;
		var hoff = cam_object_borders_horizontal_size*g2v;
		var voff = cam_object_borders_vertical_size*g2v;
		draw_rectangle(cx-hoff, cy-voff, cx+hoff, cy+voff, true);
		
		draw_line_width(cx, cy, cx +cam_object_borders_rx*g2v/view_total_scale, cy, 3);
		draw_line_width(cx, cy, cx, cy+cam_object_borders_ry*g2v/view_total_scale, 3);
	}
	#endregion
	
	#region Mouse Borders	
	if (cam_mode==CMODE.MOUSE_BORDERS) {
		var ww = window_get_width();
		var wh = window_get_height();
		var off = cam_mouse_borders_size;
		draw_rectangle(off, off, ww-off, wh-off, true);
	}
	
	
	#endregion
		
	// Reset drawing settings
	draw_set_color(c_white);
}

#endregion