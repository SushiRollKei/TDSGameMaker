/// @desc uc_get_hit_recovery

/*
	Getter for the hit_recovery variable of the camera.
	
	Returns:
		- This script returns an integer.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the hit_recovery variable.
return Camera.hit_recovery;