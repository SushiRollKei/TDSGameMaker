/// @desc uc_get_view_scale

/*
	Getter of the view_scale variable.
	
	Returns:
		- The view_scale value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the view_scale.
return (Camera.view_scale_target);