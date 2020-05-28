/// @desc uc_init_mouse_borders
/// @param borders_size
/// @param max_speed
/// @param acceleration

var borders_size = argument0;
var max_speed = argument1;
var acceleration = argument2;

/*
	This script is in charge of initializing the mouse borders cam mode.
	Here we will set all the needed variables to make work this mode.
	
	Arguments:
		- borders_size (integer): Size of the borders of the screen that will trigger the camera movement.
		- max_speed (real): Value that sets the maximum number of pixels the camera can move every step.
		- acceleration (real): Value between 0 and 1 that sets the time it gets to reach the max_speed.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid borders_size.
if (borders_size<0) {
	uc_error_message("CODE 02 - The given parameter (borders_size) is outside the boundaries. Value got clamped.");
	borders_size = clamp(borders_size, 0, 1);
}

// Check if we have a valid max_speed.
if (max_speed<0) {
	uc_error_message("CODE 02 - The given parameter (max_speed) is outside the boundaries. Value got clamped.");
	max_speed = clamp(max_speed, 0, 1);
}

// Check if we have a valid acceleration.
if (acceleration>1 || acceleration<0) {
	uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
	acceleration = clamp(acceleration, 0, 1);
}

// Set all the variables.
Camera.cam_mouse_borders_size = borders_size;
Camera.cam_mouse_borders_maxspeed = max_speed;
Camera.cam_mouse_borders_acceleration = acceleration;