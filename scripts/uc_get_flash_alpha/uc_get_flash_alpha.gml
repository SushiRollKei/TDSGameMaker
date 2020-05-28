/// @desc uc_get_flash_alpha

/*
	Getter for the flash max alpha variable of the camera.
	
	Returns:
		- This script returns a value between 0 and 1 with the max alpha of the flash.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the max alpha of the flash.
return Camera.flash_max_alpha;