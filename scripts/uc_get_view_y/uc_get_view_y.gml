/// @desc uc_get_view_y


/*
	This script is the getter for the camera view_y value.
	
	Returns:
		- The view_y value of the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not eyist in the room.");
	exit;
}

// Return the camera view_y value.
return (Camera.view_y);