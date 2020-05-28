/// @desc uc_set_x
/// @param X

var xx = argument0;

/*
	Setter of the x position of the camera.
	
	Arguments:
		- x (integer): Value of the desired target_x position.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Sets the target_x value.
Camera.x = xx;