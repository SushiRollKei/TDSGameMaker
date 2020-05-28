/// @desc uc_get_view_x


/*
	This script is the getter for the camera view_x value.
	
	Returns:
		- The view_x value of the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the camera view_x value.
return (Camera.view_x);