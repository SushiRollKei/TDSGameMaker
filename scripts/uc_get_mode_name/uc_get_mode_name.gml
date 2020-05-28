/// @desc uc_get_mode_name

/*
	This script returns the current camera mode name.
	
	Returns:
		- This script returns a string with the current camera mode
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Acces to the cam mode string list withing the cam_mode position and return the given string.
return Camera.cam_mode_string_list[Camera.cam_mode];