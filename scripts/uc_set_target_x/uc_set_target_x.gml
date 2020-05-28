/// @desc uc_set_target_x
/// @param target_x

var xx = argument0;

/*
	Setter of the target_x value of the camera.
	
	Arguments:
		- target_x (integer): Value of the desired target_value
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Sets the target_x value.
Camera.target_x = xx;