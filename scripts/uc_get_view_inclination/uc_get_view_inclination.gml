/// @desc uc_get_view_inclination

/*
	Getter of the view_inclination variable.
	
	Returns:
		- The view_inclination value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the view_inclination.
return (Camera.view_inclination_target);