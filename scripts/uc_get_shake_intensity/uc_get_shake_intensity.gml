/// @desc uc_get_shake_intensity

/*
	Getter of the shake_intensity variable.
	
	Returns:
		- The shake_intensity value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the shake_intensity.
return (Camera.shake_intensity);