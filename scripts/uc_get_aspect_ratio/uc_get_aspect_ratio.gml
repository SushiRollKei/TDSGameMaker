/// @desc uc_get_aspect_ratio


/*
	This script is the getter for the camera aspect_ratio value.
	
	Returns:
		- The aspect_ratio value of the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the camera aspect_ratio value.
return (Camera.aspect_ratio);