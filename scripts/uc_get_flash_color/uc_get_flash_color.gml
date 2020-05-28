/// @desc uc_get_flash_color

/*
	Getter for the flash color of the camera.
	
	Returns:
		- This script returns the color of the flash.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the color of the flash.
return Camera.flash_color;