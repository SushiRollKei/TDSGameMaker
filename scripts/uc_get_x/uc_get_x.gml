/// @desc uc_get_x


/*
	This script is the getter for the camera target_x value.
	
	Returns:
		- The target_x value of the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the X value.
return (Camera.x);