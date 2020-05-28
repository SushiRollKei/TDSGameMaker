/// @desc uc_window_center


/*
	This script is in charge of centering the window where the game is being displayed.
	This function is made to resize the window size and center the camera in the same code space.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Call the alarm[0] in the next step of the game so we can center the camera in the object event.
Camera.alarm[0] = 1;