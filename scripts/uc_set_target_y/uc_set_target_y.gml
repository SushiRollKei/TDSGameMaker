/// @desc uc_set_target_y
/// @param target_y

var yy = argument0;

/*
	Setter of the target_y value of the camera.
	
	Arguments:
		- target_y (integer): Value of the desired target_y value.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Sets the target_y value.
Camera.target_y = yy;