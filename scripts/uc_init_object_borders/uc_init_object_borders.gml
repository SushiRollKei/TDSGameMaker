/// @desc uc_init_object_borders
/// @param horizontal_size
/// @param vertical_size
/// @param acceleration

var horizontal_size = argument0;
var vertical_size = argument1;
var acceleration = argument2;

/*
	This script is in charge of initializing the object_borders cam mode.
	Here we will set all the needed variables to make work this mode.
	
	Arguments:
		- horizontal_size (integer): Size of the horizontal borders that will limit the camera movement.
		- vertical_size (integer): Size of the vertical borders that will limit the camera movement.
		- acceleration (real): Value between 0 and 1 that set the speed the camera goes to the target.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid horizontal_size.
if (horizontal_size<0) {
	uc_error_message("CODE 02 - The given parameter (horizontal_size) is outside the boundaries. Value got clamped.");
	horizontal_size = clamp(horizontal_size, 0, 1);
}

// Check if we have a valid vertical_size.
if (vertical_size<0) {
	uc_error_message("CODE 02 - The given parameter (vertical_size) is outside the boundaries. Value got clamped.");
	vertical_size = clamp(vertical_size, 0, 1);
}

// Check if we have a valid spd.
if (acceleration<0 || acceleration>1) {
	uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
	acceleration = clamp(acceleration, 0, 1);
}

// Set all the variables for the object_borders mode.
Camera.cam_object_borders_horizontal_size = horizontal_size;
Camera.cam_object_borders_vertical_size = vertical_size;
Camera.cam_object_borders_acceleration = acceleration;