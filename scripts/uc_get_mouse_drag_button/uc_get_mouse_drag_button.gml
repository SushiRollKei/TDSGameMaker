/// @desc uc_get_mouse_drag_button

/*
	Getter of the cam_mouse_drag_button variable.
	
	Returns:
		- The cam_mouse_drag_button value from the camera.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Return the cam_mouse_drag_button.
return (Camera.cam_mouse_drag_button);