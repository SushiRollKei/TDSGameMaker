/// @desc uc_get_bars_acceleration

/*
	Getter for the bars_acceleration variable of the camera.
	
	Returns:
		- This script returns a value between 0 and 1 with the speed of the bars.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the bars_acceleration variable.
return Camera.bars_acceleration;