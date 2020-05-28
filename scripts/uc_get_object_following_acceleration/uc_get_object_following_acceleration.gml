/// @desc uc_get_object_following_acceleration

/*
	This script is the getter for the cam_object_following_acceleration variable.
	
	Returns:
		- Value between 0 and 1 with the following acceleration.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the following acceleration value.
return (Camera.cam_object_following_acceleration);