/// @desc uc_get_mode


/*
	This script returns the current camera mode.
	
	Returns:
		- This script returns a string with the current camera mode
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the cam_mode value.
return Camera.cam_mode;