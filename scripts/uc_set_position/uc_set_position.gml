/// @desc uc_set_position
/// @param X
/// @param Y

var xx = argument0;
var yy = argument1;

/*
	Setter of the x and y position of the camera.
	
	Arguments:
		- x (integer): Value of the desired x position.
		- y (integer): Value of the desired y position.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Sets the x and y value.
uc_set_x(xx);
uc_set_y(yy);