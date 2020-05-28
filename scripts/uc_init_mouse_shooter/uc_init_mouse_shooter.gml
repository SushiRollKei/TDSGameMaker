/// @desc uc_init_mouse_shooter
/// @param percentage
/// @param acceleration

var percentage = argument0;
var acceleration = argument1;

/*
	This script is in charge of initializing the mouse shooter cam mode.
	Here we will set all the needed variables to make work this mode.
	
	Arguments:
		- percentage (real): Position between the player and the mouse where 0 is the player and 1 is the mouse.
		- acceleration (real): Value between 0 and 1 that sets the speed the camera follows the target.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid percentage.
if (percentage<0 || percentage>1) {
	uc_error_message("CODE 02 - The given parameter (percentage) is outside the boundaries. Value got clamped.");
	percentage = clamp(percentage, 0, 1);
}

// Check if we have a valid acceleration.
if (acceleration<0 || acceleration>1) {
	uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
	acceleration = clamp(acceleration, 0, 1);
}

// Set all the variables for the mouse_shooter mode.
Camera.cam_mouse_shooter_percentage = percentage;
Camera.cam_mouse_shooter_acceleration = acceleration;