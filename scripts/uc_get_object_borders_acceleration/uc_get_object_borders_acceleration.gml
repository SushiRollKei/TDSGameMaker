/// @desc uc_get_object_borders_acceleration

/*
	Getter of the cam_object_borders_acceleration variable.
	
	Returns:
		- The cam_object_borders_acceleration value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the cam_object_borders_acceleration.
return (Camera.cam_object_borders_acceleration);