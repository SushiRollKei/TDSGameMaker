/// @desc uc_set_scale_relative_to_mouse_enabled
/// @param enable

if (argument_count>0) {
	var enable = argument[0];
}

/*
	Enables or disables the scaling relative to mouse. If no argument is given, it will just set the opposite state.
	
	Arguments:
		(Optional)
		- enable (bool): If we want to enable the scaling relative to mouse true, if not, false.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

if (argument_count>0) {
	if ((enable<0 || enable>1)) {
		uc_error_message("CODE 02 - The given parameter (enable) is outside the boundaries. Value got clamped.");
		enable = abs(clamp(enable, 0, 1));
	}
}

// Sets the scale_relative_to_mouse value
Camera.scale_relative_to_mouse_enabled = (argument_count>0)?enable:!(uc_set_scale_relative_to_mouse_enabled());