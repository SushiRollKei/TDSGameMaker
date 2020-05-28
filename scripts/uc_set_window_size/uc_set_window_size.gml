/// @desc uc_set_window_size
/// @param (optional)width
/// @param (optional)height

if (argument_count==2) {
	var width = argument[0];
	var height = argument[1];
}

/*
	This function is in charge of setting the width and height of the window port where teh game is being displayed.
	Both values must be more than 1. If widht and height are not given the script will set the as port_width and port_height
	the view size of the camera.

	Arguments:
		(Optional)
		- width (Integer): Width of the window where the game is being displayed.
		- height (Integer): Height of the window where the game is being displayed.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}


// Check if the window width and height values are valid.
if (argument_count==2) {
	if (width<1) {
		uc_error_message("CODE 02 - The given parameter (width) is outside the boundaries. Value got clamped.");
		width = 1;
	}

	if (height<1) {
		uc_error_message("CODE 02 - The given parameter (height) is outside the boundaries. Value got clamped.");
		height = 1;
	}
}

// Sets the port width and height values.
if (argument_count==2) {
	// If we got given some specific width and height from the arguments set it.
	Camera.port_width = width;
	Camera.port_height = height;
} else {
	// In case width and height are not specified use view width and height.
	Camera.port_width = Camera.view_width;
	Camera.port_height = Camera.view_height;
}

// Apply changes
window_set_size(Camera.port_width, Camera.port_height);
surface_resize(application_surface, Camera.port_width, Camera.port_height);
display_set_gui_size(display_get_gui_height()*Camera.aspect_ratio, display_get_gui_height());
uc_window_center();