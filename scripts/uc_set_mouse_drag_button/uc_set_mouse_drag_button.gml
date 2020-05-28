/// @desc uc_set_mouse_drag_button
/// @param button

var button = argument0;

/*
	Setter of the cam_mouse_drag_button variable.
	
	Arguments:
		- button (mouse button constant): ID of the mouse button we want to use for moving in this mode.
	
	Returns:
		- This script returns no value.
*/

// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid mouse button.
if (button<0) || (button>4) {
	uc_error_message("CODE 06 - The given mouse button constant does not relates to a valid mouse button.");
	exit;
}

// Sets the cam_mouse_drag_button value
Camera.cam_mouse_drag_button = button;