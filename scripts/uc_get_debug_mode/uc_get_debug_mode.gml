/// @desc uc_get_debug_mode

/*
	Getter of the debug_mode variable of the camera.
	
	Returns:
		- The debug_mode value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the camera_debug_mode value.
return (Camera.camera_debug_mode);