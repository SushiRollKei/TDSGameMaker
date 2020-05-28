/// @desc uc_set_view_auto_scale_enabled
/// @param (optional)enable
/// @param (optional)scaling_factor

if (argument_count>=1) var enable = argument[0];
if (argument_count==2) var factor = argument[1];

/*
	Setter of the view_auto_scale_enabled variable.
	
	Arguments:
		- view_auto_scale_enabled (bool): If we want to auto scale the view true, if not, false.
		(Optional)
		- scaling_factor (real): value that relates the average distance between objects and the scale of the view..
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid enable value.
if (argument_count>=1) {
	if (enable<0 || enable>1) {
		uc_error_message("CODE 02 - The given parameter (enable) is outside the boundaries. Value got clamped.");
		enable = clamp(enable, 0, 1);
	}
}

// Check if we have a valid cam scaling_factor.
if (argument_count==2) {
	if (factor<0 || factor>1) {
		uc_error_message("CODE 02 - The given parameter is outside the boundaries. Value got clamped.");
		factor = clamp(factor, 0, 1);
	}
}

// Sets the view_auto_scale_enable value
Camera.view_auto_scale_enabled = (argument_count>=1)?enable:!(uc_get_view_auto_scale_enabled());
if (argument_count==2) Camera.view_auto_scale_factor = factor;