/// @desc uc_get_object_borders_vertical_size

/*
	Getter of the cam_object_borders_vertical_size variable.
	
	Returns:
		- The cam_object_borders_vertical_size value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the cam_object_borders_vertical_size.
return (Camera.cam_object_borders_vertical_size);