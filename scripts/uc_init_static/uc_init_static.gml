/// @desc uc_init_static
/// @param acceleration

var acc = argument0;

/*
	This initializing function is made to set all the attributes of this mode.
	In this case we only ste the acceleration of the camera following the static point.
	
	Arguments:
		- acceleration (real): Value between 0 and 1 that sets the acceleration of the camera on this mode.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid acc.
if (acc<0 || acc>1) {
	uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
	acc = clamp(acc, 0, 1);
}

// Set all the variables for the static_mode.
Camera.cam_static_acceleration = acc;