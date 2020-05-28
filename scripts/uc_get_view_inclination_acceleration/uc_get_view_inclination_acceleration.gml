/// @desc uc_get_scaing_acceleration

/*
	Getter of the view_inclination_acceleration variable.
	
	Returns:
		- The view_inclination_acceleration value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the view_inclination_acceleration.
return (Camera.view_inclination_acceleration);