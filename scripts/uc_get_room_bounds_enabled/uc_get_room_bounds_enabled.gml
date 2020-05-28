/// @desc uc_get_room_bounds_enabled


/*
	Getter of the room_bounds_enabled variable of the camera.
	
	Returns:
		- The room_bounds_enabled value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the room_bounds_enabled value.
return (Camera.room_bounds_enabled);