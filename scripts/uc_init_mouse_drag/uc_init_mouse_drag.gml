/// @desc uc_init_mouse_drag
/// @param acceleration

var acceleration = argument0;

/*
	This script is in charge of initializing the mouse drag cam mode.
	Here we will set all the needed variables to make work this mode.
	
	Arguments:
		- acceleration (real): Value between 0 and 1 that sets the speed the camera will be following the target.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid acceleration.
if (acceleration<0 || acceleration>1) {
	uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
	acceleration = clamp(acceleration, 0, 1);
}

// Set all the variables for the mouse_drag mode.
Camera.cam_mouse_drag_acceleration = acceleration;