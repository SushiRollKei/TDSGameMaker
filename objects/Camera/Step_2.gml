/// @description - - CAMERA SIZE AND MOVEMENT

// Calculate the time factor
time_factor = delta_time * BASE_FPS / 1000000;

// ==============================================================
// -------------------------------------------	CAMERA TARGET	-----------------------------------------
// ==============================================================
#region Calculate the movement of the camera

// Here we will be calculating the point target the camera will follow
// the target of the camera will change depenging of the camera mode.
switch (cam_mode) {
	
	#region Static
	// Static mode will make the camera stay still.
	case CMODE.STATIC:
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		x = uc_fixed_lerp(x, target_x, cam_static_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_static_acceleration);
		
		break; #endregion

	#region Object Following
	// Object Following mode will make the camera focus the average
	// position of all the instances within the cam_following list.
	case CMODE.OBJECT_FOLLOWING:
	
		if (ds_list_size(cam_following_list)) {	
			// Firstly we reset the center point and the average distance to the center.
			target_x = 0;
			target_y = 0;
			avg_dis_to_center = 0;
		
			// Next we iterate through all the instances on the list checking if it exits
			// then we add it position to the target and we increment the divisor.
			var f_size = ds_list_size(cam_following_list);
			var divisor = 0;
		
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					target_x += cam_following_list[|i].x;	
					target_y += cam_following_list[|i].y;
					divisor++;
				}
			}
		
			// Once we added all the coordinates of the instances in the list we
			// divide it by the number of valid instances on the list.
			if divisor {
				target_x /= divisor;
				target_y /= divisor;
			}
		
			// Now we calculate the average distance from each instance to the middle point.
			for( var i=0; i<f_size ; i++ ) {
				if (instance_exists(cam_following_list[|i])) {
					avg_dis_to_center += point_distance(target_x, target_y, cam_following_list[|i].x, cam_following_list[|i].y)*(1/divisor);
				}
			}
		}
		
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		x = uc_fixed_lerp(x, target_x, cam_object_following_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_object_following_acceleration);
		
		break; #endregion
	
	#region Object Borders
	case CMODE.OBJECT_BORDERS:
		
		// First we clear the following list leaving only the last element so if we want to change
		// element we just have to add it or set it so the camera will pop all the other elements.
		var cam_following_size = ds_list_size(cam_following_list);
		
		if (cam_following_size) {
			if (cam_following_size>1) {
				var last_instance = cam_following_list[|cam_following_size-1];
				ds_list_clear(cam_following_list);
				cam_following_list[|0] = last_instance;
			}
		
			// Save the following instance position in a shorter namee
			var fx = cam_following_list[|0].x;
			var fy = cam_following_list[|0].y;
		
			// Get the direction to the player with the viewing inclination and the distance
			var phi = point_direction(x, y, fx, fy)+view_inclination;
			var h = point_distance(x, y, fx, fy);
		
			// This is the x and y component of the distance to the player with the camera rotated
			cam_object_borders_rx = h*dcos(phi);
			cam_object_borders_ry = -h*dsin(phi);
		
			// Update the borders to match the size of the veiw
			var hbord = cam_object_borders_horizontal_size*view_total_scale;
			var vbord = cam_object_borders_vertical_size*view_total_scale;
		
			// Calculate the target with rotation
			var rotated_target_x = 0;
			var rotated_target_y = 0;
		
			// Calculate the horizontal target
			if (cam_object_borders_rx > hbord || cam_object_borders_rx < -hbord) {
				rotated_target_x = sign(cam_object_borders_rx)*(abs(cam_object_borders_rx)-hbord);
			}
		
			// Calculate the vertical target
			if (cam_object_borders_ry > vbord || cam_object_borders_ry < -vbord) {
				rotated_target_y = sign(cam_object_borders_ry)*(abs(cam_object_borders_ry)-vbord);
			}
		
			// Unrotate the target
			target_x = rotated_target_x*dcos(view_inclination) - rotated_target_y*dsin(view_inclination) + x;
			target_y = rotated_target_x*dsin(view_inclination) + rotated_target_y*dcos(view_inclination) + y;
		}
		
		// Then we approach the camera to the target smoothly.
		x = uc_fixed_lerp(x, target_x, cam_object_borders_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_object_borders_acceleration);
		
		break;
	
	#endregion
	
	#region Mouse Borders
	case CMODE.MOUSE_BORDERS:
		// Check if the mouse is on the screen borders.
		var mx = window_mouse_get_x();
		var my = window_mouse_get_y();
		var ww = window_get_width();
		var wh = window_get_height();
		var cond = ( mx < cam_mouse_borders_size )
						|| ( mx >  ww-cam_mouse_borders_size)
						|| ( my < cam_mouse_borders_size )
						|| ( my > wh-cam_mouse_borders_size );
		
		var xspd, yspd;
		if cond {
			// If so, get the direction from the center of the camera to the mouse.
			cam_mouse_borders_movdir = point_direction(ww/2, wh/2, mx, my) - uc_get_view_inclination();
			
			// Then get X and Y component of that direction with the length of the speed.
			xspd = lengthdir_x(cam_mouse_borders_maxspeed*view_total_scale, cam_mouse_borders_movdir);
			yspd = lengthdir_y(cam_mouse_borders_maxspeed*view_total_scale, cam_mouse_borders_movdir);
		} else  {
			// If not, make the camera stop.
			xspd = 0;
			yspd = 0;
		}
		
		// Apply that amount of speed in a smooth way.
		cam_mouse_borders_hspd = uc_fixed_lerp(cam_mouse_borders_hspd, xspd, cam_mouse_borders_acceleration);
		cam_mouse_borders_vspd = uc_fixed_lerp(cam_mouse_borders_vspd, yspd, cam_mouse_borders_acceleration);
		
		// Move the camera		
		target_x += cam_mouse_borders_hspd;
		target_y += cam_mouse_borders_vspd;
		
		x = uc_fixed_lerp(x, target_x, cam_mouse_borders_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_mouse_borders_acceleration);
		break;
	
	#endregion

	#region Mouse Shooter
	// Object Following mode will make the camera focus the average
	// position of all the instances within the cam_following list.
	case CMODE.MOUSE_SHOOTER:
		
		// First we clear the following list leaving only the last element so if we want to change
		// element we just have to add it or set it so the camera will pop all the other elements.
		var cam_following_size = ds_list_size(cam_following_list);
		if (cam_following_size) {
			if (cam_following_size>1) {
				var last_instance = cam_following_list[|cam_following_size-1];
				ds_list_clear(cam_following_list);
				cam_following_list[|0] = last_instance;
			}
		
			// Then we calculate the mid point from the instance to the mouse.
			target_x = cam_following_list[|0].x + (mouse_x-cam_following_list[|0].x)*cam_mouse_shooter_percentage;
			target_y = cam_following_list[|0].y + (mouse_y-cam_following_list[|0].y)*cam_mouse_shooter_percentage;
		}
		
		// Once the target has been calculate approach the camera X and Y coordinates up to the desired point.
		x = uc_fixed_lerp(x, target_x, cam_mouse_shooter_acceleration);
		y = uc_fixed_lerp(y, target_y, cam_mouse_shooter_acceleration);
		
		break; #endregion
	
	#region Mouse Drag
	
	case CMODE.MOUSE_DRAG:
		
		// Get some coordinates
		var wincenterx = window_get_width()/2;
		var wincentery = window_get_height()/2;
		var mx_input = (window_mouse_get_x()-wincenterx)*dcos(view_inclination) -(window_mouse_get_y()-wincentery)*dsin(view_inclination) +wincenterx;
		var my_input = (window_mouse_get_x()-wincenterx)*dsin(view_inclination) +(window_mouse_get_y()-wincentery)*dcos(view_inclination) +wincentery;
		var w2v = view_width/window_get_width()*view_total_scale;
		
		// If we check the moving button pressed save the mouse position and the camera one
		if mouse_check_button_pressed(cam_mouse_drag_button) {
			cam_mouse_drag_mx = mx_input;
			cam_mouse_drag_my = my_input;
			cam_mouse_drag_cx = x;
			cam_mouse_drag_cy = y;
		}
		
		// Calculate the new camera position relative to the difference vs the saved variables
		if mouse_check_button(cam_mouse_drag_button) {
			x = cam_mouse_drag_cx - (mx_input-cam_mouse_drag_mx)*w2v;
			y = cam_mouse_drag_cy - (my_input-cam_mouse_drag_my)*w2v;
			
			// Calculate the inertia
			cam_mouse_drag_hspd = x-xprevious;
			cam_mouse_drag_vspd = y-yprevious;
		} else {
			if mouse_check_button_released(cam_mouse_drag_button) {
				target_x = x;
				target_y = y;
			}
			
			// Apply the inertia
			x += cam_mouse_drag_hspd;
			y += cam_mouse_drag_vspd;
			
			// Lerp the inertia to 0
			cam_mouse_drag_hspd = uc_fixed_lerp(cam_mouse_drag_hspd, 0, cam_mouse_drag_acceleration);
			cam_mouse_drag_vspd = uc_fixed_lerp(cam_mouse_drag_vspd, 0, cam_mouse_drag_acceleration);
			
			// Draw the target on the next step
			target_x += cam_mouse_drag_hspd;
			target_y += cam_mouse_drag_vspd;
			
			x = uc_fixed_lerp(x, target_x, cam_mouse_borders_acceleration);
			y = uc_fixed_lerp(y, target_y, cam_mouse_borders_acceleration);
		}
		
		
	break;
	
	#endregion
}

#endregion

// ==============================================================
// -------------------------------------------	CAMERA EFFECTS	-----------------------------------------
// ==============================================================
#region Calculate all the camera effects

// ------------------------------ View Scale and Auto-Scale -------------------------------

// Approach the camera to the target scale.
view_scale = uc_fixed_lerp(view_scale, view_scale_target, view_scale_acceleration);

// Calculate the auto scaling.
var target_auto_view_scale = view_auto_scale_enabled?clamp((1 + avg_dis_to_center*view_auto_scale_factor),view_scale_min_limit, view_scale_max_limit):1;
view_auto_scale = uc_fixed_lerp(view_auto_scale, target_auto_view_scale, view_scale_acceleration);

// Get the total multiplier
view_total_scale = view_scale*view_auto_scale

// ------------------------------------- Camera Rotation -------------------------------------
view_inclination += uc_fixed_lerp(0, angle_difference(view_inclination_target, view_inclination), view_inclination_acceleration);
view_inclination = view_inclination%360;
view_inclination_target = view_inclination_target%360;


// -------------------------------------------- Shake ---------------------------------------------

// Calculate the shaking.
if shake_enable {
	shake_enable = false;
	shake_current = shake_intensity;
}
var shake_dir = random(365);
var shake_x = lengthdir_x(shake_current*view_total_scale, shake_dir);
var shake_y = lengthdir_y(shake_current*view_total_scale, shake_dir);
shake_current = uc_fixed_lerp(shake_current, 0, shake_acceleration);

// -------------------------------------------- Hit --------------------------------------------------
hit_length = max(0,hit_length+hit_intensity*time_factor);
if (abs(hit_length)>hit_recovery) {
	hit_intensity = hit_intensity-hit_recovery*time_factor;
} else {
	hit_intensity = 0;	
	hit_length = 0;
}

var hit_x = lengthdir_x(hit_length*view_total_scale, hit_direction);
var hit_y = lengthdir_y(hit_length*view_total_scale, hit_direction);

// --------------------- Apply all the effect to the current view ------------------------

// Clamp the camera to the room bounds
if room_bounds_enabled {
	x = clamp(x, view_width*view_total_scale/2, room_width-view_width*view_total_scale/2);
	y = clamp(y, view_height*view_total_scale/2, room_height-view_height*view_total_scale/2);
	target_x = clamp(target_x, view_width*view_total_scale/2, room_width-view_width*view_total_scale/2);
	target_y = clamp(target_y, view_height*view_total_scale/2, room_height-view_height*view_total_scale/2);
}

// Now join all the different effects to calculate the view position and size
// relative to the camera position
view = view_camera[0];
primitive_view_x = x-view_width*view_total_scale/2+shake_x+hit_x;
primitive_view_y = y-view_height*view_total_scale/2+shake_y+hit_y;

view_x = x-((x-primitive_view_x)*dcos(-view_inclination) - (y-primitive_view_y)*dsin(view_inclination));
view_y = y-((x-primitive_view_x)*dsin(-view_inclination) + (y-primitive_view_y)*dcos(view_inclination));


camera_set_view_pos(view, primitive_view_x, primitive_view_y);
camera_set_view_size(view, view_width*view_total_scale, view_height*view_total_scale);
camera_set_view_angle(view, view_inclination);

#endregion

// ==============================================================
// -----------------------------------------------	DEBUG MODE	-----------------------------------------
// ==============================================================
#region Manage the debug mode

// Enabel and unable the debug mode
if keyboard_check_pressed(vk_f12) {
	uc_set_debug_mode(!uc_get_debug_mode());
}

#endregion