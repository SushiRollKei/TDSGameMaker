/// @desc uc_get_port_height


/*
	This script is the getter for the camera port_height value.
	
	Returns:
		- The port_height value of the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the camera port_height value.
return (Camera.port_height);