/// @desc uc_get_y


/*
	This script is the getter for the camera target_y position.
	
	Returns:
		- The target_y value of the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the target_y value.
return (Camera.y);