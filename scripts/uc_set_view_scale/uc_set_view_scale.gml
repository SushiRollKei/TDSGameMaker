/// @desc uc_set_view_scale
/// @param scale
/// @param (optional)view_scale_acceleration

var scale = argument[0];
if (argument_count==2) var acc = argument[1];

/*
	Setter of the view_scale_target variable. It will make view_scale approach at scale_acceleration.
	The view_scale will multiply the current width and height of the view.
	Also the given scale value can not be above the max limit neither under the min limit.
	
	Arguments:
		- scale (real): Value scale we want to multiply the size of the width for.
		(Optional)
		- acceleration (real): Value between 0 and 1 that sets the how fast the camera reaches the target size.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if the given scale is in between the boundaries. If not, it clamps the value.
if (scale>Camera.view_scale_max_limit || scale<Camera.view_scale_min_limit) {
	uc_error_message("CODE 02 - The given parameter (scale) is outside the boundaries. Value got clamped.");
	scale = clamp(scale, Camera.view_scale_min_limit, Camera.view_scale_max_limit);
}

// Check if we have a valid cam view_scale_acceleration.
if (argument_count==2) {
	if (acc>1 || acc<0) {
		uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
		acc = clamp(acc, 0, 1);
	}
}

// Sets the view_scale and view_scale_acceleration values.
Camera.view_scale_target = scale;
if (argument_count==2) Camera.view_scale_acceleration = acc;

// Update the camera position relative to the mouse
with (Camera) {
	if scale_relative_to_mouse_enabled {
		var dir2mouse = point_direction(view_x, view_y, mouse_x, mouse_y);
		var dist2mouse = point_distance(view_x, view_y, mouse_x, mouse_y);
		
		var xper = lengthdir_x(dist2mouse, dir2mouse)/(view_width*view_total_scale);
		var yper = lengthdir_y(dist2mouse, dir2mouse)/(view_height*view_total_scale);
		
		var half_w = view_width*view_auto_scale*scale/2;
		var half_h = view_height*view_auto_scale*scale/2;
		
		primitive_view_x = mouse_x-view_width*view_auto_scale*scale*xper;
		primitive_view_y = mouse_y-view_height*view_auto_scale*scale*yper;
		
		target_x = primitive_view_x + half_w*dcos(-view_inclination) + half_h*dsin(-view_inclination);
		target_y = primitive_view_y + half_w*dsin(-view_inclination) + half_h*dcos(-view_inclination);
	}
}