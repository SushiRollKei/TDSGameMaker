/// @desc uc_get_bars_enabled

/*
	Getter for the enable state of the camera bars.
	
	Returns:
		- This scripts returns a boolean with the camera state.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the camera bars enabled.
return Camera.bars_enabled;