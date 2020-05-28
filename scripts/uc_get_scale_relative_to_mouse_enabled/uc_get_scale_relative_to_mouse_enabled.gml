/// @desc uc_get_scale_relative_to_mouse_enabled

/*
	Getter of the scale relative to mouse variable of the camera.
	
	Returns:
		- The scale relative to mouse value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the scale_relative_to_mouse_enabled value.
return (Camera.scale_relative_to_mouse_enabled);