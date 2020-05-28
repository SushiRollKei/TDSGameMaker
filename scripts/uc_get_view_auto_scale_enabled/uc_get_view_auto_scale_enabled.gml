/// @desc uc_get_view_auto_scale_enabled

/*
	Getter of the view_auto_scale_enabled variable.
	
	Returns:
		- The view_auto_scale_enabled value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the view_auto_scale_enabled
return (Camera.view_auto_scale_enabled);