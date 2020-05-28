/// @desc uc_get_bars_color

/*
	Getter for the bars_color variable.
	
	Returns:
		- This script returns the color of the bars drawn by the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the color of the bars.
return Camera.bars_color;