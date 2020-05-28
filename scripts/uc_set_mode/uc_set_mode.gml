/// @desc uc_set_mode
/// @param mode

var mode = argument0;

/*
	This script is in charge of changing the camera mode in a controlled way.
	Instead of accessing the Camera.cam_mode variable from another object just call this script.
	
	Arguments:
		- mode (integer): contains the cam_mode the camera will change to.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if the given camera mode is valid. If not, give a message error and exit the script.
if (mode >= CMODE.CMODE_SIZE) || (mode < 0) {
	uc_error_message("CODE 03 - The Camera has no CMODE with code: " + string(mode) + ".");
	exit;
}

// Change the cam_mode to mode.
Camera.cam_mode = mode;