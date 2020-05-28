/// @desc uc_set_view_inclination
/// @param inclination
/// @param (optional)view_inclination_acceleration

var inclination = argument[0];
if (argument_count==2) var acc = argument[1];

/*
	Setter of the view_inclination_target variable. It will make view_inclination approach at inclination_acceleration.
	
	Arguments:
		- inclination (real): Value inclination we want to multiply the size of the width for.
		(Optional)
		- acceleration (real): Value between 0 and 1 that sets the how fast the camera reaches the target inclination.
	
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid cam view_inclination_acceleration.
if (argument_count==2) {
	if (acc>1 || acc<0) {
		uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
		acc = clamp(acc, 0, 1);
	}
}

// Sets the view_inclination and view_inclination_acceleration values.
Camera.view_inclination_target = inclination;
if (argument_count==2) Camera.view_inclination_acceleration = acc;