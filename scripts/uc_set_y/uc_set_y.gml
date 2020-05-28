/// @desc uc_set_y
/// @param Y

var yy = argument0;

/*
	Setter of the target_y position of the camera.
	
	Arguments:
		- y (integer): Value of the desired target_y position.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Sets the target_y value.
Camera.y = yy;