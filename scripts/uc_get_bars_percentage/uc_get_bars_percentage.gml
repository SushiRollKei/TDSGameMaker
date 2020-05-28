/// @desc uc_get_bars_percentage

/*
	Getter for the percentage of the camera bars.
	
	Returns:
		- This script returns a value between 0 and 1 representing the percentage of screen covered by the bars.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the percentage.
return Camera.bars_percentage;