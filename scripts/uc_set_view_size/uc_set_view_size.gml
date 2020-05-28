/// @desc uc_set_view_size
/// @param width
/// @param height

var width = argument0;
var height = argument1;

/*
	This function is in charge of setting the amount of horizontal and vertical pixels viewed by de camera in the room.
	
	Arguments:
		- width (integer): Width of the camera.
		- heigh (integer): Height of the camera.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if the view width has a valid value.
if (width<1) {
	uc_error_message("CODE 02 - The given parameter (width) is outside the boundaries. Value got clamped.");
	width = 1;
}

// Check if the view height has a valid value.
if (height<1) {
	uc_error_message("CODE 02 - The given parameter (height) is outside the boundaries. Value got clamped.");
	height = 1;
}

// Set the view_width and view_height values.
Camera.view_width = width;
Camera.view_height = height;

// Calculate the aspect ratio.
Camera.aspect_ratio = width/height;
