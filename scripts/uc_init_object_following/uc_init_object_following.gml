/// @desc uc_init_object_following
/// @param acceleration

var acc = argument0;

/*
	This script is in charge of setting all the needed variables for the instance following mode.
	In this case we only need the following acceleration variable.
	
	Arguments:			
		- acceleration (real): Is the amount of acceleration we will be following the middle point
			of all the coordinates given by the IDs. Must be a value between 0 and 1.
		
	Returns:
		- This script returns no value.
*/


// Check if the Camera instance exists. If not, give a message error and exit the script.
if (!instance_exists(Camera)) {
	uc_error_message("CODE 01 - The Camera instance does not exist in the room.");
	exit;
}

// Check if we have a valid cam following_acceleration.
if (acc>1 || acc<0) {
	uc_error_message("CODE 02 - The given parameter (acceleration) is outside the boundaries. Value got clamped.");
	acc = clamp(acc, 0, 1);
}

// Apply the acceleration change.
Camera.cam_object_following_acceleration = acc;