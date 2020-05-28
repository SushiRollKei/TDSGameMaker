/// @desc uc_get_flash_speed

/*
	Getter for the flash speed pair of variables
	
	Returns:
		- This script returns an array with the value between 0 and 1 with the in speed
		and out speed of the flash.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the array with the two speeds.
return [Camera.flash_in_speed, Camera.flash_out_speed];